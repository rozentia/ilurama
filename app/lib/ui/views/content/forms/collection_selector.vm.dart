import 'package:dartz/dartz.dart';
import 'package:flamingo/flamingo.dart' hide Collection;
import 'package:ilurama_theme/ilurama_theme.dart';
import 'package:logging/logging.dart';
import 'package:stacked/stacked.dart';

import '../../../../app/locator/locator.dart';
import '../../../../models/models.dart';
import '../../../../services/content/content.dart';
import '../../../../services/library/library.dart';
import '../../../../services/user/user.dart';

class CollectionSelectorViewModel extends FutureViewModel {
  final _log = Logger('CollectionSelectorViewModel');
  final ContentServiceInterface _contentService;
  final LibraryServiceInterface _libraryService;
  final TextEditingController searchTermController;

  CollectionSelectorViewModel(
    this.searchTermController, {
    LibraryService? libraryService,
    ContentService? contentService,
    UserService? userService,
  })  : _libraryService = libraryService ?? getIt<LibraryServiceInterface>(),
        _contentService = contentService ?? getIt<ContentServiceInterface>();

  @override
  Future futureToRun() async {
    //LOOSERROR unhandled
    if (_contentService.currentUserUid == null) return;
    try {
      _userCollections = (await firestoreInstance
              .collection(Document.path<Collection>())
              .where('owner', isEqualTo: _contentService.currentUserUid)
              .get())
          .docs
          .map((doc) => Collection(snapshot: doc))
          .toList();
    } catch (e) {
      _log.severe(e);
      setError(e);
    }
  }

  late final List<Collection> _userCollections;
  Collection? _singleCollectionSelection;
  Option<Collection> get selectedCollection => optionOf(_singleCollectionSelection);
  // FFEATURE Feature multi collection selection
  // List<Collection>? _multipleCollectionSelection;

  String? _searchTerm;
  Iterable<Collection> get displayableCollections => optionOf(_searchTerm).fold(
      () => _userCollections,
      (searchTerm) => _userCollections.where((palette) =>
          (palette.name ?? '').contains(searchTerm) ||
          (palette.description ?? '').contains(searchTerm) ||
          (palette.colorCodes ?? []).fold<String>('', (prev, curr) => '$prev$curr').contains(searchTerm)));

  void onSearch(String searchTerm) => _searchTerm = searchTerm;
  void toggleSingleSelection(Collection newSelection) {
    _singleCollectionSelection = newSelection;
    notifyListeners();
  }

  @override
  void dispose() {
    searchTermController.dispose();
    super.dispose();
  }

  Future<List<Color>> getColorsForCollection(Collection palette) async {
    final productColors = _libraryService
        .productsForKeys(palette.products ?? [])
        .fold<List<Product>>(
            [], (list, possibleProduct) => possibleProduct.fold(() => list, (product) => [...list, product]))
        .map<Color>((product) => product.safeColor)
        .toList();
    return [...productColors];
  }
}
