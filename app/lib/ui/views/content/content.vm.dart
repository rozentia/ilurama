import 'dart:async';

import 'package:flamingo/flamingo.dart' hide Collection;
import 'package:ilurama/app/locator/locator.dart';
import 'package:ilurama/entities/content_types/content_types.dart';
import 'package:ilurama/models/models.dart';
import 'package:ilurama/services/content/content.dart';
import 'package:ilurama/services/library/library.dart';
import 'package:ilurama_theme/ilurama_theme.dart';
import 'package:logging/logging.dart';
import 'package:stacked/stacked.dart';

class ContentViewModel extends ReactiveViewModel {
  final log = Logger('ContentViewModel');
  final ContentServiceInterface _contentService;
  final LibraryServiceInterface _libraryService;

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_contentService as ReactiveServiceMixin];

  ContentViewModel({
    ContentServiceInterface? contentService,
    LibraryServiceInterface? libraryService,
  })  : _contentService = contentService ?? getIt<ContentServiceInterface>(),
        _libraryService = libraryService ?? getIt<LibraryServiceInterface>();

  int selectedTab = 0;

  List<Collection> get userCollections => _contentService.allUserCollections;
  List<ColorCode> get userColorCodes => _contentService.allUserColorCodes;
  List<Scene> get userScenes => _contentService.allUserScenes;

  final Map<String, ContentType> tabs = {
    'label_collection': const CollectionType(),
    'label_color_code': const ColorCodeType(),
    //FFEATURE Implement this feature
    'label_scene': const SceneType(),
  };

  ContentType get selectedTabType => tabs.values.elementAt(selectedTab);

  void updateTab(int to) {
    selectedTab = to;
    notifyListeners();
  }

  ///@ Delete a collection [item]
  Future<bool> deleteCollection(Collection item) async {
    try {
      await DocumentAccessor().delete(item);
      notifyListeners();
    } catch (e) {
      //LOOSERROR unhandled
      setError(e);
      return false;
    }
    return true;
  }

  ///@ Delete a color code [item]
  Future<bool> deleteColorCode(ColorCode item) async {
    try {
      await DocumentAccessor().delete(item);
      notifyListeners();
    } catch (e) {
      //LOOSERROR unhandled
      setError(e);
      return false;
    }
    return true;
  }

  Future<List<Color>> getColorsForCollection(Collection collection) async {
    final productColors = _libraryService
        .productsForKeys(collection.products ?? [])
        .fold<List<Product>>(
            [], (list, possibleProduct) => possibleProduct.fold(() => list, (product) => [...list, product]))
        .map<Color>((product) => product.safeColor)
        .toList();
    return [...productColors];
  }
}
