// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'color_code_relation.m.dart';

// **************************************************************************
// FieldValueGenerator
// **************************************************************************

/// Field value key
enum ColorCodeRelationKey {
  productKey,
  relationDescription,
}

extension ColorCodeRelationKeyExtension on ColorCodeRelationKey {
  String get value {
    switch (this) {
      case ColorCodeRelationKey.productKey:
        return 'productKey';
      case ColorCodeRelationKey.relationDescription:
        return 'relationDescription';
      default:
        throw Exception('Invalid data key.');
    }
  }
}

/// For save data
Map<String, dynamic> _$toData(ColorCodeRelation doc) {
  final data = <String, dynamic>{};
  Helper.writeNotNull(data, 'productKey', doc.productKey);
  Helper.writeNotNull(data, 'relationDescription', doc.relationDescription);

  return data;
}

/// For load data
void _$fromData(ColorCodeRelation doc, Map<String, dynamic> data) {
  doc.productKey =
      Helper.valueFromKey<String?>(data, 'productKey', defaultValue: null);
  doc.relationDescription = Helper.valueFromKey<String?>(
      data, 'relationDescription',
      defaultValue: null);
}
