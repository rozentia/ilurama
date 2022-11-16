import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart' hide BackButton;
import 'package:shared_extensions/shared_extensions.dart';

import '../styles/styles.dart';
import 'back_button.w.dart';
import 'buttons.w.dart';
import 'scaffolds/frosted_scaffold.vw.dart';
import 'text.w.dart';
import 'widget_size.w.dart';

class FrostedAppBar extends StatefulWidget {
  final double barHeight;
  final double maxBlur;
  final NeumorphicStyle? frostStyle;
  final Widget? leading;
  final List<Widget>? actions;
  final Widget? titleWidget;
  final String? titleString;
  final ValueNotifier<double> opacityListenable;
  final Alignment? titleAlignment;
  final Widget? customForeground;
  final Color? customFrostColor;

  /// The color of the back button icon shown when not yet
  /// scrolled up. Defaults to theme variant color with opacity 0.9
  final Color? backButtonIconSecondaryColor;

  /// If not null will place a backbutton instead of the provided leading widget
  final String? backButtonInfo;

  /// If true, the AppBar will always be visible and wont fade in
  final bool appBarAlwaysVisible;
  final bool foregroundAlwaysVisible;

  const FrostedAppBar({
    Key? key,
    required this.barHeight,
    this.maxBlur = 25,
    this.frostStyle,
    this.leading,
    this.actions = const [],
    this.titleWidget,
    this.titleString,
    required this.opacityListenable,
    this.appBarAlwaysVisible = false,
    this.foregroundAlwaysVisible = false,
    this.backButtonInfo,
    this.titleAlignment,
    this.customForeground,
    this.backButtonIconSecondaryColor,
    this.customFrostColor,
  }) : super(key: key);

  static double resolveOpacity({
    required double scrollOffset,
    required double barHeight,
  }) =>
      (scrollOffset / (barHeight - 0)).clamp(0.0, 1.0);

  @override
  _FrostedAppBarState createState() => _FrostedAppBarState();
}

class _FrostedAppBarState extends State<FrostedAppBar> {
  Size? size;

  @override
  Widget build(BuildContext context) {
    final statusBarHeight = MediaQuery.of(context).padding.top;
    final titleWidth = MediaQuery.of(context).size.width - ((size?.width ?? 0) * 2);
    return Stack(
      children: [
        //= Bar blur effect
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          height: widget.barHeight,
          child: ClipRect(
            child: ValueListenableBuilder<double>(
              valueListenable: widget.opacityListenable,
              builder: (_, value, __) {
                final blurValue =
                    widget.appBarAlwaysVisible ? widget.maxBlur : value.mapToRange(0.0, 1.0, 0.0, widget.maxBlur);
                return BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: blurValue,
                    sigmaY: blurValue,
                  ),
                  child: Container(
                    color: Colors.transparent,
                  ),
                );
              },
            ),
          ),
        ),
        //= Bar background style
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          height: widget.barHeight,
          child: ValueListenableBuilder<double>(
            valueListenable: widget.opacityListenable,
            builder: (_, value, __) {
              return Opacity(
                opacity: widget.appBarAlwaysVisible ? 1.0 : value,
                child: Neumorphic(
                  style: widget.frostStyle ??
                      NeumorphicStyle(
                        boxShape: const NeumorphicBoxShape.rect(),
                        intensity: 0.5,
                        color: widget.customFrostColor ?? frostColor(context),
                      ),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                        color: disabledColor(context),
                        width: 0.5,
                      )),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        //= Custom foreground
        if (widget.customForeground != null)
          Positioned.fill(
              child: ValueListenableBuilder<double>(
            valueListenable: widget.opacityListenable,
            builder: (_, value, __) => Opacity(
              opacity: widget.foregroundAlwaysVisible ? 1.0 : value,
              child: widget.customForeground,
            ),
          )),
        //= App Bar Foreground
        if (widget.customForeground == null)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: widget.barHeight,
            child: ValueListenableBuilder<double>(
              valueListenable: widget.opacityListenable,
              builder: (_, value, __) {
                return Container(
                  alignment: Alignment.bottomCenter,
                  height: widget.barHeight,
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 3),
                  child: Padding(
                    padding: EdgeInsets.only(top: statusBarHeight),
                    child: Stack(
                      children: [
                        //= Title
                        Positioned.fill(
                          child: Center(
                            child: Container(
                              padding: const EdgeInsets.only(left: 10, right: 10),
                              width: titleWidth,
                              alignment: widget.titleAlignment ?? Alignment.center,
                              child: Opacity(
                                opacity: widget.foregroundAlwaysVisible ? 1.0 : value,
                                child: widget.titleString != null && widget.titleString!.isNotEmpty
                                    ? TextLine(
                                        widget.titleString,
                                        style: headline6(context),
                                      )
                                    : widget.titleWidget ?? Container(),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //= Leading
                            if (widget.leading != null && widget.backButtonInfo == null)
                              Opacity(opacity: widget.foregroundAlwaysVisible ? 1.0 : value, child: widget.leading),
                            if (widget.backButtonInfo != null)
                              WidgetSize(
                                onChange: (Size? newSize) => setState(() {
                                  size = newSize;
                                }),
                                child: IluramaBackButton(
                                  showSecondary: value < 0.7,
                                  secondaryColor: widget.backButtonIconSecondaryColor,
                                  info: widget.backButtonInfo!.isEmpty ? 'Atrás' : widget.backButtonInfo,
                                ),
                              ),
                            SizedBox(height: widget.barHeight - statusBarHeight, width: 10),

                            //= Actions
                            if (widget.actions != null && widget.actions!.isNotEmpty)
                              Flexible(
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Opacity(
                                    opacity: widget.foregroundAlwaysVisible ? 1.0 : value,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: widget.actions!
                                          .map((e) => Flexible(
                                                child: e,
                                              ))
                                          .toList(),
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
      ],
    );
  }
}

class FrostedAppBarCustomForeground extends StatefulWidget {
  final List<Widget>? actions;
  final List<Widget>? leading;

  /// Resolver width between actions and leading widths located at the center
  final Widget? center;

  /// Full width widget positioned over the center
  final Widget? upper;

  /// Full width widget positioned under the center
  final Widget? lower;

  const FrostedAppBarCustomForeground({
    Key? key,
    this.actions,
    this.leading,
    this.center,
    this.upper,
    this.lower,
  }) : super(key: key);

  @override
  _FrostedAppBarCustomForegroundState createState() => _FrostedAppBarCustomForegroundState();
}

class _FrostedAppBarCustomForegroundState extends State<FrostedAppBarCustomForeground> {
  GlobalKey leadingKey = GlobalKey();
  GlobalKey actionsKey = GlobalKey();
  double? get resolvedWidth => leadingWidth == null || actionsWidth == null
      ? null
      : MediaQuery.of(context).size.width - ((leadingWidth! > actionsWidth! ? leadingWidth : actionsWidth)! * 2) - 50;
  double? leadingWidth;
  double? actionsWidth;

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(child: widget.upper ?? const SizedBox(height: 0)),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Stack(
              children: [
                //= Title Widget (dependant on leading and action widths)
                Positioned.fill(
                  child: Center(
                      child: SizedBox(
                    width: resolvedWidth ?? 100,
                    child: widget.center,
                  )),
                ),
                //= Leading and Action
                Positioned.fill(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //= Leading
                      if (widget.leading != null && widget.leading!.isNotEmpty)
                        WidgetSize(
                            onChange: (size) => setState(() {
                                  leadingWidth = size?.width;
                                }),
                            child: Row(children: widget.leading!)),
                      const Expanded(child: SizedBox()),
                      //= Actions
                      if (widget.actions != null && widget.actions!.isNotEmpty)
                        WidgetSize(
                          onChange: (size) => setState(() {
                            actionsWidth = size?.width;
                          }),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: widget.actions!,
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Flexible(child: widget.lower ?? const SizedBox(height: 0)),
      ],
    );
  }
}

/// If bottom is user, please provide bottomHeight in the heights static solver
class AppBarForegroundWithPrompt extends StatelessWidget {
  final String title;
  final String prompt;
  final double bottomPadding;
  final Widget? bottom;
  final Widget? action;
  final double statusBarHeight;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  const AppBarForegroundWithPrompt({
    Key? key,
    required this.title,
    required this.prompt,
    this.bottomPadding = 15.0,
    this.statusBarHeight = 0,
    this.controller,
    this.onChanged,
    this.onSubmitted,
    this.bottom,
    this.action,
  }) : super(key: key);

  static CustomForegroundHeightSolver heights({
    bool placeSearchBar = true,
    double bottomPadding = 15.0,
    double statusBarHeight = 0,
    double? bottomHeight,
  }) =>
      CustomForegroundHeightSolver(
        bottomPadding: bottomPadding,
        contentHeight:
            45.0 + 60.0 + (placeSearchBar ? 36.0 + 8.0 : 0.0) + (bottomHeight != null ? bottomHeight + 8.0 : 0),
        statusBarHeight: statusBarHeight,
      );

  @override
  Widget build(BuildContext context) {
    final bool placeSearchBar = controller != null || onChanged != null || onSubmitted != null;
    return Padding(
      padding: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: bottomPadding),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IluramaTextButton(
                icon: CupertinoIcons.xmark_circle_fill,
                size: 45,
                iconColor: secondaryColor(context),
                onPressed: () => Navigator.of(context).pop(false),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Center(
                    child: Text(
                      prompt,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      maxLines: 2,
                      style: overline(context).copyWith(color: secondaryColor(context)),
                    ),
                  ),
                ),
              ),
              Flexible(child: action ?? const SizedBox(width: 45)),
            ],
          ),
          SizedBox(
            height: 30,
            child: TextLine(title, style: headline6(context)),
          ),
          if (bottom != null) const SizedBox(height: 8),
          if (bottom != null) bottom!,
          if (placeSearchBar) const SizedBox(height: 8),
          if (placeSearchBar)
            SizedBox(
                height: 36,
                child: CupertinoSearchTextField(
                  placeholder: 'Buscar',
                  controller: controller,
                  onChanged: onChanged,
                  onSubmitted: onSubmitted,
                )),
        ],
      ),
    );
  }
}
