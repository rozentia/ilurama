import 'package:freezed_annotation/freezed_annotation.dart';

part 'content_type.freezed.dart';

@freezed
class ContentType with _$ContentType {
  const factory ContentType.colorCodeType() = ColorCodeType;
  const factory ContentType.collectionType() = CollectionType;
  const factory ContentType.sceneType() = SceneType;
}
