import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ilurama/models/models.dart';

import '../color_item/color_item_entity.dart';

part 'content_element_entity.freezed.dart';

@freezed
class ContentElement with _$ContentElement {
  const ContentElement._();

  const factory ContentElement.colorItemElement(ColorItem item) = ColorItemElement;
  const factory ContentElement.collectionElement(Collection collection) = CollectionElement;
  const factory ContentElement.sceneElement(Scene scene) = SceneElement;
}
