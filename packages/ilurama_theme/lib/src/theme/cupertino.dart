// ignore_for_file: non_constant_identifier_names
import 'package:flutter/cupertino.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import './colors.dart';
import './material.dart';
import './neumorphic.dart';

final CUPERTINO_LIGHT_THEME = MaterialBasedCupertinoThemeData(
  materialTheme: MATERIAL_LIGHT_THEME,
).copyWith(
  brightness: Brightness.light,
  primaryColor: IluramaColors.accentColor,
  primaryContrastingColor: IluramaColors.textOverAccent,
  barBackgroundColor: NEUMORPHIC_LIGHT_THEME.baseColor.withOpacity(0.8),
);

final CUPERTINO_DARK_THEME = MaterialBasedCupertinoThemeData(
  materialTheme: MATERIAL_DARK_THEME,
).copyWith(
  brightness: Brightness.dark,
  primaryColor: IluramaColors.accentColor,
  primaryContrastingColor: IluramaColors.textOverAccent,
  barBackgroundColor: NEUMORPHIC_DARK_THEME.variantColor.withOpacity(0.8),
);

CupertinoThemeData cupertinoThemeData(BuildContext context) {
  final isDark = NeumorphicTheme.of(context)?.isUsingDark ?? false;
  return isDark ? CUPERTINO_DARK_THEME : CUPERTINO_LIGHT_THEME;
}
