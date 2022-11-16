import 'dart:ui';

import 'package:tinycolor2/tinycolor2.dart';

extension ExtendedColor on Color {
  TinyColor get _tinyColor => toTinyColor();

  /// Returns the inherent brightness of the color
  Brightness get colorBrightness => _tinyColor.isLight() ? Brightness.light : Brightness.dark;
  double get colorLuminance => _tinyColor.getLuminance();
  Color get complement => _tinyColor.complement().color;
  Color mix(Color toColor, [int amount = 50]) => _tinyColor.mix(toColor, amount).color;
  Color lighten([int amount = 10]) => _tinyColor.lighten(amount).color;
  Color brighten([int amount = 10]) => _tinyColor.brighten(amount).color;
  Color darken([int amount = 10]) => _tinyColor.darken(amount).color;
  Color tint([int amount = 10]) => _tinyColor.tint(amount).color;
  Color desaturate([int amount = 10]) => _tinyColor.desaturate(amount).color;
  Color saturate([int amount = 10]) => _tinyColor.saturate(amount).color;
}
