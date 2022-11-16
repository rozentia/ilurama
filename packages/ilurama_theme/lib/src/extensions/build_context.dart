import 'package:flutter/widgets.dart' as widgets;
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../../ilurama_theme.dart';

extension ExtendedContext on widgets.BuildContext {
  Brightness get brightness => MediaQuery.maybeOf(this)?.platformBrightness ?? Brightness.light;
  bool get isLight => (MediaQuery.maybeOf(this)?.platformBrightness ?? Brightness.light) == Brightness.light;

  ThemeData get currentTheme => Theme.of(this);
  NeumorphicThemeData? get currentNeumorphicTheme => NeumorphicTheme.of(this)?.current;

  Color get accentColor => currentNeumorphicTheme?.accentColor ?? currentTheme.accentColor;
  Color get variantColor => currentNeumorphicTheme?.variantColor ?? IluramaColors.variantColor;
  Color get baseColor => currentNeumorphicTheme?.baseColor ?? IluramaColors.neumorphicBase.light;
  Color get criticalColor => currentTheme.errorColor;
  Color get frostColor => isLight ? IluramaColors.frost.light : IluramaColors.frost.dark;
  Color get backgroundColor => currentTheme.backgroundColor;
  Color get primaryColor => currentTheme.primaryColor;
  Color get primaryColorLight => currentTheme.primaryColorLight;
  Color get primaryColorDark => currentTheme.primaryColorDark;
  Color get buttonColor => currentTheme.buttonColor;
  Color get errorColor => criticalColor;
  Color get focusColor => currentTheme.focusColor;
  Color get highlightColor => currentTheme.highlightColor;
  Color get indicatorColor => currentTheme.indicatorColor;
  Color get disabledColor => currentTheme.disabledColor;
  Color get dividerColor => currentTheme.dividerColor;
}
