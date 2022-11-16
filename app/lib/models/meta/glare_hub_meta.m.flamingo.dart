// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'glare_hub_meta.m.dart';

// **************************************************************************
// FieldValueGenerator
// **************************************************************************

/// Field value key
enum IluramaMetaKey {
  libraryVersion,
  changeLog,
}

extension IluramaMetaKeyExtension on IluramaMetaKey {
  String get value {
    switch (this) {
      case IluramaMetaKey.libraryVersion:
        return 'libraryVersion';
      case IluramaMetaKey.changeLog:
        return 'changeLog';
      default:
        throw Exception('Invalid data key.');
    }
  }
}

/// For save data
Map<String, dynamic> _$toData(IluramaMeta doc) {
  final data = <String, dynamic>{};
  Helper.writeNotNull(data, 'libraryVersion', doc.libraryVersion);
  Helper.writeNotNull(data, 'changeLog', doc.changeLog);

  return data;
}

/// For load data
void _$fromData(IluramaMeta doc, Map<String, dynamic> data) {
  doc.libraryVersion = Helper.valueFromKey<String?>(data, 'libraryVersion', defaultValue: null);
  doc.changeLog = Helper.valueListFromKey<String>(data, 'changeLog');
}
