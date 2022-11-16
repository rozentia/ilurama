// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'color_code.m.dart';

// **************************************************************************
// FieldValueGenerator
// **************************************************************************

/// Field value key
enum ColorCodeKey {
  owner,
  name,
  description,
  hex,
  parameters,
  relatedProducts,
}

extension ColorCodeKeyExtension on ColorCodeKey {
  String get value {
    switch (this) {
      case ColorCodeKey.owner:
        return 'owner';
      case ColorCodeKey.name:
        return 'name';
      case ColorCodeKey.description:
        return 'description';
      case ColorCodeKey.hex:
        return 'hex';
      case ColorCodeKey.parameters:
        return 'parameters';
      case ColorCodeKey.relatedProducts:
        return 'relatedProducts';
      default:
        throw Exception('Invalid data key.');
    }
  }
}

/// For save data
Map<String, dynamic> _$toData(ColorCode doc) {
  final data = <String, dynamic>{};
  Helper.writeNotNull(data, 'owner', doc.owner);
  Helper.writeNotNull(data, 'name', doc.name);
  Helper.write(data, 'description', doc.description);
  Helper.writeNotNull(data, 'hex', doc.hex);

  Helper.writeModelListNotNull(data, 'parameters', doc.parameters);
  Helper.writeModelListNotNull(data, 'relatedProducts', doc.relatedProducts);

  return data;
}

/// For load data
void _$fromData(ColorCode doc, Map<String, dynamic> data) {
  doc.owner = Helper.valueFromKey<String?>(data, 'owner', defaultValue: null);
  doc.name = Helper.valueFromKey<String?>(data, 'name', defaultValue: null);
  doc.description =
      Helper.valueFromKey<String?>(data, 'description', defaultValue: null);
  doc.hex = Helper.valueFromKey<String?>(data, 'hex', defaultValue: null);

  final _parameters =
      Helper.valueMapListFromKey<String, dynamic>(data, 'parameters');
  if (_parameters != null) {
    doc.parameters = _parameters
        .where((d) => d != null)
        .map((d) => ColorCodeParameter(values: d))
        .toList();
  } else {
    doc.parameters = null;
  }

  final _relatedProducts =
      Helper.valueMapListFromKey<String, dynamic>(data, 'relatedProducts');
  if (_relatedProducts != null) {
    doc.relatedProducts = _relatedProducts
        .where((d) => d != null)
        .map((d) => ColorCodeRelation(values: d))
        .toList();
  } else {
    doc.relatedProducts = null;
  }
}
