import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../../ilurama_theme.dart';
import '../theme/material.dart';
import '../theme/neumorphic.dart';

//= Neumorphic Theme
Color accentColor([BuildContext? context]) =>
    context != null ? NeumorphicTheme.currentTheme(context).accentColor : NEUMORPHIC_LIGHT_THEME.accentColor;
Color variantColor([BuildContext? context]) =>
    context != null ? NeumorphicTheme.currentTheme(context).variantColor : NEUMORPHIC_LIGHT_THEME.variantColor;
Color baseColor([BuildContext? context]) =>
    context != null ? NeumorphicTheme.currentTheme(context).baseColor : NEUMORPHIC_LIGHT_THEME.baseColor;
Brightness brightness([BuildContext? context]) => context != null
    ? NeumorphicTheme.isUsingDark(context)
        ? Brightness.dark
        : Brightness.light
    : Brightness.light;
Color criticalColor([BuildContext? context]) => IluramaColors.critical.from(context);
Color frostColor([BuildContext? context]) => IluramaColors.frost.from(context);
Color barrierModalColor([BuildContext? context]) => IluramaColors.barrierModalColor.from(context);

//= Material Theme
Color backgroundColor([BuildContext? context]) =>
    context != null ? Theme.of(context).backgroundColor : MATERIAL_LIGHT_THEME.backgroundColor;
Color primaryColor([BuildContext? context]) =>
    context != null ? Theme.of(context).primaryColor : MATERIAL_LIGHT_THEME.primaryColor;
Color primaryColorDark([BuildContext? context]) =>
    context != null ? Theme.of(context).primaryColorDark : MATERIAL_LIGHT_THEME.primaryColorDark;
Color primaryColorLight([BuildContext? context]) =>
    context != null ? Theme.of(context).primaryColorLight : MATERIAL_LIGHT_THEME.primaryColorLight;
Color secondaryColor([BuildContext? context]) => IluramaColors.secondaryColor.from(context);
Color buttonColor([BuildContext? context]) =>
    context != null ? Theme.of(context).buttonColor : MATERIAL_LIGHT_THEME.buttonColor;
Color errorColor([BuildContext? context]) =>
    context != null ? Theme.of(context).errorColor : MATERIAL_LIGHT_THEME.errorColor;
Color focusColor([BuildContext? context]) =>
    context != null ? Theme.of(context).focusColor : MATERIAL_LIGHT_THEME.focusColor;
Color highlightColor([BuildContext? context]) =>
    context != null ? Theme.of(context).highlightColor : MATERIAL_LIGHT_THEME.highlightColor;
Color indicatorColor([BuildContext? context]) =>
    context != null ? Theme.of(context).indicatorColor : MATERIAL_LIGHT_THEME.indicatorColor;
Color disabledColor([BuildContext? context]) =>
    context != null ? Theme.of(context).disabledColor : MATERIAL_LIGHT_THEME.disabledColor;
Color dividerColor([BuildContext? context]) =>
    context != null ? Theme.of(context).dividerColor : MATERIAL_LIGHT_THEME.dividerColor;
BorderSide dividerBorder([BuildContext? context]) => BorderSide(
      color: dividerColor(context),
      width: 0.5,
    );
