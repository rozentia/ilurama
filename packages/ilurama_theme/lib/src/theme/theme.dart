// ignore_for_file: non_constant_identifier_names, constant_identifier_names
import 'package:flutter/cupertino.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import 'cupertino.dart';
import 'material.dart';
import 'neumorphic.dart';
import 'text.theme.dart';

export 'colors.dart';

// ignore: avoid_classes_with_only_static_members
class IluramaTheme {
  static final ThemeData material_light = MATERIAL_LIGHT_THEME;
  static final ThemeData material_dark = MATERIAL_DARK_THEME;
  static final CupertinoThemeData cupertino_light = CUPERTINO_LIGHT_THEME;
  static final CupertinoThemeData cupertino_dark = CUPERTINO_DARK_THEME;
  static final NeumorphicThemeData neumorphic_light = NEUMORPHIC_LIGHT_THEME;
  static final NeumorphicThemeData neumorphic_dark = NEUMORPHIC_DARK_THEME;
  static final TextTheme defaultTextTheme = defaultTextTheme;
  static const TextTheme material_textTheme_light = appTextThemeLight;
  static const TextTheme material_textTheme_dark = appTextThemeDark;

  static CupertinoThemeData cupertinoThemeData(BuildContext context) {
    final isDark = NeumorphicTheme.of(context)?.isUsingDark ?? false;
    return isDark ? CUPERTINO_DARK_THEME : CUPERTINO_LIGHT_THEME;
  }
}
