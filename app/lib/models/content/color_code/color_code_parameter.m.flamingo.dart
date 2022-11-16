// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'color_code_parameter.m.dart';

// **************************************************************************
// FieldValueGenerator
// **************************************************************************

/// Field value key
enum ColorCodeParameterKey {
  parameterName,
  dmxCoarse,
  dmxFine,
}

extension ColorCodeParameterKeyExtension on ColorCodeParameterKey {
  String get value {
    switch (this) {
      case ColorCodeParameterKey.parameterName:
        return 'parameterName';
      case ColorCodeParameterKey.dmxCoarse:
        return 'dmxCoarse';
      case ColorCodeParameterKey.dmxFine:
        return 'dmxFine';
      default:
        throw Exception('Invalid data key.');
    }
  }
}

/// For save data
Map<String, dynamic> _$toData(ColorCodeParameter doc) {
  final data = <String, dynamic>{};
  Helper.writeNotNull(data, 'parameterName', doc.parameterName);
  Helper.writeNotNull(data, 'dmxCoarse', doc.dmxCoarse);
  Helper.write(data, 'dmxFine', doc.dmxFine);

  return data;
}

/// For load data
void _$fromData(ColorCodeParameter doc, Map<String, dynamic> data) {
  doc.parameterName =
      Helper.valueFromKey<String?>(data, 'parameterName', defaultValue: null);
  doc.dmxCoarse =
      Helper.valueFromKey<int?>(data, 'dmxCoarse', defaultValue: null);
  doc.dmxFine = Helper.valueFromKey<int?>(data, 'dmxFine', defaultValue: null);
}
