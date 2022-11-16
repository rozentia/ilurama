import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flamingo/flamingo.dart' hide Collection;
import 'package:flutter/cupertino.dart';
import 'package:ilurama/services/auth/auth.dart';
import 'package:ilurama_theme/ilurama_theme.dart';
import 'package:logging/logging.dart';
import 'package:stacked/stacked.dart';

import '../../../../app/extensions/extensions.dart';
import '../../../../app/locator/locator.dart';
import '../../../../app/orphan_types.dart';
import '../../../../entities/color_item/color_item.dart';
import '../../../../entities/content_types/content_types.dart';
import '../../../../models/models.dart';
import '../../../../services/library/library.dart';
import '../../../../services/user/user.dart';
import '../../../widgets/widgets.dart';

class LibraryItemViewModel extends FutureViewModel {
  final _log = Logger('LibraryItemViewModel');
  final String libraryItemId;
  late final ColorItem colorItem;
  final LibraryServiceInterface _libraryService;
  final UserServiceInterface _userService;
  final AuthServiceInterface _authService;

  LibraryItemViewModel(
    this.libraryItemId, {
    LibraryService? libraryService,
    UserService? userService,
    AuthServiceInterface? authService,
  })  : _libraryService = libraryService ?? getIt<LibraryServiceInterface>(),
        _userService = userService ?? getIt<UserServiceInterface>(),
        _authService = authService ?? getIt<AuthServiceInterface>() {
    _libraryService.productForKey(libraryItemId).fold(
      //LOOSERROR Severe: if coming from a deep link, this can become severe... so handle this gracefully
      () {
        _log.severe('Product not found');
        throw Exception('Product not found');
      },
      (product) => colorItem = ColorItem.fromProduct(product),
    );
  }

  final ValueNotifier<double> fader = ValueNotifier<double>(0);

  bool get userAuthenticatedAndEmailConfirmed =>
      _authService.authenticated && _authService.currentFirebaseUser?.emailVerified == true;

  @override
  Future<void> futureToRun() async {
    await _userCustomMatchesSubscription?.cancel();
    await _relatedCollectionsSubscription?.cancel();

    _userService.currentUser.fold<void>(
      () {},
      (currentUser) {
        _userCustomMatchesSubscription =
            firestoreInstance.doc('${currentUser.customMatches.ref.path}/${colorItem.key}').snapshots().listen(
          (snapshot) {
            _userCustomMatches = (CustomMatches(snapshot: snapshot).productMatches ?? [])
                .map((productKey) => _libraryService
                    .productForKey(productKey)
                    .fold(() => null, (product) => ColorItem.fromProduct(product)))
                .toList()
                .toNonNull;
            notifyListeners();
          },
        );
        _relatedCollectionsSubscription = firestoreInstance
            .collection(Document.path<Collection>())
            .where('owner', isEqualTo: _userService.currentUserUid)
            .where('products', arrayContains: colorItem.key)
            .snapshots()
            .listen((querySnapshots) {
          _relatedCollections = querySnapshots.docs.map((snapshot) => Collection(snapshot: snapshot)).toList();
          notifyListeners();
        });
      },
    );
  }

  List<ColorItem>? _userCustomMatches;
  StreamSubscription<DocumentSnapshot<Map<String, dynamic>>>? _userCustomMatchesSubscription;
  Option<List<ColorItem>> get userCustomMatches => optionOf(_userCustomMatches);

  void fade(double value) => fader
    ..value = value
    ..notifyListeners();

  ///@deprecated
  Option<Color> get color => optionOf(colorItem.color.alpha != 0 ? colorItem.color : null);

  ///@
  Option<List<num?>> get graphData => colorItem.graphData;

  ///@
  Option<List<num>> get graphStops => optionOf(
        colorItem.item
            .fold((l) => _libraryService.brands.firstWhere((brand) => brand.name == l.brand).graphStops, (r) => null),
      );

  ///@ Item brand
  Option<Brand> get itemBrand => _libraryService.brandForKey(colorItem.item.fold((l) => l.brand, (r) => ''));

  ///@
  Option<List<ProductFormat>> get availableFormats => optionOf(colorItem.item.fold((l) => l.formats, (r) => null));

  ///@
  ColorItem? getColorItemFromKey(String? key) => key == null
      ? null
      : _libraryService.productForKey(key).fold(
            () => null,
            (product) => ColorItem.fromProduct(product),
          );

  ///@
  Future<String?> setNewProductMatch(String? selectedProduct) async {
    if (selectedProduct == null) return null;
    try {
      await _userService.saveCustomMatchForUser(colorItem.key, selectedProduct);
      return selectedProduct;
    } catch (e) {
      //LOOSERROR Handle this error gracefully
      setError(e);
      return null;
    }
  }

  ///@
  Future<String?> setNewContainingCollection(Collection? containingCollection) async {
    if (containingCollection == null) return null;
    // ignore: prefer_collection_literals
    containingCollection.products = Set.of([...(containingCollection.products ??= []), colorItem.key]).toList();
    try {
      await DocumentAccessor().save(containingCollection);
      return containingCollection.name;
    } catch (e) {
      //LOOSERROR Handle this error gracefully
      setError(e);
      return null;
    }
  }

  Map<String, List<ColorItem>> get relatedColors => colorItem.type == const DiffusionFilter()
      ? {}
      : {
          'title_analogous': _libraryService.products
              .where((product) => product.safeColor.hue.toInt() == colorItem.color.hue.toInt())
              .map((product) => ColorItem.fromProduct(product))
              .where((element) => element != colorItem)
              .toList()
            // ..removeWhere((element) => element.colorHexString == colorItem.colorHexString)
            ..sort((a, b) => a.color.saturation
                .distanceFrom(colorItem.color.saturation)
                .compareTo(b.color.saturation.distanceFrom(colorItem.color.saturation))),
          'title_complementary': _libraryService.products
              .where((product) => product.safeColor.hue.toInt() == colorItem.color.complement.hue.toInt())
              .map((product) => ColorItem.fromProduct(product))
              .toList()
            ..sort((a, b) => a.color.saturation
                .distanceFrom(colorItem.color.saturation)
                .compareTo(b.color.saturation.distanceFrom(colorItem.color.saturation))),
        };

  List<Collection>? _relatedCollections;
  StreamSubscription<QuerySnapshot<Map<String, dynamic>>>? _relatedCollectionsSubscription;

  ///@ Collections that contains this color item
  Option<List<Collection>> get relatedCollections => optionOf(_relatedCollections);

  //FFEATURE Scenes
  Option<List<Scene>> get relatedScenes => optionOf([]);

  ///@ Item's menu options
  List<StarMenuItem<LibraryItemActions>> get menuItems => [
        ..._menuItemsAnonymous,
        if (userAuthenticatedAndEmailConfirmed) ..._menuItemsAuthenticated,
      ];
  List<StarMenuItem<LibraryItemActions>> get _menuItemsAnonymous => [
        StarMenuItem(
          'menu_items.compare_with'.tr(),
          CupertinoIcons.square_fill_line_vertical_square,
          const LibraryItemActions.compareWith(),
        ),
        if (colorItem.color != Colors.white)
          StarMenuItem(
            'menu_items.set_flashlight'.tr(),
            CupertinoIcons.lightbulb,
            const LibraryItemActions.toggleFlashlight(),
          ),
      ];
  List<StarMenuItem<LibraryItemActions>> get _menuItemsAuthenticated => [
        StarMenuItem('menu_items.add_alternative_color'.tr(), CupertinoIcons.plus_square_on_square,
            const LibraryItemActions.setCustomAlternative()),
        StarMenuItem('menu_items.add_to_collection'.tr(), CupertinoIcons.tray_arrow_down,
            const LibraryItemActions.addProductToCollection()),
      ];

  @override
  void dispose() {
    _userCustomMatchesSubscription?.cancel();
    _relatedCollectionsSubscription?.cancel();
    super.dispose();
  }
}
