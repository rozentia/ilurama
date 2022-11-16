import 'package:dartz/dartz.dart';
import 'package:ilurama_theme/ilurama_theme.dart';
import 'package:stacked/stacked.dart';

import '../../../../app/locator/locator.dart';
import '../../../../entities/color_item/color_item.dart';
import '../../../../entities/filter_settings/filter_settings.dart';
import '../../../../models/models.dart';
import '../../../../services/content/content.dart';
import '../../../../services/library/library.dart';
import '../../../../services/user/user.dart';

class ProductSelectorViewModel extends ReactiveViewModel {
  final ContentServiceInterface _contentService;
  final LibraryServiceInterface _libraryService;
  final TextEditingController searchTermController;

  ProductSelectorViewModel(
    this.searchTermController, {
    LibraryService? libraryService,
    ContentService? contentService,
    UserService? userService,
  })  : _libraryService = libraryService ?? getIt<LibraryServiceInterface>(),
        _contentService = contentService ?? getIt<ContentServiceInterface>() {
    _oldLibraryFilterSettings = _contentService.libraryFilterSettings;
    _contentService.updateLibraryFilterSettings(LibraryFilterSettings.clear());
  }

  @override
  List<ReactiveServiceMixin> get reactiveServices => [
        _contentService as ReactiveServiceMixin,
      ];

  late final LibraryFilterSettings _oldLibraryFilterSettings;

  Product? _singleProductSelection;
  Option<Product> get singleProductSelected => optionOf(_singleProductSelection);
  final List<Product> _multipleProductSelection = [];
  List<Product> get multipleProductsSelection => _multipleProductSelection;

  Iterable<ColorItem> get displayableItems => _contentService.displayableColorItems;
  LibraryFilterSettings get activeFilter => _contentService.libraryFilterSettings;
  bool get hasFilters => _contentService.libraryFilterSettings != LibraryFilterSettings.clear();

  void onSearch(String searchTerm) =>
      _contentService.updateLibraryFilterSettings(activeFilter.copyWith.searchTerm(searchTerm));

  void toggleSingleSelection(String productId) => _libraryService.productForKey(productId).fold(
        () {},
        (product) {
          _singleProductSelection = product;
          notifyListeners();
        },
      );

  //FFEATURE Implement this multi selection
  void toggleMultipleSelection(String productId) {}

  @override
  void dispose() {
    searchTermController.dispose();
    _contentService.updateLibraryFilterSettings(_oldLibraryFilterSettings);
    super.dispose();
  }
}
