import 'package:flutter/cupertino.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../styles/styles.dart';
import '../theme/colors.dart';
import '../theme/neumorphic.dart';
import '../utils/gradient_painter.dart';
import 'neumorphic_gradient.w.dart';
import 'text.w.dart';

final _baseStyle = NeumorphicStyle(
    depth: 0,
    boxShape: NeumorphicBoxShape.roundRect(
      const BorderRadius.all(Radius.circular(10)),
    ));

class CardTile extends StatelessWidget {
  final String title;
  final int titleMaxLines;

  /// defaults to headline 6
  final TextStyle? titleStyle;
  final String? subtitle;

  /// defaults to overline with secondary color
  final TextStyle? subtitleStyle;
  final IconData? icon;
  final Widget? iconWidget;
  final Color? iconColor;
  final EdgeInsets margin;
  final Color? fill;
  final NeumorphicBorder? border;
  final GradientPainter? painter;
  final NeumorphicStyle? style;
  final NeumorphicStyle? iconStyle;
  final double innerSpacing;
  final Widget? bottom;
  final Gradient? gradient;
  final Brightness? brightness;
  final Gradient? borderGradient;
  final double? strokeWidth;

  CardTile({
    Key? key,
    required this.title,
    this.subtitle,
    this.icon,
    this.iconColor,
    this.margin = EdgeInsets.zero,
    this.fill,
    this.border,
    this.style,
    this.innerSpacing = 15,
    this.iconStyle,
    this.bottom,
    this.gradient,
    this.brightness,
    this.borderGradient,
    this.strokeWidth = 2.0,
    this.iconWidget,
    this.titleStyle,
    this.subtitleStyle,
    this.titleMaxLines = 2,
  })  : painter = borderGradient != null
            ? GradientPainter(
                gradient: borderGradient,
                strokeWidth: strokeWidth,
              )
            : null,
        super(key: key);

  factory CardTile.accent({
    required BuildContext context,
    required String title,
    String? subtitle,
    TextStyle? titleStyle,
    TextStyle? subtitleStyle,
    IconData? icon,
    Widget? iconWidget,
    Color? iconColor,
    Brightness? brightness,
  }) =>
      CardTile(
        title: title,
        subtitle: subtitle,
        titleStyle: titleStyle,
        subtitleStyle: subtitleStyle,
        icon: icon,
        iconWidget: iconWidget,
        brightness: brightness,
        iconColor: iconColor,
        fill: baseColor(context),
      );

  factory CardTile.gradient({
    required String title,
    String? subtitle,
    TextStyle? titleStyle,
    TextStyle? subtitleStyle,
    IconData? icon,
    Widget? iconWidget,
    Color? iconColor,
    Brightness brightness = Brightness.light,
    Gradient? gradient,
  }) =>
      CardTile(
        title: title,
        subtitle: subtitle,
        titleStyle: titleStyle,
        subtitleStyle: subtitleStyle,
        icon: icon,
        iconWidget: iconWidget,
        iconColor: iconColor,
        brightness: brightness,
        gradient: gradient ?? GradientPalette.defaultGradient,
      );

  factory CardTile.bordered({
    required String title,
    String? subtitle,
    TextStyle? titleStyle,
    TextStyle? subtitleStyle,
    IconData? icon,
    Widget? iconWidget,
    Color? iconColor,
    Brightness? brightness,
    required Gradient borderGradient,
    double? strokeWidth,
  }) =>
      CardTile(
        title: title,
        subtitle: subtitle,
        titleStyle: titleStyle,
        subtitleStyle: subtitleStyle,
        icon: icon,
        iconWidget: iconWidget,
        iconColor: iconColor,
        brightness: brightness,
        borderGradient: borderGradient,
        strokeWidth: strokeWidth,
      );

  factory CardTile.borderedSolid({
    required BuildContext context,
    required String title,
    String? subtitle,
    TextStyle? titleStyle,
    TextStyle? subtitleStyle,
    IconData? icon,
    Widget? iconWidget,
    Color? iconColor,
    Brightness? brightness,
    Color? borderColor,
  }) =>
      CardTile(
        title: title,
        subtitle: subtitle,
        titleStyle: titleStyle,
        subtitleStyle: subtitleStyle,
        icon: icon,
        iconWidget: iconWidget,
        fill: Colors.transparent,
        iconColor: iconColor,
        brightness: brightness,
        border: NeumorphicBorder(color: borderColor ?? baseColor(context), width: 2.5),
      );

  @override
  Widget build(BuildContext context) {
    final NeumorphicStyle nStyle = (style ?? _baseStyle).copyWith(
      color: fill,
      border: border,
    );
    final NeumorphicStyle iStyle = iconStyle ??
        _baseStyle.copyWith(
          color: iconColor ?? secondaryColor(context),
        );

    final cardTile = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //= Upper area
        Expanded(
          child: Column(children: [
            //= Leading Icon
            if (icon != null)
              Flexible(
                child: Neumorphic(
                  padding: EdgeInsets.all(innerSpacing),
                  style: iStyle,
                  child: Icon(icon,
                      color: brightness == null
                          ? baseColor(context)
                          : brightness == Brightness.light
                              ? NEUMORPHIC_LIGHT_THEME.baseColor
                              : NEUMORPHIC_DARK_THEME.baseColor),
                ),
              ),
            //= Title
            if (icon != null) SizedBox(height: innerSpacing),
            Expanded(
              child: RichText(
                text: TextSpan(
                  text: title,
                  style: titleStyle ?? headline6(context).copyWith(fontWeight: FontWeight.w700),
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: titleMaxLines,
              ),
            ),
          ]),
        ),
        //= Lower area
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              //= Subtitle
              if (subtitle != null && subtitle?.isNotEmpty == true)
                Flexible(
                    child: TextLine(
                  subtitle,
                  style: subtitleStyle ?? overline(context).copyWith(color: secondaryColor(context)),
                )),
              //= Bottom widget
              if (bottom != null) const SizedBox(height: 0),
              bottom ?? Container(),
              //= Action icon
              if (iconWidget != null) const SizedBox(height: 0),
              iconWidget ?? Container()
            ],
          ),
        ),
      ],
    );

    return painter != null
        ? Container(
            margin: margin,
            child: CustomPaint(
              painter: painter,
              child: Padding(
                padding: EdgeInsets.all(innerSpacing),
                child: cardTile,
              ),
            ),
          )
        : gradient != null
            ? NeumorphicGradient(
                gradient: gradient, childPadding: EdgeInsets.all(innerSpacing), style: nStyle, child: cardTile)
            : Neumorphic(
                margin: margin,
                padding: EdgeInsets.all(innerSpacing),
                style: nStyle,
                child: cardTile,
              );
  }
}
