// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scene.m.dart';

// **************************************************************************
// FieldValueGenerator
// **************************************************************************

/// Field value key
enum SceneKey {
  owner,
  title,
  description,
  products,
  colorCodes,

  images,
}

extension SceneKeyExtension on SceneKey {
  String get value {
    switch (this) {
      case SceneKey.owner:
        return 'owner';
      case SceneKey.title:
        return 'title';
      case SceneKey.description:
        return 'description';
      case SceneKey.products:
        return 'products';
      case SceneKey.colorCodes:
        return 'colorCodes';
      case SceneKey.images:
        return 'images';
      default:
        throw Exception('Invalid data key.');
    }
  }
}

/// For save data
Map<String, dynamic> _$toData(Scene doc) {
  final data = <String, dynamic>{};
  Helper.writeNotNull(data, 'owner', doc.owner);
  Helper.writeNotNull(data, 'title', doc.title);
  Helper.write(data, 'description', doc.description);
  Helper.writeNotNull(data, 'products', doc.products);
  Helper.writeNotNull(data, 'colorCodes', doc.colorCodes);

  Helper.writeStorageListNotNull(data, 'user_scene_images', doc.images,
      isSetNull: true);

  return data;
}

/// For load data
void _$fromData(Scene doc, Map<String, dynamic> data) {
  doc.owner = Helper.valueFromKey<String?>(data, 'owner', defaultValue: null);
  doc.title = Helper.valueFromKey<String?>(data, 'title', defaultValue: null);
  doc.description =
      Helper.valueFromKey<String?>(data, 'description', defaultValue: null);
  doc.products = Helper.valueListFromKey<String>(data, 'products');
  doc.colorCodes = Helper.valueListFromKey<String>(data, 'colorCodes');

  doc.images = Helper.storageFiles(data, 'user_scene_images');
}
