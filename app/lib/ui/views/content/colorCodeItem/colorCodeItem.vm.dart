import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flamingo/flamingo.dart' hide Collection;
import 'package:flutter/cupertino.dart';
import 'package:ilurama/app/extensions/extensions.dart';
import 'package:stacked/stacked.dart';

import '../../../../app/locator/locator.dart';
import '../../../../app/orphan_types.dart';
import '../../../../entities/color_item/color_item.dart';
import '../../../../models/models.dart';
import '../../../../services/content/content.dart';
import '../../../../services/library/library.dart';
import '../../../widgets/widgets.dart';

class ColorCodeItemViewModel extends FutureViewModel {
  String colorCodeId;
  ColorCode _colorCodeItem;
  final LibraryServiceInterface _libraryService;
  final ContentServiceInterface _contentService;

  ColorCodeItemViewModel(
    this.colorCodeId, {
    LibraryService? libraryService,
    ContentService? contentService,
  })  : _colorCodeItem = ColorCode(id: colorCodeId),
        _libraryService = libraryService ?? getIt<LibraryServiceInterface>(),
        _contentService = contentService ?? getIt<ContentServiceInterface>();

  ColorCode get colorCodeItem => _colorCodeItem;
  final List<Tuple2<String?, Product>> _colorCodeRelatedProducts = [];
  List<Tuple2<String?, Product>> get colorCodeRelatedProducts => _colorCodeRelatedProducts;
  final List<Collection> _collectionsWithThisColorCode = [];
  List<Collection> get collectionsWithThisColorCode => _collectionsWithThisColorCode;
  StreamSubscription<DocumentSnapshot<Map<String, dynamic>>>? subscription;

  @override
  void dispose() {
    subscription?.cancel();
    super.dispose();
  }

  @override
  Future<void> futureToRun() async {
    if (subscription != null) await subscription?.cancel();
    subscription = firestoreInstance.doc(_colorCodeItem.reference.path).snapshots().listen((collectionSnapshot) {
      _colorCodeItem = ColorCode(snapshot: collectionSnapshot);
      setBusy(true);
      hydrateColorCode().then((_) => setBusy(false)).catchError((e) {
        setBusy(false);
        setError(e);
      });
    });
  }

  Future<void> hydrateColorCode() async {
    //= Hydrate Related Products
    _colorCodeRelatedProducts.clear();
    _colorCodeRelatedProducts.addAll((_colorCodeItem.relatedProducts ?? [])
        .map<Tuple2<String?, Product>?>((colorCodeRelation) => optionOf(colorCodeRelation.productKey).fold(
              () => null,
              (productKey) => _libraryService.productForKey(colorCodeRelation.productKey!).fold(
                    () => null,
                    (product) => Tuple2(colorCodeRelation.relationDescription, product),
                  ),
            ))
        .toList()
        .toNonNull);

    //= Hydrate Collections containing this Color Code
    _collectionsWithThisColorCode.clear();
    _collectionsWithThisColorCode.addAll(
      _contentService.allUserCollections.where(
        (collection) => (collection.colorCodes ?? []).contains(_colorCodeItem.id),
      ),
    );
  }

  final ValueNotifier<double> fader = ValueNotifier<double>(0);
  void fade(double value) => fader
    ..value = value
    ..notifyListeners();

  Map<String, ColorItem> get relatedColorItems => optionOf(colorCodeItem.relatedProducts).fold<Map<String, ColorItem>>(
        () => {},
        (relations) => relations
            .map<ColorItem?>((relation) {
              if (relation.productKey == null) return null;
              return _libraryService
                  .productForKey(relation.productKey!)
                  .fold(() => null, (product) => ColorItem.fromProduct(product));
            })
            .toList()
            .toNonNull
            .asMap()
            .map<String, ColorItem>((key, colorItem) => MapEntry(colorItem.key, colorItem)),
      );

  ///@ Item's menu options
  List<StarMenuItem<ColorCodeItemActions>> get menuItems => [
        StarMenuItem('menu_items.add_to_collection'.tr(), CupertinoIcons.plus_square_on_square,
            const AddColorCodeItemToCollection()),
        StarMenuItem('menu_items.link_to_product'.tr(), CupertinoIcons.link, const LinkColorCodeToProduct()),
        StarMenuItem('menu_items.edit'.tr(), CupertinoIcons.pencil, const EditColorCode()),
        StarMenuItem('menu_items.delete'.tr(), CupertinoIcons.trash, const DeleteColorCode()),
      ];

  Future<bool> addItemToCollection(String? collectionKey) async {
    if (collectionKey == null) return false;
    try {
      final collection = _contentService.allUserCollections.firstWhere((e) => e.id == collectionKey);
      // ignore: prefer_collection_literals
      collection.colorCodes = Set<String>.from([...(collection.colorCodes ?? []), _colorCodeItem.id]).toList();
      await DocumentAccessor().update(collection);
      await hydrateColorCode();
    } catch (e) {
      //LOOSERROR unhandled (firstWhere may throw an exception if nothing is found)
      setError(e);
      return false;
    }
    return false;
  }

  ///@ Add a new linked product to this color code
  Future<bool?> linkProduct(ColorCodeRelation? relation) async {
    if (relation == null || relation.productKey == null) return null;
    try {
      //FIXME notify the user if this happens by returning false or adding some more failures to the app core
      if (_libraryService.productForKey(relation.productKey!).isNone()) return null;
      _colorCodeItem.relatedProducts = [...(_colorCodeItem.relatedProducts ?? []), relation];
      await DocumentAccessor().save(_colorCodeItem);
      await hydrateColorCode();
      return true;
    } catch (e) {
      //LOOSERROR unhandled
      setError(e);
      return null;
    }
  }

  ///@ Delete this color code
  Future<bool> deleteColorCode() async {
    try {
      await subscription?.cancel();
      subscription = null;
      await DocumentAccessor().delete(_colorCodeItem);
    } catch (e) {
      //LOOSERROR unhandled
      setError(e);
      // Reactivate the subscription to this Color Code item
      await futureToRun();
      return false;
    }
    return true;
  }
}
