import 'dart:ui' show ImageFilter;

import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../styles/styles.dart';

const double _kTabBarHeight = 50.0;
const Color _kDefaultTabBarInactiveColor = CupertinoColors.inactiveGray;

class IluramaTabBar extends StatelessWidget implements PreferredSizeWidget {
  const IluramaTabBar({
    Key? key,
    required this.items,
    this.onTap,
    this.currentIndex = 0,
    this.backgroundColor,
    this.activeColor,
    this.bottomInset = 1,
    this.bottomContent,
    this.inactiveColor = _kDefaultTabBarInactiveColor,
    this.iconSize = 30.0,
  }) : super(key: key);

  final List<BottomNavigationBarItem> items;
  final ValueChanged<int>? onTap;
  final int currentIndex;
  final Color? backgroundColor;
  final Color? activeColor;
  final Color inactiveColor;
  final double iconSize;

  /// Empty space below tab bar
  final double bottomInset;
  final Widget? bottomContent;

  @override
  Size get preferredSize => Size.fromHeight(_kTabBarHeight + bottomInset);

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMediaQuery(context));

    final Color inactive = CupertinoDynamicColor.resolve(inactiveColor, context);

    return IconTheme.merge(
      data: IconThemeData(color: inactive, size: iconSize),
      child: SizedBox(
        height: preferredSize.height,
        child: Neumorphic(
          style: NeumorphicStyle(
            lightSource: LightSource.bottom,
            border: NeumorphicBorder(
              color: disabledColor(context),
              width: 0.3,
            ),
            boxShape: const NeumorphicBoxShape.rect(),
            intensity: 0.5,
            color: frostColor(context),
          ),
          child: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 25.0, sigmaY: 25.0),
              child: SizedBox(
                // padding: EdgeInsets.only(bottom: bottomInset),
                child: Semantics(
                  explicitChildNodes: true,
                  child: DefaultTextStyle(
                    style: Theme.of(context).textTheme.overline!.copyWith(color: inactive, letterSpacing: 0),
                    child: Column(mainAxisSize: MainAxisSize.min, children: [
                      SizedBox(
                        height: _kTabBarHeight,
                        child: Row(
                          // Align bottom since we want the labels to be aligned.
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: _buildTabItems(context),
                        ),
                      ),
                      SizedBox(height: bottomInset, child: bottomContent ?? const SizedBox()),
                    ]),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildTabItems(BuildContext context) {
    final List<Widget> result = <Widget>[];
    final CupertinoLocalizations localizations = CupertinoLocalizations.of(context);
    for (int index = 0; index < items.length; index += 1) {
      final bool active = index == currentIndex;
      result.add(
        IconTheme.merge(
          data: IconThemeData(color: secondaryColor(context)),
          child: DefaultTextStyle(
            style: caption(context).copyWith(color: secondaryColor(context)),
            child: _wrapActiveItem(
              context,
              Expanded(
                child: Semantics(
                  selected: active,
                  hint: localizations.tabSemanticsLabel(
                    tabIndex: index + 1,
                    tabCount: items.length,
                  ),
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: onTap == null
                        ? null
                        : () {
                            onTap!(index);
                          },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 4.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: _buildSingleTabItem(items[index], active),
                      ),
                    ),
                  ),
                ),
              ),
              active: active,
            ),
          ),
        ),
      );
    }

    return result;
  }

  List<Widget> _buildSingleTabItem(BottomNavigationBarItem item, bool active) {
    return <Widget>[
      Expanded(
        child: Center(child: active ? item.activeIcon : item.icon),
      ),
      if (item.label != null) Text(item.label!),
    ];
  }

  Widget _wrapActiveItem(BuildContext context, Widget item, {required bool active}) {
    if (!active) {
      return item;
    }

    final Color activeColor = this.activeColor ?? accentColor(context);

    return IconTheme.merge(
      data: IconThemeData(color: activeColor),
      child: DefaultTextStyle.merge(
        style: caption(context).copyWith(color: activeColor),
        child: item,
      ),
    );
  }

  IluramaTabBar copyWith({
    Key? key,
    List<BottomNavigationBarItem>? items,
    Color? backgroundColor,
    Color? activeColor,
    Color? inactiveColor,
    double? iconSize,
    Border? border,
    int? currentIndex,
    ValueChanged<int>? onTap,
    double? bottomInset,
    Widget? bottomContent,
  }) {
    return IluramaTabBar(
      key: key ?? this.key,
      items: items ?? this.items,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      activeColor: activeColor ?? this.activeColor,
      inactiveColor: inactiveColor ?? this.inactiveColor,
      iconSize: iconSize ?? this.iconSize,
      // border: border ?? this.border,
      currentIndex: currentIndex ?? this.currentIndex,
      onTap: onTap ?? this.onTap,
      bottomInset: bottomInset ?? this.bottomInset,
      bottomContent: bottomContent ?? this.bottomContent,
    );
  }
}
