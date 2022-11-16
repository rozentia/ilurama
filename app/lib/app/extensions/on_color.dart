import 'dart:ui';

import 'package:tinycolor2/tinycolor2.dart';

extension ExtendedColor on Color {
  TinyColor get tinyColor => TinyColor.fromColor(this);
  double get hue => tinyColor.toHSLColor().hue;
  double get saturation => tinyColor.toHSLColor().saturation;
  bool get isDark => tinyColor.isDark();
  bool get isLight => tinyColor.isLight();
  String get toHex8 => tinyColor.toHex8();
  double get lightness => tinyColor.toHSLColor().lightness;
}

extension ExtendedTinyColor on TinyColor {
  double get hue => toHSLColor().hue;
  double get stauration => toHSLColor().saturation;
}
