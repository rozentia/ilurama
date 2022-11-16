// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

import './colors.dart';
import 'text.theme.dart';

final ThemeData MATERIAL_LIGHT_THEME = ThemeData.from(
  colorScheme: lightColorScheme,
  textTheme: appTextThemeLight,
).copyWith(
  brightness: Brightness.light,
  canvasColor: Colors.black, // IluramaColors.canvasColor.light,
  scaffoldBackgroundColor: IluramaColors.canvasColor.light,
  accentColor: IluramaColors.accentColor,
  disabledColor: IluramaColors.disabled.light,
  dividerColor: IluramaColors.divider.light,
  // appBarTheme: appBarTheme.copyWith(systemOverlayStyle: SystemUiOverlayStyle.light),
  snackBarTheme: snackbarTheme,
);

final ThemeData MATERIAL_DARK_THEME = ThemeData.from(
  colorScheme: darkColorScheme,
  textTheme: appTextThemeDark,
).copyWith(
  brightness: Brightness.dark,
  canvasColor: Colors.black, // IluramaColors.canvasColor.dark,
  scaffoldBackgroundColor: IluramaColors.canvasColor.dark,
  accentColor: IluramaColors.accentColor,
  disabledColor: IluramaColors.disabled.dark,
  dividerColor: IluramaColors.divider.dark,
  // appBarTheme: appBarTheme.copyWith(systemOverlayStyle: SystemUiOverlayStyle.dark),
  snackBarTheme: snackbarTheme,
);

const snackbarTheme = SnackBarThemeData(
  backgroundColor: Colors.transparent,
  elevation: 0,
  behavior: SnackBarBehavior.floating,
);

const appBarTheme = AppBarTheme(
  color: Colors.transparent,
  elevation: 0,
  shadowColor: Colors.transparent,
  centerTitle: true,
);

final lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  background: IluramaColors.canvasColor.light,
  onBackground: Colors.black,
  error: IluramaColors.critical.light,
  onError: Colors.white,
  primary: IluramaColors.accentColor,
  primaryVariant: IluramaColors.variantColor,
  onPrimary: Colors.white,
  secondary: IluramaColors.secondaryColor.light,
  secondaryVariant: IluramaColors.secondaryColor.light.withOpacity(1),
  onSecondary: Colors.grey,
  surface: IluramaColors.canvasColor.light,
  onSurface: Colors.black,
);

final darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  background: IluramaColors.canvasColor.dark,
  onBackground: Colors.grey,
  error: IluramaColors.critical.dark,
  onError: Colors.white,
  primary: IluramaColors.accentColor,
  primaryVariant: IluramaColors.variantColor,
  onPrimary: Colors.white,
  secondary: IluramaColors.secondaryColor.dark,
  secondaryVariant: IluramaColors.secondaryColor.dark.withOpacity(1),
  onSecondary: Colors.grey,
  surface: IluramaColors.canvasColor.dark,
  onSurface: Colors.white,
);
