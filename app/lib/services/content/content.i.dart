import 'package:ilurama/entities/color_item/color_item.dart';
import 'package:ilurama/entities/content_types/content_types.dart';
import 'package:ilurama/entities/filter_settings/filter_settings.dart';

import '../../models/models.dart';

abstract class ContentServiceInterface {
  ///@ current user Id or null if not authenticated
  String? get currentUserUid;

  ///@ Available product brands. If user is authenticated it will appear as a brand
  List<String> get availableBrands;

  ///@ Available product branches as Map<BranchName, BrandNameofBranch>
  Map<String, String> get availableBranches;

  ///@ Available product types
  List<ColorItemType> get availableTypes;

  ///@ Returns all color items available for display, filtered and sortered upon the current filterSettings
  List<ColorItem> get displayableColorItems;

  ///@ the current settings to filter color items
  LibraryFilterSettings get libraryFilterSettings;

  ///@ Returns all collections of current user
  List<Collection> get allUserCollections;

  ///@ Return all color codes of current user
  List<ColorCode> get allUserColorCodes;

  ///@ Updates the user collections list
  // void updateUserCollectionList(List<Collection> collectionList);

  ///@ Returns all user's collection items available for display, filtered and sorted upon current collectionFilterSettings
  List<Collection> get displayableCollections;

  ///@ the current settings to filter the user's collections
  CollectionFilterSettings get collectionFilterSettings;

  ///@ Returns all user's own scene items available for display, filtered and sorted upon current sceneFilterSettings
  List<Scene> get userDisplayableScenes;

  ///@ Returns all user's own scenes
  List<Scene> get allUserScenes;

  ///@ the current settings to filter the user's scenes
  SceneFilterSettings get sceneFilterSettings;

  ///@ Returns the latest scene items from the current user's following users
  List<Scene> get streamOfScenes;

  ///@ Fetches the [pageSize] colorCodes for [pageKey] and inserts them into [pagingController]
  // Future<void> fetchColorCodes(PagingController<int, ColorCode> pagingController, int pageKey, {int pageSize = 20});

  ///@ updates the current filter settings or resets to default if called without arguments
  void updateLibraryFilterSettings(LibraryFilterSettings newSettings);

  ///@ updates the current filter settings or resets to default if called without arguments
  void updateCollectionFilterSettings(CollectionFilterSettings newSettings);

  ///@ updates the current filter settings or resets to default if called without arguments
  void updateSceneFilterSettings(SceneFilterSettings newSettings);
}
