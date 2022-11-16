import 'package:flamingo/flamingo.dart';
import 'package:flamingo_annotation/flamingo_annotation.dart';
import 'package:flutter/painting.dart';
import 'package:ilurama/app/extensions/extensions.dart';
import 'package:shared_extensions/shared_extensions.dart';

import 'color_code_parameter_types.dart';

part 'color_code_parameter.m.flamingo.dart';

class ColorCodeParameter extends Model {
  @Field()
  String? parameterName;

  /// DMX MSB (Coarse) value on 8bit and 16bit parameters
  @Field()
  int? dmxCoarse;

  /// DMX LSB (Fine) value on 16bit, null if parameter is 8bit
  @Field(isWriteNotNull: false)
  int? dmxFine;

  ColorCodeParameter({
    this.parameterName = k_red,
    this.dmxCoarse = 0,
    this.dmxFine,
    Map<String, dynamic>? values,
  }) : super(values: values);

  /// Factory constructor from ColorCodeParameterType [type] with optional [coarse] and [fine] values.\n
  /// Defaults to dmxCoarse: 0, dmxFine: null
  factory ColorCodeParameter.fromParameterType(
    ColorCodeParameterType type, {
    int coarse = 0,
    int? fine,
  }) =>
      ColorCodeParameter(
        parameterName: type.parameterTypeName,
        dmxCoarse: coarse,
        dmxFine: fine,
      );

  @override
  Map<String, dynamic> toData() => _$toData(this);

  @override
  void fromData(Map<String, dynamic> data) => _$fromData(this, data);

  /// True if parameter has DMX 8bit value (dmxFine == null)
  bool get is8bit => dmxFine == null;

  /// Returns the parameter type
  ColorCodeParameterType? get parameterType {
    switch (parameterName) {
      case k_red:
        return const ColorCodeParameterType.red();
      case k_green:
        return const ColorCodeParameterType.green();
      case k_blue:
        return const ColorCodeParameterType.blue();
      case k_white:
        return const ColorCodeParameterType.white();
      case k_cyan:
        return const ColorCodeParameterType.cyan();
      case k_magenta:
        return const ColorCodeParameterType.magenta();
      case k_yellow:
        return const ColorCodeParameterType.yellow();
      case k_amber:
        return const ColorCodeParameterType.amber();
      case k_uv:
        return const ColorCodeParameterType.uv();
      default:
        return null;
    }
  }

  /// Returns the 16bit value from coarse and fine values even if the parameter is 8bit
  int get value16bit => (dmxCoarse ?? 0) * 256 + (dmxFine ?? 0);

  /// Returns the percentage value of the parameter
  double get percentValue {
    final coarse =
        (dmxCoarse ?? 0).toDouble().clamp(0.0, 255.0).mapToRange(0.0, 255.0, 0.0, is8bit ? 100.0 : 99.0).round();
    final fine = (dmxFine ?? 0).toDouble().clamp(0.0, 255.0).mapToRange(0.0, 255.0, 0.0, 100.0).round() / 100;
    return coarse + fine;
  }

  /// Returns a copy of this parameter with the dmxFine value as 0
  ColorCodeParameter get to16bit => ColorCodeParameter(parameterName: parameterName, dmxCoarse: dmxCoarse, dmxFine: 0);

  /// Returns a copy of this parameter with the dmxFine value as null
  ColorCodeParameter get to8bit =>
      ColorCodeParameter(parameterName: parameterName, dmxCoarse: dmxCoarse, dmxFine: null);

  /// Return true if the [type] matches
  bool isOfType(ColorCodeParameterType type) => type == parameterType;

  /// Returns a new ColorCodeParameter of the same type and depth with coarse and fine values calculated from [percent]
  ColorCodeParameter copyWithPercent(double percent) => ColorCodeParameter(
        parameterName: parameterName,
        dmxCoarse: is8bit
            ? percent.mapToRange(0.0, 100.0, 0, 255).round()
            : (percent.mapToRange(0.0, 100.0, 0, 65535) / 256).round(),
        dmxFine: is8bit ? null : (percent.mapToRange(0.0, 100.0, 0, 65535) % 256).round(),
      );

  /// Returns a new ColorCodeParameter with coarse and fine values calculated from a 16bit int value (≥0 ≤65535)
  ColorCodeParameter copyWith16bitValue(int value) => ColorCodeParameter(
        parameterName: parameterName,
        dmxCoarse: (value / 256).round(),
        dmxFine: value % 256,
      );

  /// Returns a new ColorCodeParameter with 8bit value truncated to 255 (≥0 ≤255)
  ColorCodeParameter copyWith8bitValue(int value) => ColorCodeParameter(
        parameterName: parameterName,
        dmxCoarse: value >= 256 ? 255 : value,
        dmxFine: null,
      );

  /// Returns a copy with the provided [type]
  ColorCodeParameter copyWithType(ColorCodeParameterType type) => ColorCodeParameter.fromParameterType(
        type,
        coarse: dmxCoarse ?? 0,
        fine: dmxFine,
      );
}

extension ExtendedColorCodeParameterList on List<ColorCodeParameter> {
  ColorCodeParameter? getFirstOfType<T>() => parameterTypes.has<T>() ? firstWhere((e) => e.parameterType is T) : null;

  List<ColorCodeParameterType> get parameterTypes => map((e) => e.parameterType).toList().toNonNull;

  Color? get resolvedColor {
    Color? color;
    if (parameterTypes.has<ParameterRed>() ||
        parameterTypes.has<ParameterBlue>() ||
        parameterTypes.has<ParameterGreen>()) {
      final r = (getFirstOfType<ParameterRed>()?.dmxCoarse?.clamp(0.0, 255.0) ?? 0).toInt();
      final g = (getFirstOfType<ParameterGreen>()?.dmxCoarse?.clamp(0.0, 255.0) ?? 0).toInt();
      final b = (getFirstOfType<ParameterBlue>()?.dmxCoarse?.clamp(0.0, 255.0) ?? 0).toInt();
      color = Color.fromARGB(255, r, g, b);
    } else if (parameterTypes.has<ParameterCyan>() ||
        parameterTypes.has<ParameterMagenta>() ||
        parameterTypes.has<ParameterYellow>()) {
      final c = 255 - (getFirstOfType<ParameterCyan>()?.dmxCoarse?.clamp(0.0, 255.0) ?? 0).toInt();
      final m = 255 - (getFirstOfType<ParameterMagenta>()?.dmxCoarse?.clamp(0.0, 255.0) ?? 0).toInt();
      final y = 255 - (getFirstOfType<ParameterYellow>()?.dmxCoarse?.clamp(0.0, 255.0) ?? 0).toInt();
      color = Color.fromARGB(255, c, m, y);
    }
    return color;
  }
}
