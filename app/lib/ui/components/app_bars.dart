import 'package:auto_route/auto_route.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:ilurama_theme/ilurama_theme.dart';
import 'package:star_menu/star_menu.dart';

import '../../app/extensions/extensions.dart';

class IluramaItemAppbar extends StatelessWidget {
  final ValueNotifier<double> fader;

  /// In the case of colorItem, it should be colorItem.itemCode + \n + colorItem.name
  /// To solve this title it will split '\n' and use first value
  final String title;

  /// When parentRouteShortTitle is null will return a modal appbar, otherwise will return a route appbar
  final String? parentRouteShortTitle;
  final StarMenu? starMenu;
  final List<Widget>? actions;

  const IluramaItemAppbar({
    Key? key,
    required this.fader,
    required this.title,
    this.parentRouteShortTitle,
    this.starMenu,
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => parentRouteShortTitle == null
      ? ModalAppBarForeground(
          title: title,
          fader: fader,
          starMenu: starMenu,
          actions: actions,
        )
      : RouteAppBarForeground(
          title: title,
          fader: fader,
          starMenu: starMenu,
          actions: actions,
          parentRouteShortTitle: parentRouteShortTitle!,
        );
}

class RouteAppBarForeground extends StatelessWidget {
  final ValueNotifier<double> fader;
  final String title;
  final String parentRouteShortTitle;
  final StarMenu? starMenu;
  final List<Widget>? actions;

  const RouteAppBarForeground({
    super.key,
    required this.title,
    required this.fader,
    required this.parentRouteShortTitle,
    this.starMenu,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          //W! Title
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 48.0),
              child: ValueListenableBuilder<double>(
                  valueListenable: fader,
                  builder: (context, value, widget) {
                    return Opacity(
                        opacity: value,
                        child: Text(
                          title.split('\n').join(' - '),
                          style: bodyText1(context),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ));
                  }),
            ),
          ),
          Row(
            children: [
              //W! Close Button
              ValueListenableBuilder<double>(
                  valueListenable: fader,
                  builder: (context, value, widget) {
                    return IluramaBackButton(
                      info: parentRouteShortTitle,
                      secondaryColor: IluramaColors.accentColor,
                      showSecondary: value > 0.0,
                    );
                  }),
              //: The icon below should be shown when this view is a bottom sheet
              // IconButton(
              //   onPressed: () => context.router.pop(),
              //   icon: const Icon(CupertinoIcons.xmark_circle_fill),
              //   color: secondaryColor(context),
              // ),
              const Expanded(child: SizedBox.expand()),
              //W! Action buttons
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ...(actions ?? []),
                  // FFEATURE feature: share the collection
                  //W! Share button
                  // IconButton(
                  //     color: accentColor(context),
                  //     icon: const Icon(CupertinoIcons.square_arrow_up),
                  //     onPressed: () => {}),
                  // const SizedBox(width: 5),
                  //W! Item Menu
                  optionOf(starMenu).getOrEmptyWidget((menu) => menu),
                ],
              ),
              const SizedBox(width: 10),
            ],
          ),
        ],
      ),
    );
  }
}

class ModalAppBarForeground extends StatelessWidget {
  final String title;
  final ValueNotifier<double> fader;
  final StarMenu? starMenu;
  final List<Widget>? actions;

  const ModalAppBarForeground({
    super.key,

    /// In the case of colorItem, it should be colorItem.itemCode + \n + colorItem.name
    /// To solve this title it will split '\n' and use first value
    required this.title,
    required this.fader,
    this.starMenu,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    final titleAndSubtitle = title.split('\n');

    return Row(
      children: [
        //W! Close Button
        IconButton(
          onPressed: () => context.router.pop(),
          icon: const Icon(CupertinoIcons.xmark_circle_fill),
          color: secondaryColor(context),
        ),
        //W! Title
        ValueListenableBuilder<double>(
            valueListenable: fader,
            builder: (context, value, widget) {
              return Opacity(
                  opacity: value,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      titleAndSubtitle.first.asHeadline5(context),
                      if (titleAndSubtitle.length > 1)
                        Text(
                          titleAndSubtitle.last,
                          style: subtitle1(context).copyWith(color: secondaryColor(context)),
                        ),
                    ],
                  ));
            }),
        const Expanded(child: SizedBox()),
        //W! Action buttons
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ...(actions ?? []),
            // FFEATURE feature: Share single product
            /*
            //= Share button
            IconButton(
                color: accentColor(context),
                icon: const Icon(CupertinoIcons.square_arrow_up),
                onPressed: () => {}),
            const SizedBox(width: 5),
            */
            optionOf(starMenu).getOrEmptyWidget((menu) => menu),
          ],
        ),
        const SizedBox(width: 10),
      ],
    );
  }
}
