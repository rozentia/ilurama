// ignore_for_file: non_constant_identifier_names
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import './colors.dart';
import 'text.theme.dart';

final NEUMORPHIC_LIGHT_THEME = NeumorphicThemeData(
  depth: 10,
  baseColor: IluramaColors.neumorphicBase.light,
  accentColor: IluramaColors.accentColor,
  variantColor: IluramaColors.variantColor,
  defaultTextColor: IluramaColors.primaryTextColor.light,
  textTheme: appTextThemeLight,
  disabledColor: IluramaColors.disabled.light,
);

final NEUMORPHIC_DARK_THEME = NeumorphicThemeData(
  depth: 6,
  intensity: 2,
  baseColor: IluramaColors.neumorphicBase.dark,
  accentColor: IluramaColors.accentColor,
  variantColor: IluramaColors.variantColor,
  defaultTextColor: IluramaColors.primaryTextColor.dark,
  textTheme: appTextThemeDark,
  disabledColor: IluramaColors.disabled.dark,
  shadowDarkColor: ColorPalette.black.withOpacity(0.6),
  shadowLightColor: Colors.transparent,
  shadowDarkColorEmboss: Colors.black87,
  shadowLightColorEmboss: Colors.white24,
);
