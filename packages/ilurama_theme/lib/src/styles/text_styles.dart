import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../extensions/extensions.dart';
import '../theme/colors.dart';
import '../theme/text.theme.dart';

abstract class FW {
  static const FontWeight thin = FontWeight.w100;
  static const FontWeight extraLight = FontWeight.w200;
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight heavy = FontWeight.w800;
  static const FontWeight black = FontWeight.w900;
}

TextStyle headline6([BuildContext? context]) => _getTextTheme(context)?.headline6 ?? defaultTextTheme.headline6!;
TextStyle headline5([BuildContext? context]) => _getTextTheme(context)?.headline5 ?? defaultTextTheme.headline5!;
TextStyle headline4([BuildContext? context]) => _getTextTheme(context)?.headline4 ?? defaultTextTheme.headline4!;
TextStyle headline3([BuildContext? context]) => _getTextTheme(context)?.headline3 ?? defaultTextTheme.headline3!;
TextStyle headline2([BuildContext? context]) => _getTextTheme(context)?.headline2 ?? defaultTextTheme.headline2!;
TextStyle headline1([BuildContext? context]) => _getTextTheme(context)?.headline1 ?? defaultTextTheme.headline1!;
TextStyle overline([BuildContext? context]) => _getTextTheme(context)?.overline ?? defaultTextTheme.overline!;
TextStyle button([BuildContext? context]) => _getTextTheme(context)?.button ?? defaultTextTheme.button!;
TextStyle caption([BuildContext? context]) => _getTextTheme(context)?.caption ?? defaultTextTheme.caption!;
TextStyle subtitle1([BuildContext? context]) => _getTextTheme(context)?.subtitle1 ?? defaultTextTheme.subtitle1!;
TextStyle subtitle2([BuildContext? context]) => _getTextTheme(context)?.subtitle2 ?? defaultTextTheme.subtitle2!;
TextStyle bodyText1([BuildContext? context]) => _getTextTheme(context)?.bodyText1 ?? defaultTextTheme.bodyText1!;
TextStyle bodyText2([BuildContext? context]) => _getTextTheme(context)?.bodyText2 ?? defaultTextTheme.bodyText2!;

TextTheme? _getTextTheme(BuildContext? context) => context != null ? Theme.of(context).textTheme : null;

extension StyledStrings on String {
  Widget asHeadline6(BuildContext context) => Text(this, style: headline6(context));
  Widget asHeadline5(BuildContext context) => Text(this, style: headline5(context));
  Widget asHeadline4(BuildContext context) => Text(this, style: headline4(context));
  Widget asHeadline3(BuildContext context) => Text(this, style: headline3(context));
  Widget asHeadline2(BuildContext context) => Text(this, style: headline2(context));
  Widget asHeadline1(BuildContext context) => Text(this, style: headline1(context));
  Widget asOverline(BuildContext context) => Text(this, style: overline(context));
  Widget asButton(BuildContext context) => Text(this, style: button(context));
  Widget asCaption(BuildContext context) => Text(this, style: caption(context));
  Widget asSubtitle1(BuildContext context) => Text(this, style: subtitle1(context));
  Widget asSubtitle2(BuildContext context) => Text(this, style: subtitle2(context));
  Widget asBodyText1(BuildContext context) => Text(this, style: bodyText1(context));
}

extension ExtendedTextStyles on TextStyle {
  TextStyle secondary(BuildContext context) =>
      copyWith(color: context.isLight ? IluramaColors.secondaryColor.light : IluramaColors.secondaryColor.dark);
  TextStyle get thin => copyWith(fontWeight: FW.thin);
  TextStyle get extraLight => copyWith(fontWeight: FW.extraLight);
  TextStyle get light => copyWith(fontWeight: FW.light);
  TextStyle get regular => copyWith(fontWeight: FW.regular);
  TextStyle get medium => copyWith(fontWeight: FW.medium);
  TextStyle get semiBold => copyWith(fontWeight: FW.semiBold);
  TextStyle get bold => copyWith(fontWeight: FW.bold);
  TextStyle get heavy => copyWith(fontWeight: FW.heavy);
  TextStyle get black => copyWith(fontWeight: FW.black);
}
