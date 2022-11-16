import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'element.dart';
import 'render.dart';

abstract class SliverPinnedPersistentHeaderDelegate {
  SliverPinnedPersistentHeaderDelegate({
    required this.minExtentProtoType,
    required this.maxExtentProtoType,
  });

  final Widget minExtentProtoType;
  final Widget maxExtentProtoType;

  Widget build(
    BuildContext context,
    double shrinkOffset,
    double? minExtent,
    double maxExtent,
    // ignore: avoid_positional_boolean_parameters
    bool overlapsContent,
  );

  bool shouldRebuild(covariant SliverPinnedPersistentHeaderDelegate oldDelegate);
}

class SliverPinnedPersistentHeader extends StatelessWidget {
  const SliverPinnedPersistentHeader({required this.delegate});
  final SliverPinnedPersistentHeaderDelegate delegate;
  @override
  Widget build(BuildContext context) {
    return SliverPinnedPersistentHeaderRenderObjectWidget(delegate);
  }
}

class SliverPinnedPersistentHeaderRenderObjectWidget extends RenderObjectWidget {
  const SliverPinnedPersistentHeaderRenderObjectWidget(this.delegate);
  final SliverPinnedPersistentHeaderDelegate delegate;

  @override
  RenderObjectElement createElement() {
    return SliverPinnedPersistentHeaderElement(this);
  }

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderSliverPinnedPersistentHeader();
  }
}

class SliverPinnedToBoxAdapter extends SingleChildRenderObjectWidget {
  const SliverPinnedToBoxAdapter({
    Key? key,
    Widget? child,
  }) : super(key: key, child: child);

  @override
  RenderSliverPinnedToBoxAdapter createRenderObject(BuildContext context) => RenderSliverPinnedToBoxAdapter();
}

class IluramaSliverAppbar extends StatelessWidget {
  const IluramaSliverAppbar({
    this.leading,
    this.title,
    this.actions,
    this.background,
    this.toolBarColor,
    this.onBuild,
    this.statusbarHeight,
    this.toolbarHeight,
    this.backgroundBuilder,
    this.backgroundBuilderHeightExtent,
  });
  final Widget? leading;
  final Widget? title;
  final Widget? actions;
  final Widget? background;
  final Widget Function(BuildContext)? backgroundBuilder;
  final double? backgroundBuilderHeightExtent;
  final Color? toolBarColor;
  final OnSliverPinnedPersistentHeaderDelegateBuild? onBuild;
  final double? toolbarHeight;
  final double? statusbarHeight;

  @override
  Widget build(BuildContext context) {
    final SafeArea? safeArea = context.findAncestorWidgetOfExactType<SafeArea>();
    double statusbarHeight = this.statusbarHeight ?? 0;
    final double toolbarHeight = this.toolbarHeight ?? kToolbarHeight;
    if (safeArea == null || !safeArea.top) {
      statusbarHeight = MediaQuery.of(context).padding.top;
    }
    final Widget toolbar = SizedBox(
      height: toolbarHeight + statusbarHeight,
    );
    final Widget maxExtentPrototype =
        backgroundBuilderHeightExtent != null ? SizedBox(height: backgroundBuilderHeightExtent) : background ?? toolbar;

    return SliverPinnedPersistentHeader(
      delegate: _ExtendedSliverAppbarDelegate(
        // minExtentProtoType: toolbar,
        maxExtentProtoType: maxExtentPrototype,
        title: title,
        leading: leading,
        actions: actions,
        background: backgroundBuilder != null ? backgroundBuilder!(context) : background,
        statusbarHeight: statusbarHeight,
        toolbarHeight: toolbarHeight,
        toolBarColor: toolBarColor,
        onBuild: onBuild,
      ),
    );
  }
}

const Widget zeroContainer = SizedBox(width: 0, height: 0);

class _ExtendedSliverAppbarDelegate extends SliverPinnedPersistentHeaderDelegate {
  _ExtendedSliverAppbarDelegate({
    // @required Widget minExtentProtoType,
    required Widget maxExtentProtoType,
    this.leading,
    this.title,
    this.actions,
    this.background,
    this.toolBarColor,
    this.onBuild,
    this.statusbarHeight,
    this.toolbarHeight,
  }) : super(
          minExtentProtoType: zeroContainer, //minExtentProtoType,
          maxExtentProtoType: maxExtentProtoType,
        );

  final Widget? leading;
  final Widget? title;
  final Widget? actions;
  final Widget? background;
  final Color? toolBarColor;
  final OnSliverPinnedPersistentHeaderDelegateBuild? onBuild;
  final double? toolbarHeight;
  final double? statusbarHeight;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    double? minExtent,
    double maxExtent,
    bool overlapsContent,
  ) {
    onBuild?.call(
      context,
      shrinkOffset,
      minExtent,
      maxExtent,
      overlapsContent,
    );

    final Widget titleWidget = title ?? Container();

    final Widget toolbar = SizedBox(
        height: toolbarHeight! + statusbarHeight!,
        child: Stack(
          children: [
            Positioned.fill(
              child: Padding(
                padding: EdgeInsets.only(top: statusbarHeight!),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    leading ?? Container(),
                    titleWidget,
                    actions ?? Container(),
                  ],
                ),
              ),
            )
          ],
        ));

    return Material(
      child: ClipRect(
        child: Stack(
          children: <Widget>[
            Positioned(
              top: -shrinkOffset,
              bottom: 0,
              left: 0,
              right: 0,
              child: maxExtentProtoType,
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: toolbar,
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool shouldRebuild(SliverPinnedPersistentHeaderDelegate oldDelegate) {
    if (oldDelegate.runtimeType != runtimeType) {
      return true;
    }

    return oldDelegate is _ExtendedSliverAppbarDelegate &&
        (oldDelegate.minExtentProtoType != minExtentProtoType ||
            oldDelegate.maxExtentProtoType != maxExtentProtoType ||
            oldDelegate.leading != leading ||
            oldDelegate.title != title ||
            oldDelegate.actions != actions ||
            oldDelegate.background != background ||
            oldDelegate.statusbarHeight != statusbarHeight ||
            oldDelegate.toolBarColor != toolBarColor ||
            oldDelegate.toolbarHeight != toolbarHeight ||
            oldDelegate.onBuild != onBuild);
  }
}

typedef OnSliverPinnedPersistentHeaderDelegateBuild = void Function(
  BuildContext context,
  double shrinkOffset,
  double? minExtent,
  double maxExtent,
  bool overlapsContent,
);
