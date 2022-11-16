import 'package:dartz/dartz.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import '../theme/colors.dart';
import '../styles/styles.dart';
import 'text.w.dart';

class ListHeader extends StatelessWidget {
  final String text;

  /// Default to Headline 6
  final TextStyle? style;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final double? height;
  final List<Widget>? actions;
  final MainAxisAlignment mainAxisAlignment;
  final double actionSpacing;
  final BoxDecoration? decoration;
  const ListHeader({
    Key? key,
    required this.text,
    this.actions,
    this.padding = const EdgeInsets.all(0),
    this.margin = const EdgeInsets.only(top: 25, bottom: 10),
    this.style,
    this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
    this.actionSpacing = 5,
    this.decoration,
    this.height,
  }) : super(key: key);

  /// List Header Small with optional Actions
  factory ListHeader.small(
    String title,
    BuildContext context, {
    double sidePadding = 20,
    List<Tuple2<IconData, void Function()>> actions = const [],
  }) =>
      ListHeader(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: dividerColor(context).withOpacity(0.7),
              width: 0.4,
            ),
          ),
        ),
        padding: EdgeInsets.only(bottom: actions.isEmpty ? 20 : 3),
        margin: EdgeInsets.only(
          top: 40,
          bottom: 20,
          left: sidePadding,
          right: sidePadding,
        ),
        text: title.toUpperCase(),
        style: subtitle2(context).copyWith(color: secondaryColor(context), letterSpacing: 0.5),
        actions: actions
            .map((action) => IconButton(
                  icon: Icon(
                    action.value1,
                    color: accentColor(context),
                  ),
                  onPressed: action.value2,
                ))
            .toList(),
      );

  /// List Header Large with optional info
  factory ListHeader.large(
    String text,
    BuildContext context, {
    List<Widget> info = const [],
    double sidePadding = 20,
  }) =>
      ListHeader(
        text: text,
        style: headline3(context),
        mainAxisAlignment: MainAxisAlignment.start,
        margin: EdgeInsets.symmetric(vertical: 25, horizontal: sidePadding),
        actions: info,
      );

  /// Headline 5 list header
  factory ListHeader.medium(
    String text,
    BuildContext context, {
    List<Widget> info = const [],
    double sidePadding = 20,
  }) =>
      ListHeader(
        text: text,
        style: headline5(context),
        actions: info,
        padding: EdgeInsets.symmetric(horizontal: sidePadding),
      );

  @override
  Widget build(BuildContext context) => Container(
      decoration: decoration ?? const BoxDecoration(),
      margin: margin,
      padding: padding,
      // height: height ?? (style ?? headline6(context) ?? const TextStyle()).fontSize + 5,
      child: Row(
        mainAxisAlignment: mainAxisAlignment,
        children: [
          Expanded(
              child: TextLine(
            text,
            style: style ?? headline6(context),
          )),
          if (actions != null && actions!.isNotEmpty)
            Row(
              mainAxisSize: MainAxisSize.min,
              children: actions!.fold<List<Widget>>(
                [],
                (prev, curr) => [...prev, SizedBox(width: actionSpacing), curr],
              ),
            )
        ],
      ));
}

//-                                   EXTENSION

extension HeaderTextStyle on String {
  Widget inlineListHeader(
    BuildContext context, {
    double opacity = 0.5,
    Color? color,
    double letterSpacing = 0.5,
    double? fontSize,
  }) =>
      Text(toUpperCase(),
          style: caption(context).copyWith(
            color: (color ?? IluramaColors.secondaryColor.from(context)).withOpacity(opacity),
            letterSpacing: letterSpacing,
            fontSize: fontSize,
          ));

  Widget largeListHeader(
    BuildContext context, {
    double sidePadding = 20,
    List<Widget> info = const [],
  }) =>
      ListHeader.large(
        this,
        context,
        sidePadding: sidePadding,
        info: info,
      );

  Widget mediumListHeader(
    BuildContext context, {
    double sidePadding = 20,
    List<Widget> info = const [],
  }) =>
      ListHeader.medium(
        this,
        context,
        sidePadding: sidePadding,
        info: info,
      );

  Widget smallListHeader(
    BuildContext context, {
    double sidePadding = 20,
    List<Tuple2<IconData, void Function()>> actions = const [],
  }) =>
      ListHeader.small(
        this,
        context,
        sidePadding: sidePadding,
        actions: actions,
      );
}
