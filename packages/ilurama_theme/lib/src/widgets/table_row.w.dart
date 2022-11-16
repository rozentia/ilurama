import 'package:flutter/cupertino.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../extensions/extensions.dart';
import '../styles/styles.dart';
import '../theme/theme.dart';
import '../widgets/widgets.dart';

enum TableRowLocation {
  first,
  middle,
  last,
  single,
}

class IluramaTableRow extends StatelessWidget {
  final String? title;
  final TextStyle? titleStyle;
  final String? subtitleText;
  final TextStyle? subtitleStyle;
  final Widget? subtitleWidget;
  final Widget? leading;
  final TableRowLocation rowLocation;
  final Widget? trailing;
  final void Function()? onTap;
  final bool disabled;
  final BorderSide? border;
  final EdgeInsets contentPadding;
  final Color? backgroundColor;

  const IluramaTableRow({
    required Key key,
    this.title,
    this.titleStyle,
    this.subtitleText,
    this.subtitleStyle,
    this.subtitleWidget,
    this.leading,
    this.rowLocation = TableRowLocation.middle,
    this.trailing,
    this.onTap,
    this.disabled = false,
    this.border,
    this.contentPadding = const EdgeInsets.all(0),
    this.backgroundColor,
  }) : super(key: key);

  static const basePadding = 16.0;

  static TableRowLocation resolveRowLocation(int index, int length) {
    if (length == 0 || index + 1 > length) {
      return TableRowLocation.single;
    }
    if (length == 1) {
      return TableRowLocation.single;
    } else if (index + 1 == length) {
      return TableRowLocation.last;
    } else if (index == 0 && length > 1) {
      return TableRowLocation.first;
    } else {
      return TableRowLocation.middle;
    }
  }

  @override
  Widget build(BuildContext context) {
    final decorationBorder = backgroundColor == null
        ? Border(
            top: rowLocation == TableRowLocation.first || rowLocation == TableRowLocation.single
                ? border ?? dividerBorder(context)
                : BorderSide.none,
            bottom: rowLocation == TableRowLocation.last || rowLocation == TableRowLocation.single
                ? border ?? dividerBorder(context)
                : BorderSide.none,
          )
        : null;
    final topRadius = rowLocation == TableRowLocation.first || rowLocation == TableRowLocation.single
        ? const Radius.circular(10)
        : Radius.zero;
    final bottomRadius = rowLocation == TableRowLocation.last || rowLocation == TableRowLocation.single
        ? const Radius.circular(10)
        : Radius.zero;
    final borderRadius = backgroundColor == null
        ? null
        : BorderRadius.only(
            topLeft: topRadius,
            topRight: topRadius,
            bottomLeft: bottomRadius,
            bottomRight: bottomRadius,
          );

    return GestureDetector(
      onTap: onTap ?? () {},
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor ?? Colors.transparent,
          borderRadius: borderRadius,
          border: decorationBorder,
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: IluramaTableRow.basePadding),
          child: Container(
              padding: contentPadding,
              decoration: BoxDecoration(
                border: Border(
                    bottom: rowLocation == TableRowLocation.first || rowLocation == TableRowLocation.middle
                        ? dividerBorder(context)
                        : BorderSide.none),
              ),
              //= Items
              child: Opacity(
                opacity: disabled ? 0.5 : 1.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    leading ?? Container(),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),
                          TextLine(title, style: titleStyle ?? bodyText1(context).copyWith(letterSpacing: -0.2)),
                          if (subtitleText != null && subtitleText!.isNotEmpty)
                            Padding(
                              padding: const EdgeInsets.only(top: 3.0),
                              child: TextLine(
                                subtitleText,
                                style: bodyText2(context).copyWith(
                                  letterSpacing: -0.2,
                                  color: secondaryColor(context),
                                ),
                              ),
                            )
                          else if (subtitleWidget != null)
                            subtitleWidget!,
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                    trailing ?? Container(),
                    if (onTap != null)
                      SizedBox(
                        width: 14.0,
                        child: Center(
                          child: Icon(
                            CupertinoIcons.chevron_right,
                            color: context.dividerColor,
                            size: 14.0,
                          ),
                        ),
                      ),
                    const SizedBox(width: IluramaTableRow.basePadding),
                  ],
                ),
              )),
        ),
        // ),
      ),
    );
  }
}

class TableRowIcon extends StatelessWidget {
  final IconData icon;
  final Color? color;
  final double size;
  final EdgeInsets? margin;
  final void Function()? onTap;
  const TableRowIcon(
    this.icon, {
    Key? key,
    this.color,
    this.size = 16.0,
    this.margin,
    this.onTap,
  }) : super(key: key);

  factory TableRowIcon.leading(IconData icon) => TableRowIcon(icon);

  factory TableRowIcon.action(
    IconData icon, {
    Color? color,
    double size = 22.0,
    void Function()? onTap,
  }) =>
      TableRowIcon(
        icon,
        color: color ?? IluramaColors.accentColor,
        size: size,
        onTap: onTap,
      );

  factory TableRowIcon.subtitleInfo(IconData icon, {Color? color}) => TableRowIcon(
        icon,
        size: 12.0,
        color: color,
        margin: const EdgeInsets.only(right: 4.0),
      );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: margin ?? const EdgeInsets.only(right: IluramaTableRow.basePadding - 6),
        child: Center(
          child: Icon(
            icon,
            size: size,
            color: color ?? secondaryColor(context),
          ),
        ),
      ),
    );
  }
}

/// Returns an horizontally concatenated row of [IconData, String or Widget]
class TableRowSubtitlePlatter extends StatelessWidget {
  final List<dynamic> items;
  const TableRowSubtitlePlatter(
    this.items, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 3.0),
      child: Row(
        children: items.map<Widget>((item) {
          if (item is IconData) {
            return TableRowIcon.subtitleInfo(item);
          } else if (item is String) {
            return Padding(
              padding: const EdgeInsets.only(right: 4.0),
              child: Text(item,
                  style: bodyText2(context).copyWith(
                    letterSpacing: -1.0,
                    color: secondaryColor(context),
                  )),
            );
          } else if (item is Widget) {
            return item;
          } else {
            return Container();
          }
        }).toList(),
      ),
    );
  }
}
