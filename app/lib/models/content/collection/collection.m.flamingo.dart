// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection.m.dart';

// **************************************************************************
// FieldValueGenerator
// **************************************************************************

/// Field value key
enum CollectionKey {
  owner,
  name,
  description,
  products,
  colorCodes,
}

extension CollectionKeyExtension on CollectionKey {
  String get value {
    switch (this) {
      case CollectionKey.owner:
        return 'owner';
      case CollectionKey.name:
        return 'name';
      case CollectionKey.description:
        return 'description';
      case CollectionKey.products:
        return 'products';
      case CollectionKey.colorCodes:
        return 'colorCodes';
      default:
        throw Exception('Invalid data key.');
    }
  }
}

/// For save data
Map<String, dynamic> _$toData(Collection doc) {
  final data = <String, dynamic>{};
  Helper.writeNotNull(data, 'owner', doc.owner);
  Helper.writeNotNull(data, 'name', doc.name);
  Helper.write(data, 'description', doc.description);
  Helper.writeNotNull(data, 'products', doc.products);
  Helper.writeNotNull(data, 'colorCodes', doc.colorCodes);

  return data;
}

/// For load data
void _$fromData(Collection doc, Map<String, dynamic> data) {
  doc.owner = Helper.valueFromKey<String?>(data, 'owner', defaultValue: null);
  doc.name = Helper.valueFromKey<String?>(data, 'name', defaultValue: null);
  doc.description =
      Helper.valueFromKey<String?>(data, 'description', defaultValue: null);
  doc.products = Helper.valueListFromKey<String>(data, 'products');
  doc.colorCodes = Helper.valueListFromKey<String>(data, 'colorCodes');
}
