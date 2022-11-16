import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flamingo/flamingo.dart' hide Collection;
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

import '../../../../app/extensions/extensions.dart';
import '../../../../app/locator/locator.dart';
import '../../../../entities/color_item/color_item.dart';
import '../../../../models/models.dart';
import '../../../../services/content/content.dart';
import '../../../../services/library/library.dart';

class CollectionItemViewModel extends FutureViewModel {
  String collectionId;
  Collection _collectionItem;
  final LibraryServiceInterface _libraryService;

  CollectionItemViewModel(
    this.collectionId, {
    ContentService? contentService,
    LibraryService? libraryService,
  })  : _collectionItem = Collection(id: collectionId),
        _libraryService = libraryService ?? getIt<LibraryServiceInterface>();

  Collection get collection => _collectionItem;
  List<ColorItem> collectionItems = [];
  StreamSubscription<DocumentSnapshot<Map<String, dynamic>>>? subscription;

  @override
  void dispose() {
    subscription?.cancel();
    super.dispose();
  }

  @override
  Future<void> futureToRun() async {
    if (subscription != null) await subscription?.cancel();
    subscription = firestoreInstance.doc(_collectionItem.reference.path).snapshots().listen((collectionSnapshot) {
      _collectionItem = Collection(snapshot: collectionSnapshot);
      setBusy(true);
      hydrateCollection().then((_) => setBusy(false)).catchError((e) {
        setBusy(false);
        setError(e);
      });
    });
  }

  Future<void> hydrateCollection() async {
    collectionItems.clear();

    collectionItems.addAll(
      _libraryService.productsForKeys(_collectionItem.products ?? []).fold<List<ColorItem>>(
        [],
        (list, possiblyAProduct) => possiblyAProduct.fold(
          () => list,
          (product) => [...list, ColorItem.fromProduct(product)],
        ),
      ),
    );

    if (_collectionItem.colorCodes != null) {
      //= Fetch all color codes
      final colorCodes = await Future.wait(
        _collectionItem.colorCodes!.map<Future<ColorCode?>>(
          (colorCodeUid) => DocumentAccessor().load<ColorCode>(ColorCode(id: colorCodeUid)),
        ),
      );
      //= Add all color codes
      collectionItems.addAll(colorCodes.toNonNull.map((colorCode) => ColorItem.fromColorCode(colorCode)));
    }
  }

  final ValueNotifier<double> fader = ValueNotifier<double>(0);
  void fade(double value) => fader
    ..value = value
    ..notifyListeners();

  String get title => _collectionItem.name ?? 'text_untitled'.tr();
  String get description => _collectionItem.description ?? '...';

  ///@ View as
  bool _viewAsGrid = true;
  bool get viewAsGrid => _viewAsGrid;
  void toggleView() {
    _viewAsGrid = !_viewAsGrid;
    notifyListeners();
  }

  ///@ Delete this collection
  Future<bool> deleteCollection() async {
    try {
      await subscription?.cancel();
      subscription = null;
      await DocumentAccessor().delete(_collectionItem);
    } catch (e) {
      //LOOSERROR unhandled
      setError(e);
      // Reactivate subscription to this Collection item
      await futureToRun();
      return false;
    }
    return true;
  }

  ///@
  Future<String?> addItemToCollection(String? itemKey) async {
    if (itemKey == null) return null;
    //TODO notify the user if this happens
    if (_libraryService.productForKey(itemKey).isNone()) return null;

    // ignore: prefer_collection_literals
    _collectionItem.products = Set.of([...(_collectionItem.products ??= []), itemKey]).toList();
    try {
      await DocumentAccessor().save(_collectionItem);
      return itemKey;
    } catch (e) {
      //LOOSERROR unhandled
      setError(e);
      return null;
    }
  }
}
