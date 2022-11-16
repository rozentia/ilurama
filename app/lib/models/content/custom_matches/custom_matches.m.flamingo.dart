// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_matches.m.dart';

// **************************************************************************
// FieldValueGenerator
// **************************************************************************

/// Field value key
enum CustomMatchesKey {
  productMatches,
  colorCodeMatches,
}

extension CustomMatchesKeyExtension on CustomMatchesKey {
  String get value {
    switch (this) {
      case CustomMatchesKey.productMatches:
        return 'productMatches';
      case CustomMatchesKey.colorCodeMatches:
        return 'colorCodeMatches';
      default:
        throw Exception('Invalid data key.');
    }
  }
}

/// For save data
Map<String, dynamic> _$toData(CustomMatches doc) {
  final data = <String, dynamic>{};
  Helper.writeNotNull(data, 'productMatches', doc.productMatches);
  Helper.writeNotNull(data, 'colorCodeMatches', doc.colorCodeMatches);

  return data;
}

/// For load data
void _$fromData(CustomMatches doc, Map<String, dynamic> data) {
  doc.productMatches = Helper.valueListFromKey<String>(data, 'productMatches');
  doc.colorCodeMatches =
      Helper.valueListFromKey<String>(data, 'colorCodeMatches');
}
