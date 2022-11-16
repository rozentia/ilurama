import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:ilurama_theme/ilurama_theme.dart';
import 'package:stacked/stacked.dart';

import '../../../app/locator/locator.dart';
import '../../../app/orphan_types.dart';
import '../../../entities/color_item/color_item.dart';
import '../../../entities/filter_settings/filter_settings.dart';
import '../../../services/content/content.dart';
import '../../../services/user/user.dart';
import '../../widgets/widgets.dart';

class LibraryViewModel extends ReactiveViewModel {
  final ContentServiceInterface _contentService;
  final UserServiceInterface _userService;
  final TextEditingController searchTermController;

  LibraryViewModel(
    this.searchTermController, {
    ContentService? contentService,
    UserService? userService,
  })  : _contentService = contentService ?? getIt<ContentServiceInterface>(),
        _userService = userService ?? getIt<UserServiceInterface>();

  @override
  List<ReactiveServiceMixin> get reactiveServices => [
        _contentService as ReactiveServiceMixin,
      ];

  bool get isAuthenticated => _userService.currentUser.isSome();

  Iterable<ColorItem> get displayableItems => _contentService.displayableColorItems;

  LibraryFilterSettings get activeFilter => _contentService.libraryFilterSettings;
  bool get hasFilters => _contentService.libraryFilterSettings != LibraryFilterSettings.clear();

  void onSearch(String searchTerm) =>
      _contentService.updateLibraryFilterSettings(activeFilter.copyWith.searchTerm(searchTerm));

//- Context Menu
  List<StarMenuItem<LibraryItemActions>> menuItemsFor(ColorItem colorItem) => [
        ..._menuItemsAnonymous(colorItem),
        if (isAuthenticated) ..._menuItemsAuthenticated,
      ];
  List<StarMenuItem<LibraryItemActions>> _menuItemsAnonymous(ColorItem colorItem) => [
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
    searchTermController.dispose();
    super.dispose();
  }
}
