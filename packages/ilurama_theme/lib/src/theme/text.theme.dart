import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import '../styles/text_styles.dart';

const dark = Typography.blackCupertino;
const light = Typography.whiteCupertino;

/// Font used in Ilurama Theme: SF Pro Display & Text
abstract class IluramaFontFamily {
  /// Font for typography over 20pt
  static const display = 'LSFProDisplay';

  /// Font for typography under 20pt
  static const text = 'LSFProText';

  /// Font package
  static const package = 'lucu_theme';
}

const defaultTextTheme = appTextThemeLight;

const TextTheme appTextThemeLight = TextTheme(
  headline1: TextStyle(
      debugLabel: 'iluramaTheme light headline1',
      fontFamily: IluramaFontFamily.display,
      fontSize: 34,
      package: IluramaFontFamily.package,
      fontWeight: FW.bold,
      letterSpacing: -0.4,
      color: Colors.black),
  headline2: TextStyle(
      debugLabel: 'iluramaTheme light headline2',
      fontFamily: IluramaFontFamily.display,
      fontSize: 28,
      package: IluramaFontFamily.package,
      fontWeight: FW.heavy,
      letterSpacing: -1,
      color: Colors.black),
  headline3: TextStyle(
      debugLabel: 'iluramaTheme light headline3',
      fontFamily: IluramaFontFamily.display,
      fontSize: 22,
      package: IluramaFontFamily.package,
      fontWeight: FW.heavy,
      letterSpacing: -0.6,
      color: Colors.black),
  headline4: TextStyle(
      debugLabel: 'iluramaTheme light headline4',
      fontFamily: IluramaFontFamily.display,
      fontSize: 22,
      package: IluramaFontFamily.package,
      fontWeight: FW.medium,
      letterSpacing: 0.4,
      color: Colors.black),
  headline5: TextStyle(
      debugLabel: 'iluramaTheme light headline5',
      fontFamily: IluramaFontFamily.display,
      fontSize: 20,
      package: IluramaFontFamily.package,
      fontWeight: FW.bold,
      letterSpacing: -0.6,
      color: Colors.black),
  headline6: TextStyle(
      debugLabel: 'iluramaTheme light headline6',
      fontFamily: IluramaFontFamily.text,
      fontSize: 17,
      package: IluramaFontFamily.package,
      fontWeight: FW.semiBold,
      letterSpacing: -0.4,
      color: Colors.black),
  subtitle1: TextStyle(
      debugLabel: 'iluramaTheme light subtitle1',
      fontFamily: IluramaFontFamily.text,
      fontSize: 15,
      package: IluramaFontFamily.package,
      fontWeight: FW.regular,
      letterSpacing: -0.4,
      color: Colors.black),
  subtitle2: TextStyle(
      debugLabel: 'iluramaTheme light subtitle2',
      fontFamily: IluramaFontFamily.text,
      fontSize: 9,
      package: IluramaFontFamily.package,
      fontWeight: FW.medium,
      letterSpacing: 0.5,
      color: Colors.black),
  bodyText1: TextStyle(
      debugLabel: 'iluramaTheme light bodyText1',
      fontFamily: IluramaFontFamily.text,
      fontSize: 17,
      package: IluramaFontFamily.package,
      fontWeight: FW.regular,
      letterSpacing: 0,
      color: Colors.black),
  bodyText2: TextStyle(
      debugLabel: 'iluramaTheme light bodyText2',
      fontFamily: IluramaFontFamily.text,
      fontSize: 15,
      package: IluramaFontFamily.package,
      fontWeight: FW.regular,
      letterSpacing: 0,
      color: Colors.black),
  caption: TextStyle(
      debugLabel: 'iluramaTheme light caption',
      fontFamily: IluramaFontFamily.text,
      fontSize: 10,
      package: IluramaFontFamily.package,
      fontWeight: FW.medium,
      letterSpacing: 0,
      color: Colors.black),
  button: TextStyle(
      debugLabel: 'iluramaTheme light button',
      fontFamily: IluramaFontFamily.text,
      fontSize: 17,
      package: IluramaFontFamily.package,
      fontWeight: FW.medium,
      letterSpacing: -1,
      color: Colors.black),
  overline: TextStyle(
      debugLabel: 'iluramaTheme light overline',
      fontFamily: IluramaFontFamily.text,
      fontSize: 13,
      package: IluramaFontFamily.package,
      fontWeight: FW.regular,
      letterSpacing: 0,
      color: Colors.black),
);

const TextTheme appTextThemeDark = TextTheme(
  headline1: TextStyle(
      debugLabel: 'iluramaTheme dark headline1',
      fontFamily: IluramaFontFamily.display,
      fontSize: 34,
      package: IluramaFontFamily.package,
      fontWeight: FW.bold,
      letterSpacing: -0.4,
      color: Colors.white),
  headline2: TextStyle(
      debugLabel: 'iluramaTheme dark headline2',
      fontFamily: IluramaFontFamily.display,
      fontSize: 28,
      package: IluramaFontFamily.package,
      fontWeight: FW.heavy,
      letterSpacing: -1,
      color: Colors.white),
  headline3: TextStyle(
      debugLabel: 'iluramaTheme dark headline3',
      fontFamily: IluramaFontFamily.display,
      fontSize: 22,
      package: IluramaFontFamily.package,
      fontWeight: FW.heavy,
      letterSpacing: -0.6,
      color: Colors.white),
  headline4: TextStyle(
      debugLabel: 'iluramaTheme dark headline4',
      fontFamily: IluramaFontFamily.display,
      fontSize: 22,
      package: IluramaFontFamily.package,
      fontWeight: FW.medium,
      letterSpacing: 0.4,
      color: Colors.white),
  headline5: TextStyle(
      debugLabel: 'iluramaTheme dark headline5',
      fontFamily: IluramaFontFamily.display,
      fontSize: 20,
      package: IluramaFontFamily.package,
      fontWeight: FW.bold,
      letterSpacing: -0.6,
      color: Colors.white),
  headline6: TextStyle(
      debugLabel: 'iluramaTheme dark headline6',
      fontFamily: IluramaFontFamily.text,
      fontSize: 17,
      package: IluramaFontFamily.package,
      fontWeight: FW.semiBold,
      letterSpacing: -0.4,
      color: Colors.white),
  subtitle1: TextStyle(
      debugLabel: 'iluramaTheme dark subtitle1',
      fontFamily: IluramaFontFamily.text,
      fontSize: 15,
      package: IluramaFontFamily.package,
      fontWeight: FW.regular,
      letterSpacing: -0.4,
      color: Colors.white),
  subtitle2: TextStyle(
      debugLabel: 'iluramaTheme dark subtitle2',
      fontFamily: IluramaFontFamily.text,
      fontSize: 9,
      package: IluramaFontFamily.package,
      fontWeight: FW.medium,
      letterSpacing: 0.5,
      color: Colors.white),
  bodyText1: TextStyle(
      debugLabel: 'iluramaTheme dark bodyText1',
      fontFamily: IluramaFontFamily.text,
      fontSize: 17,
      package: IluramaFontFamily.package,
      fontWeight: FW.regular,
      letterSpacing: 0,
      color: Colors.white),
  bodyText2: TextStyle(
      debugLabel: 'iluramaTheme dark bodyText2',
      fontFamily: IluramaFontFamily.text,
      fontSize: 15,
      package: IluramaFontFamily.package,
      fontWeight: FW.regular,
      letterSpacing: 0,
      color: Colors.white),
  caption: TextStyle(
      debugLabel: 'iluramaTheme dark caption',
      fontFamily: IluramaFontFamily.text,
      fontSize: 10,
      package: IluramaFontFamily.package,
      fontWeight: FW.medium,
      letterSpacing: 0,
      color: Colors.white),
  button: TextStyle(
      debugLabel: 'iluramaTheme dark button',
      fontFamily: IluramaFontFamily.text,
      fontSize: 17,
      package: IluramaFontFamily.package,
      fontWeight: FW.medium,
      letterSpacing: -1,
      color: Colors.white),
  overline: TextStyle(
      debugLabel: 'iluramaTheme dark overline',
      fontFamily: IluramaFontFamily.text,
      fontSize: 13,
      package: IluramaFontFamily.package,
      fontWeight: FW.regular,
      letterSpacing: 0,
      color: Colors.white),
);
