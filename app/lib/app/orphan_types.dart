import 'package:freezed_annotation/freezed_annotation.dart';

part 'orphan_types.freezed.dart';

@freezed
class LibraryItemActions with _$LibraryItemActions {
  const LibraryItemActions._();

  const factory LibraryItemActions.addProductToCollection() = AddProductToCollection;
  const factory LibraryItemActions.setCustomAlternative() = SetCustomAlternativeProduct;
  const factory LibraryItemActions.toggleFlashlight() = ToggleColorFlashlight;
  const factory LibraryItemActions.compareWith() = CompareProductWith;
}

@freezed
class CollectionItemActions with _$CollectionItemActions {
  const CollectionItemActions._();

  const factory CollectionItemActions.toggleItemsView() = ToggleCollectionItemsView;
  const factory CollectionItemActions.addNewItem() = AddNewItemToCollection;
  const factory CollectionItemActions.newSceneFromCollection() = NewSceneFromCollection;
  const factory CollectionItemActions.editCollection() = EditCollection;
  const factory CollectionItemActions.deleteCollection() = DeleteCollection;
}

@freezed
class ColorCodeItemActions with _$ColorCodeItemActions {
  const ColorCodeItemActions._();

  const factory ColorCodeItemActions.addToCollection() = AddColorCodeItemToCollection;
  const factory ColorCodeItemActions.linkToProduct() = LinkColorCodeToProduct;
  const factory ColorCodeItemActions.editColorCode() = EditColorCode;
  const factory ColorCodeItemActions.deleteColorCode() = DeleteColorCode;
}

@freezed
class SceneItemActions with _$SceneItemActions {
  const SceneItemActions._();

  const factory SceneItemActions.addCollection() = AddCollectionToScene;
  const factory SceneItemActions.addProducts() = AddProductsToScene;
  const factory SceneItemActions.addColorCode() = AddColorCodeToScene;
  const factory SceneItemActions.publishScene() = PublishScene;
  const factory SceneItemActions.editScene() = EditScene;
  const factory SceneItemActions.saveSceneDraft() = SaveSceneDraft;
  const factory SceneItemActions.removeScene() = RemoveScene;
  const factory SceneItemActions.deleteSceneDraft() = DeleteSceneDraft;
}
