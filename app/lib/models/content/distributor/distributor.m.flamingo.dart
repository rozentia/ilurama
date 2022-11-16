// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'distributor.m.dart';

// **************************************************************************
// FieldValueGenerator
// **************************************************************************

/// Field value key
enum DistributorKey {
  name,
  link,
  description,
  location,
  brands,
}

extension DistributorKeyExtension on DistributorKey {
  String get value {
    switch (this) {
      case DistributorKey.name:
        return 'name';
      case DistributorKey.link:
        return 'link';
      case DistributorKey.description:
        return 'description';
      case DistributorKey.location:
        return 'location';
      case DistributorKey.brands:
        return 'brands';
      default:
        throw Exception('Invalid data key.');
    }
  }
}

/// For save data
Map<String, dynamic> _$toData(Distributor doc) {
  final data = <String, dynamic>{};
  Helper.writeNotNull(data, 'name', doc.name);
  Helper.writeNotNull(data, 'link', doc.link);
  Helper.write(data, 'description', doc.description);
  Helper.writeNotNull(data, 'location', doc.location);
  Helper.writeNotNull(data, 'brands', doc.brands);

  return data;
}

/// For load data
void _$fromData(Distributor doc, Map<String, dynamic> data) {
  doc.name = Helper.valueFromKey<String?>(data, 'name', defaultValue: null);
  doc.link = Helper.valueFromKey<String?>(data, 'link', defaultValue: null);
  doc.description =
      Helper.valueFromKey<String?>(data, 'description', defaultValue: null);
  doc.location =
      Helper.valueFromKey<String?>(data, 'location', defaultValue: null);
  doc.brands = Helper.valueListFromKey<String>(data, 'brands');
}
