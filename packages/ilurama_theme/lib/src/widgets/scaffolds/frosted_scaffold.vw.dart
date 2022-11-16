import 'dart:ui';

import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:pull_to_refresh_notification/pull_to_refresh_notification.dart';
import 'package:shared_extensions/shared_extensions.dart';

import '../../styles/styles.dart';
import '../../theme/colors.dart';
import '../app_refresh_indicator.w.dart';
import '../frosted_app_bar.w.dart';
import '../sliver_app_bar/widget.dart';

/// Solver to use with customAppoBarForeground Layout\
/// [contentHeight] is the sum of the height of all foreground items\
/// [bottomPadding] is the bottom space and the space from the foreground to the content\
/// [statusBarHeight] is ```MediaQuery.of(context).padding.top```
class CustomForegroundHeightSolver {
  final double contentHeight;
  final double bottomPadding;
  final double statusBarHeight;

  const CustomForegroundHeightSolver({
    required this.contentHeight,
    required this.bottomPadding,
    required this.statusBarHeight,
  });

  double get backgroundBuilderHeightExtent => contentHeight + statusBarHeight + (bottomPadding * 2);
  double get headerBackgroundBuilderHeight => contentHeight + statusBarHeight + bottomPadding;
  Widget get headerBackgroundBuilderWidget => SizedBox(height: headerBackgroundBuilderHeight);
  double get appBarHeight => contentHeight + bottomPadding;
}

class IluramaFrostedScaffold extends StatefulWidget {
  /// Title that will be used as big title and also in the appbar upon appears while scrolling\
  /// The appbar title can be overriden with appbarTitle to show something different
  final String? title;

  /// Title string that appears in the appbar when visible or when
  /// appBarforegroundAlwaysVisible is set to true\
  /// If null, appbar will not show any title at all
  final String? appBarTitle;

  final Future<bool> Function()? onRefresh;

  /// Custom widget to appear as appbar content,
  /// if null then regular appbar content will be shown
  final Widget? customAppbarForeground;

  /// Override theme frost color overlay effect
  final Color? customAppbarFrostColor;

  /// Override appbar height when using a large custom
  /// appbar foreground widget. Leave null for default device appbar height
  final double appbarHeight;

  /// The name of the previous route,
  /// if null then the widget provided in leading will take its place
  final String? backButtonInfo;
  final Widget? appBarLeading;
  final List<Widget>? appBarActions;
  final List<Widget> slivers;
  final Widget? headerBackground;

  /// Function to create Heroes into the appbar background, if used
  /// then backgroundBuilderHeightExtent must not be null and should
  /// equal the height extent of the background
  final Widget Function(BuildContext)? headerBackgroundBuilder;
  final double? backgroundBuilderHeightExtent;

  /// The appbar's frosted background visibility:
  /// true = always visible, false = fade in on scroll
  final bool appBarAlwaysVisible;

  /// The appbar's foreground widgets:
  /// true = always visible, false = fade in on scroll
  final bool appBarForegroundAlwaysVisible;

  /// The color of the back button icon shown when not yet
  /// scrolled up. Defaults to theme variant color with opacity 0.9
  final Color? backButtonIconSecondaryColor;

  /// The maximum amount of growth the title can reach upon overscolling
  final double titleGrowthFactor;

  /// The amount of dragging to trigger refresh future
  final double maxDragOffset;

  /// Bottom inset for content area to locate ads (leave empty for no bottomInset)
  final double? bottomInset;

  /// Widget that appears inside the bottom inset area (must have [bottomInset height or less])
  final Widget? bottomInsetContent;

  /// Closure to run when appbar opacity changes
  final void Function(double)? opacityListener;

  const IluramaFrostedScaffold({
    Key? key,
    this.onRefresh,
    this.headerBackground,
    this.slivers = const [],
    this.title,
    this.backButtonInfo,
    this.appBarLeading,
    this.appBarActions,
    this.customAppbarForeground,
    this.titleGrowthFactor = 8,
    this.appBarAlwaysVisible = false,
    this.appBarForegroundAlwaysVisible = false,
    this.appbarHeight = kToolbarHeight,
    this.backButtonIconSecondaryColor,
    this.headerBackgroundBuilder,
    this.backgroundBuilderHeightExtent,
    this.maxDragOffset = 100,
    this.customAppbarFrostColor,
    this.bottomInset,
    this.bottomInsetContent,
    this.appBarTitle,
    this.opacityListener,
  }) : super(key: key);

  @override
  _AppScaffoldState createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<IluramaFrostedScaffold> {
  final ScrollController _scrollController = ScrollController();
  final ValueNotifier<double> _opacityListenable = ValueNotifier(0);
  final ValueNotifier<double?> _refreshIndicator = ValueNotifier(0);
  final ValueNotifier<double> _overDrag = ValueNotifier(0);

  double? _statusBarHeight;
  double get _frostedBarHeight => widget.appbarHeight + _statusBarHeight!;
  bool isBusy = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _statusBarHeight = MediaQuery.of(context).padding.top;
    if (widget.opacityListener != null)
      _opacityListenable.addListener(() => widget.opacityListener!(_opacityListenable.value));
    _scrollController.addListener(() {
      final double scrollOffset = _scrollController.hasClients ? _scrollController.offset : 0;
      //= Frosted bar opacity listenable
      _opacityListenable.value = FrostedAppBar.resolveOpacity(scrollOffset: scrollOffset, barHeight: _frostedBarHeight);
      //= Progress indicator opacity listenable
      _refreshIndicator.value = AppBarRefreshIndicator.resolveValue(
        isBusy: isBusy,
        scrollOffset: scrollOffset,
        maxDragOffset: widget.maxDragOffset,
      );
      //= Overdrag listenable
      _overDrag.value = scrollOffset.clamp(-100, 0).toDouble() * -1;
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _opacityListenable.dispose();
    _refreshIndicator.dispose();
    _overDrag.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double? titleHeightPadding = widget.appBarAlwaysVisible ||
            widget.appBarForegroundAlwaysVisible ||
            widget.backButtonInfo != null ||
            widget.appBarLeading != null
        ? _frostedBarHeight
        : _statusBarHeight;

    return Scaffold(
      body: SafeArea(
        bottom: false,
        top: false,
        child: Stack(
          children: [
            Positioned.fill(
              child: PullToRefreshNotification(
                  maxDragOffset: widget.maxDragOffset,
                  pullBackOnRefresh: true,
                  onRefresh: widget.onRefresh ?? () async => true,
                  child:
                      CustomScrollView(controller: _scrollController, physics: const BouncingScrollPhysics(), slivers: [
                    PullToRefreshContainer(
                      (info) => widget.title?.isNotEmpty == true // && !widget.appBarForegroundAlwaysVisible
                          //= Page Title
                          ? SliverToBoxAdapter(
                              child: Padding(
                                  padding: EdgeInsets.only(top: titleHeightPadding!, left: 16, right: 16),
                                  child: ValueListenableBuilder<double>(
                                    valueListenable: _overDrag,
                                    builder: (context, value, _) => Text(
                                      widget.title!,
                                      style: headline2(context).copyWith(
                                        letterSpacing: 0.3,
                                        fontSize: headline2(context).fontSize! +
                                            value.clamp(0, 350).toDouble().mapToRange(
                                                  0,
                                                  350,
                                                  0,
                                                  widget.titleGrowthFactor,
                                                ),
                                      ),
                                    ),
                                  )),
                            )
                          //= Page Header
                          : IluramaSliverAppbar(
                              toolBarColor: Colors.transparent,
                              actions: AppBarRefreshIndicator.baseColor(
                                context: context,
                                listenableValue: _refreshIndicator,
                              ),
                              background: widget.title != null &&
                                      widget.title!.isNotEmpty &&
                                      !widget.appBarForegroundAlwaysVisible
                                  ? Padding(
                                      padding: EdgeInsets.only(
                                          top: MediaQuery.of(context).padding.top + 20, left: 20, right: 20),
                                      child: Text(widget.title!,
                                          style: headline5(context)
                                              .copyWith(fontSize: headline5(context).fontSize! + _overDrag.value)),
                                    )
                                  : widget.headerBackground ?? Container(),
                              backgroundBuilderHeightExtent: widget.backgroundBuilderHeightExtent,
                              backgroundBuilder: widget.headerBackgroundBuilder),
                    ),

                    //= Content Slivers
                    ...widget.slivers,
                  ])),
            ),
            //= Frosted Appbar
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: _frostedBarHeight,
              child: FrostedAppBar(
                leading: widget.appBarLeading,
                actions: widget.appBarActions,
                backButtonIconSecondaryColor: widget.backButtonIconSecondaryColor,
                barHeight: _frostedBarHeight,
                opacityListenable: _opacityListenable,
                titleString: widget.appBarTitle ?? widget.title,
                appBarAlwaysVisible: widget.appBarAlwaysVisible,
                foregroundAlwaysVisible: widget.appBarForegroundAlwaysVisible,
                backButtonInfo: widget.backButtonInfo,
                customForeground: widget.customAppbarForeground,
                customFrostColor: widget.customAppbarFrostColor,
              ),
            ),
            //= Bottom inset
            if (widget.bottomInset != null)
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                height: widget.bottomInset,
                child: Neumorphic(
                  style: const NeumorphicStyle(
                    color: Colors.transparent,
                    lightSource: LightSource.bottom,
                    boxShape: NeumorphicBoxShape.rect(),
                    intensity: 0.5,
                  ),
                  child: ClipRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 15.0,
                        sigmaY: 15.0,
                      ),
                      child: Container(
                        color: IluramaColors.frost.from(context),
                        child: widget.bottomInsetContent ?? const SizedBox(),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
