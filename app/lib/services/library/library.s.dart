import 'dart:convert';
import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:flamingo/flamingo.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

import '../../app/constants/constants.dart';
import '../../app/core/core.dart';
import '../../app/database/database.dart';
import '../../app/extensions/extensions.dart';
import '../../models/models.dart';
import 'library.i.dart';

final _log = Logger('LibraryService');

@Singleton(as: LibraryServiceInterface, signalsReady: false)
class LibraryService with ReactiveServiceMixin implements LibraryServiceInterface {
  final Box<Product> _productsBox;
  final Box<Brand> _brandBox;
  final libraryStorageBucket = FirebaseStorage.instanceFor(bucket: 'gs://glarehub-library');
  final SharedPreferences _preferences;

  LibraryService._({
    required Box<Product> productBox,
    required Box<Brand> brandBox,
    required SharedPreferences preferences,
  })  : _productsBox = productBox,
        _brandBox = brandBox,
        _preferences = preferences;

  ///@ Initialization future
  @factoryMethod
  static Future<LibraryService> init() async {
    _log.fine('Initializing LibraryService from @factoryMethod');
    final preferences = await SharedPreferences.getInstance();
    final libraryService = LibraryService._(
      productBox: await Hive.openBox<Product>(DatabaseConstants.productsBoxName),
      brandBox: await Hive.openBox<Brand>(DatabaseConstants.brandsBoxName),
      preferences: preferences,
    );

    //= Load the local library files into Hive database
    if (libraryService._productsBox.isEmpty && libraryService._brandBox.isEmpty) {
      _log.fine('Loading and writing factory library (_writeFactoryLibrary)');
      final result = await libraryService._writeFactoryLibrary();

      if (result.hasLeft) {
        _log.severe('Error while _writeFactoryLibrary:\n${result.map((e) => e.toString()).join('\n')}');
        throw UnknownError(result);
      } else {
        _log.fine('Wrote ${libraryService._productsBox.length} products and ${libraryService._brandBox.length} brands');
      }
    }
    _log.fine('Library service initialized');

    return libraryService;
  }

  //-                                                                    GETTERS & SETTERS

  @override
  Iterable<Product> get products => _productsBox.values;

  @override
  Option<Product> productForKey(String key) => optionOf(_productsBox.get(key));

  @override
  List<Option<Product>> productsForKeys(List<String> keys) =>
      keys.map<Option<Product>>((key) => optionOf(_productsBox.get(key))).toList();

  @override
  Iterable<Brand> get brands => _brandBox.values;

  @override
  Option<Brand> brandForKey(String key) => optionOf(_brandBox.get(key));

  //-                                                                            FUNCTIONS

  @override
  Future<bool> checkForUpdates() async => (await _fetchLatestLibraryVersion()).fold(
        () {
          _log.warning('_fetchLatestLibraryVersion returned an empty value');
          return false;
        },
        (remoteVersion) => _isLocalLibraryOutdated(remoteVersion),
      );

  @override
  Future<Either<AppFailure, dynamic>> updateLocalLibrary() async {
    final remoteVersion = (await _fetchLatestLibraryVersion()).getOrFailure('_fetchLatestLibraryVersion');
    if (remoteVersion.isLeft()) return Left(remoteVersion.leftOrThrow);

    final result = await Future.wait<Either<AppFailure, void>>([
      _downloadBrandLibraryDataForVersion(remoteVersion.rightOrThrow)
          .then<Either<AppFailure, Map<String, Brand>>>((maybeRawString) => maybeRawString.fold(
                (l) => Left(l),
                (r) => _parseBrandDataFromJsonString(r),
              ))
          .then<Either<AppFailure, void>>((maybeParsedBrandData) => maybeParsedBrandData.fold(
                (l) => Left(l),
                (r) => _writeBrandsToLocalLibraryData(r),
              )),
      _downloadProductLibraryDataForVersion(remoteVersion.rightOrThrow)
          .then<Either<AppFailure, Map<String, Product>>>((maybeRawString) => maybeRawString.fold(
                (l) => Left(l),
                (r) => _parseProductDataFromJsonString(r),
              ))
          .then<Either<AppFailure, void>>((maybeProductParsedData) => maybeProductParsedData.fold(
                (l) => Left(l),
                (r) => _writeProductsToLocalLibraryData(r),
              )),
    ]);

    if (result.hasLeft) {
      //LOOSERROR unreported
      final errors = result.allLeft;
      _log.severe(
          'Errors found while updateLocalLibrary: ${errors.length}\n${errors.map((e) => e.toString()).join('\n')}');
      //= clean and revert to factory database
      _log.info('cleaning factory database due to error');
      await Future.wait([_brandBox.clear(), _productsBox.clear()]).then((value) => _writeFactoryLibrary());
      _log.warning('Library data could not be updated to ${remoteVersion.rightOrThrow}\n\n$errors');
      return Left(AppFailure.unknownError(errors));
    }

    return const Right(true);
  }

  //-                                                                              HELPERS

  ///@ Reads the assets data files and populates the database with their data
  Future<List<Either<AppFailure, void>>> _writeFactoryLibrary() async => Future.wait([
        rootBundle
            .loadStructuredData('assets/data/brands.json', (raw) async => _parseBrandDataFromJsonString(raw))
            .then<Either<AppFailure, void>>((maybeParsedBrandData) => maybeParsedBrandData.fold(
                (failure) => Left(failure), (parsedData) => _writeBrandsToLocalLibraryData(parsedData))),
        rootBundle
            .loadStructuredData('assets/data/products.json', (raw) async => _parseProductDataFromJsonString(raw))
            .then<Either<AppFailure, void>>((maybeParsedProductData) => maybeParsedProductData.fold(
                (failure) => Left(failure), (parsedData) => _writeProductsToLocalLibraryData(parsedData)))
      ]);

  ///@ Parse json string to Products
  Either<AppFailure, Map<String, Product>> _parseProductDataFromJsonString(String rawJson) {
    final Map<String, Product> products = {};
    final Map<String, dynamic> erroredKeys = {};
    jsonDecode(rawJson).forEach(
      (key, value) {
        try {
          products.addEntries([MapEntry(key, Product.fromJson(value))]);
        } catch (error) {
          erroredKeys.addEntries([MapEntry(key, error)]);
        }
      },
    );
    return erroredKeys.isEmpty ? Right(products) : Left(ParseJsonFailure(erroredKeys));
  }

  ///@ Parse json string to Brands
  Either<AppFailure, Map<String, Brand>> _parseBrandDataFromJsonString(String rawJson) {
    final Map<String, Brand> brands = {};
    final Map<String, dynamic> erroredKeys = {};
    jsonDecode(rawJson).forEach(
      (key, value) {
        try {
          brands.addEntries([MapEntry(key, Brand.fromJson(value))]);
        } catch (error) {
          erroredKeys.addEntries([MapEntry(key, error)]);
        }
      },
    );
    return erroredKeys.isEmpty ? Right(brands) : Left(ParseJsonFailure(erroredKeys));
  }

  ///@ Fetch the latest Glare Hub Metadata document from firestore and returns the libraryVersion field
  Future<Option<String>> _fetchLatestLibraryVersion() async {
    try {
      final List<IluramaMeta> metaDocs = await CollectionPaging<IluramaMeta>(
        query: IluramaMeta().collectionRef.orderBy('createdAt', descending: true),
        limit: 1,
        decode: (snap) => IluramaMeta(snapshot: snap),
      ).load();
      return metaDocs.isEmpty ? none() : optionOf(metaDocs.first.libraryVersion);
    } catch (error) {
      _log.severe(error);
      return none();
    }
  }

  ///@ Returns true if the provided version is higher than the local version
  bool _isLocalLibraryOutdated(String remoteVersion) =>
      optionOf(_preferences.getString(PreferenceKeys.localLibraryVersionKey)).fold<bool>(() => false,
          (localVersion) => optionOf(double.tryParse(localVersion)).getOrElse(() => 0.0) > double.parse(remoteVersion));

  ///@ Update local library version and returns either the version if succesful or the error
  // Future<Either<AppFailure, String>> _updateLocalLibraryVersion(String newVersion) async {
  //   try {
  //     final write = await _preferences.setString(PreferenceKeys.localLibraryVersionKey, newVersion);
  //     return write ? Right(newVersion) : Left(UnknownError('Could not write $newVersion version to SharedPreferences'));
  //   } catch (error) {
  //     return Left(UnknownError(error));
  //   }
  // }

  ///@ Download the product library data from the version folder in firebase storage bucket
  Future<Either<AppFailure, String>> _downloadProductLibraryDataForVersion(String version) async {
    try {
      final data = String.fromCharCodes(
        optionOf(
          (await libraryStorageBucket.ref('$version/products.json').getData()),
        ).getOrElse(() => Uint8List(0)),
      );
      return data.isEmpty ? Left(EmptyValueReceived('_downloadProductLibraryDataForVersion($version)')) : Right(data);
    } catch (e) {
      rethrow;
    }
  }

  ///@ Download the brand library data from the version folder in firebase storage bucket
  Future<Either<AppFailure, String>> _downloadBrandLibraryDataForVersion(String version) async {
    try {
      final data = String.fromCharCodes(
        optionOf(await libraryStorageBucket.ref('$version/brands.json').getData()).getOrElse(() => Uint8List(0)),
      );
      return some(data).getOrFailure('_downloadBrandLibraryDataForVersion($version)');
    } catch (error) {
      return Left(UnknownError(error));
    }
  }

  ///@ Writes the provided values to the respective boxes
  Future<Either<AppFailure, void>> _writeProductsToLocalLibraryData(Map<String, Product> products) async {
    try {
      return await _productsBox.putAll(products).then((v) => const Right(null));
    } catch (error) {
      return Left(UnknownError(error));
    }
  }

  ///@ Writes the provided values to the respective boxes
  Future<Either<AppFailure, void>> _writeBrandsToLocalLibraryData(Map<String, Brand> brands) async {
    try {
      return await _brandBox.putAll(brands).then((v) => const Right(null));
    } catch (error) {
      return Left(UnknownError(error));
    }
  }
}
