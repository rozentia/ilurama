import 'package:flamingo/flamingo.dart' hide Collection;
import 'package:ilurama/app/extensions/extensions.dart';
import 'package:ilurama/app/locator/locator.dart';
import 'package:ilurama/entities/color_item/color_item.dart';
import 'package:ilurama/entities/filter_settings/filter_settings.dart';
import 'package:ilurama/models/models.dart';
import 'package:ilurama/services/content/content.dart';
import 'package:ilurama/services/library/library.dart';
import 'package:logging/logging.dart';
import 'package:stacked/stacked.dart';

class CollectionFormViewModel extends ReactiveViewModel {
  final log = Logger('CollectionFormViewModel');
  final ContentServiceInterface _contentService;
  final LibraryServiceInterface _libraryService;
  final Collection? _collectionToEdit;

  CollectionFormViewModel({
    ContentService? contentService,
    LibraryService? libraryService,
    Collection? collectionToEdit,
  })  : _contentService = contentService ?? getIt<ContentServiceInterface>(),
        _libraryService = libraryService ?? getIt<LibraryServiceInterface>(),
        _collectionToEdit = collectionToEdit {
    _oldFilterSettings = _contentService.libraryFilterSettings;
    _contentService.updateLibraryFilterSettings(LibraryFilterSettings.clear());
    if (_collectionToEdit != null) {
      _collectionName = _collectionToEdit?.name;
      _collectionDescription = _collectionToEdit?.description;
      _collectionProducts = _collectionToEdit?.products ?? [];
    }
  }

  @override
  List<ReactiveServiceMixin> get reactiveServices => [
        _contentService as ReactiveServiceMixin,
      ];

  late final LibraryFilterSettings _oldFilterSettings;

  String? _collectionName;
  String? _collectionDescription;
  List<String> _collectionProducts = [];
  String? searchTerm;
  bool get hasFilters => _contentService.libraryFilterSettings != LibraryFilterSettings.clear();

  String? get collectionName => _collectionName;
  String? get collectionDescription => _collectionDescription;
  List<Product> get collectionProducts =>
      _libraryService.productsForKeys(_collectionProducts).map((p) => p.fold(() => null, (a) => a)).toList().toNonNull;

  void onChangeName(String newName) {
    _collectionName = newName;
    // clear the error message for title if present
    if (hasErrorForKey(validationErrorKey)) {
      notifyListeners();
    }
  }

  void onChangeDescription(String newDescription) => _collectionDescription = newDescription;
  void onToggleProduct(String productId) {
    _collectionProducts.contains(productId)
        ? _collectionProducts.removeWhere((aProduct) => aProduct == productId)
        : _collectionProducts.add(productId);
    notifyListeners();
  }

  bool isProductSelected(String key) => _collectionProducts.contains(key);

  int get selectedProducts => _collectionProducts.length;

  Iterable<ColorItem> get displayableItems => _contentService.displayableColorItems;

  LibraryFilterSettings get activeFilter => _contentService.libraryFilterSettings;

  void onSearch(String searchTerm) {
    _contentService.updateLibraryFilterSettings(activeFilter.copyWith.searchTerm(searchTerm));
    notifyListeners();
  }

  //-_                                                      FORM VALIDATION AND SUBMISSION
  bool get titleValid => _collectionName?.isNotEmpty ?? false;
  bool get productsValid => _collectionProducts.isNotEmpty;
  String get validationErrorKey => 'hasValidationErrors';
  String get unknownErrorKey => 'hasUnknownError';

  Future<bool> onSubmit() async {
    if (!titleValid || !productsValid) {
      setErrorForObject(validationErrorKey, validationErrorKey);
      notifyListeners();
      return false;
    } else {
      setError(null);
    }
    try {
      setBusy(true);
      if (_collectionToEdit != null) {
        await DocumentAccessor().update(_collectionToEdit!
          ..name = _collectionName
          ..description = _collectionDescription
          ..products = _collectionProducts);
      } else {
        await DocumentAccessor().save(Collection(
          owner: _contentService.currentUserUid,
          name: _collectionName,
          description: _collectionDescription,
          products: _collectionProducts,
        ));
      }
      setBusy(false);
      return true;
    } catch (e) {
      log.severe(e);
      setErrorForObject(unknownErrorKey, e);
      //LOOSERROR unhandled
      return false;
    }
  }

  Future<bool> deleteCollection() async {
    if (_collectionToEdit == null) return false;
    try {
      await DocumentAccessor().delete(_collectionToEdit!);
    } catch (e) {
      //LOOSERROR unhandled
      setError(e);
      return false;
    }
    return true;
  }

  @override
  void dispose() {
    _contentService.updateLibraryFilterSettings(_oldFilterSettings);
    super.dispose();
  }
}
