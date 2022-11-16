import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../styles/styles.dart';
import '../theme/colors.dart';
import '../utils/gradient_painter.dart';
import 'list_tile_chip.w.dart';
import 'text.w.dart';

class AppListTile extends StatelessWidget {
  final Color? fill;
  final NeumorphicBorder? border;
  final GradientPainter? painter;
  final double strokeWidth;
  final EdgeInsets childPadding;
  final EdgeInsets margin;
  final NeumorphicStyle style;

  final Widget? leading;
  final Widget? title;
  final Widget? subtitle;
  final Widget? trailing;
  final bool isThreeLine;
  final bool? dense;
  final VisualDensity? visualDensity;
  final ShapeBorder? shape;
  final EdgeInsetsGeometry? contentPadding;
  final bool enabled;
  final void Function()? onTap;
  final void Function()? onLongPress;
  final bool selected;
  final Color? focusColor;
  final Color? hoverColor;
  final FocusNode? focusNode;
  final bool autofocus;
  final Color? tileColor;
  final Color? selectedTileColor;
  final ListTileChip? chipInfo;

  AppListTile({
    Key? key,
    this.leading,
    this.title,
    this.subtitle,
    this.trailing,
    this.isThreeLine = false,
    this.dense,
    this.visualDensity,
    this.shape,
    this.contentPadding,
    this.enabled = true,
    this.onTap,
    this.onLongPress,
    this.selected = false,
    this.focusColor,
    this.hoverColor,
    this.focusNode,
    this.autofocus = false,
    this.tileColor,
    this.selectedTileColor,
    this.fill,
    this.border,
    Gradient? gradient,
    this.strokeWidth = 2,
    this.childPadding = const EdgeInsets.symmetric(vertical: 8),
    this.style = const NeumorphicStyle(),
    this.margin = const EdgeInsets.all(8),
    this.chipInfo,
  })  : painter = gradient != null
            ? GradientPainter(
                gradient: gradient,
                strokeWidth: strokeWidth,
              )
            : null,
        super(key: key);

  factory AppListTile.accent({
    required String title,
    required String subtitle,
    required BuildContext context,
    void Function()? onTap,
    void Function()? onLongPress,
    Widget? leading,
    Widget? trailing,
    ListTileChip? chipInfo,
  }) =>
      AppListTile(
        title: TextLine(title),
        subtitle: TextLine(subtitle),
        leading: leading,
        trailing: trailing,
        chipInfo: chipInfo,
        onTap: onTap,
        onLongPress: onLongPress,
        fill: baseColor(context),
        style: NeumorphicStyle(
            depth: 0, boxShape: NeumorphicBoxShape.roundRect(const BorderRadius.all(Radius.circular(15)))),
      );

  factory AppListTile.bordered({
    required String title,
    required String subtitle,
    Gradient gradient = GradientPalette.defaultGradient,
    void Function()? onTap,
    void Function()? onLongPress,
    Widget? leading,
    Widget? trailing,
    ListTileChip? chipInfo,
  }) =>
      AppListTile(
        title: TextLine(title),
        subtitle: TextLine(subtitle),
        leading: leading,
        trailing: trailing,
        chipInfo: chipInfo,
        gradient: gradient,
        onTap: onTap,
        onLongPress: onLongPress,
        style: NeumorphicStyle(
            depth: 0, boxShape: NeumorphicBoxShape.roundRect(const BorderRadius.all(Radius.circular(15)))),
      );

  factory AppListTile.borderedSolid({
    required BuildContext context,
    required String title,
    required String subtitle,
    void Function()? onTap,
    void Function()? onLongPress,
    Widget? leading,
    Widget? trailing,
    ListTileChip? chipInfo,

    /// The color of the border (default: variantColor)
    Color? color,
  }) =>
      AppListTile(
        title: TextLine(title),
        subtitle: Text(subtitle),
        leading: leading,
        trailing: trailing,
        chipInfo: chipInfo,
        onTap: onTap,
        onLongPress: onLongPress,
        fill: Colors.transparent,
        border: NeumorphicBorder(color: color ?? baseColor(context), width: 2.5),
        style: NeumorphicStyle(
            depth: 0, boxShape: NeumorphicBoxShape.roundRect(const BorderRadius.all(Radius.circular(15)))),
      );

  @override
  Widget build(BuildContext context) {
    final listTile = Padding(
        padding: childPadding,
        child: ListTile(
          leading: leading,
          title: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: title,
          ),
          subtitle: subtitle,
          trailing: chipInfo ?? trailing,
          isThreeLine: isThreeLine,
          dense: dense,
          visualDensity: visualDensity,
          shape: shape,
          contentPadding: contentPadding,
          enabled: enabled,
          onTap: onTap,
          onLongPress: onLongPress,
          selected: selected,
          focusColor: focusColor,
          hoverColor: hoverColor,
          focusNode: focusNode,
          autofocus: autofocus,
          tileColor: tileColor,
          selectedTileColor: selectedTileColor,
        ));

    NeumorphicStyle nStyle = style;

    if (fill != null) {
      nStyle = nStyle.copyWith(color: fill);
    }

    if (border != null) {
      nStyle = nStyle.copyWith(border: border);
    }

    return painter != null
        ? Container(
            margin: margin,
            child: CustomPaint(
              painter: painter,
              child: listTile,
            ))
        : Neumorphic(
            margin: margin,
            style: nStyle,
            child: listTile,
          );
  }
}
