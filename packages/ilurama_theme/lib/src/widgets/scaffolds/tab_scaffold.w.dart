import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../bottom_tab_bar.w.dart';

class IluramaTabController extends ChangeNotifier {
  void Function(int)? onIndexChange;
  IluramaTabController({int initialIndex = 0})
      : _index = initialIndex,
        assert(initialIndex >= 0);

  bool _isDisposed = false;

  int get index => _index;
  int _index;
  set index(int value) {
    assert(value >= 0);
    if (_index == value) {
      return;
    }
    _index = value;
    if (onIndexChange != null) onIndexChange!(_index);
    notifyListeners();
  }

  @mustCallSuper
  @override
  void dispose() {
    super.dispose();
    _isDisposed = true;
  }
}

class IluramaTabScaffold extends StatefulWidget {
  /// Creates a layout for applications with a tab bar at the bottom.
  ///
  /// The [tabBar] and [tabBuilder] arguments must not be null.
  IluramaTabScaffold({
    Key? key,
    required this.tabBar,
    required this.tabBuilder,
    this.controller,
    this.backgroundColor,
    this.resizeToAvoidBottomInset = true,
    this.restorationId,
  })  : assert(
            controller == null || controller.index < tabBar.items.length,
            "The AppTabController's current index ${controller.index} is "
            'out of bounds for the tab bar with ${tabBar.items.length} tabs'),
        super(key: key);

  final IluramaTabBar tabBar;
  final IluramaTabController? controller;
  final IndexedWidgetBuilder tabBuilder;
  final Color? backgroundColor;
  final bool resizeToAvoidBottomInset;
  final String? restorationId;

  @override
  _IluramaTabScaffoldState createState() => _IluramaTabScaffoldState();
}

class _IluramaTabScaffoldState extends State<IluramaTabScaffold> with RestorationMixin {
  RestorableIluramaTabController? _internalController;
  IluramaTabController get _controller => widget.controller ?? _internalController!.value;

  @override
  String? get restorationId => widget.restorationId;

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    _restoreInternalController();
  }

  void _restoreInternalController() {
    if (_internalController != null) {
      registerForRestoration(_internalController!, 'controller');
      _internalController!.value.addListener(_onCurrentIndexChange);
    }
  }

  @override
  void initState() {
    super.initState();
    _updateTabController();
  }

  void _updateTabController([IluramaTabController? oldWidgetController]) {
    if (widget.controller == null && _internalController == null) {
      // No widget-provided controller: create an internal controller.
      _internalController = RestorableIluramaTabController(initialIndex: widget.tabBar.currentIndex);
      if (!restorePending) {
        _restoreInternalController(); // Also adds the listener to the controller.
      }
    }
    if (widget.controller != null && _internalController != null) {
      // Use the widget-provided controller.
      unregisterFromRestoration(_internalController!);
      _internalController?.dispose();
      _internalController = null;
    }
    if (oldWidgetController != widget.controller) {
      // The widget-provided controller has changed: move listeners.
      if (oldWidgetController?._isDisposed == false) {
        oldWidgetController?.removeListener(_onCurrentIndexChange);
      }
      widget.controller?.addListener(_onCurrentIndexChange);
    }
  }

  void _onCurrentIndexChange() {
    assert(
        _controller.index >= 0 && _controller.index < widget.tabBar.items.length,
        "The $runtimeType's current index ${_controller.index} is "
        'out of bounds for the tab bar with ${widget.tabBar.items.length} tabs');

    // The value of `_controller.index` has already been updated at this point.
    // Calling `setState` to rebuild using `_controller.index`.
    setState(() {});
  }

  @override
  void didUpdateWidget(IluramaTabScaffold oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.controller != oldWidget.controller) {
      _updateTabController(oldWidget.controller);
    } else if (_controller.index >= widget.tabBar.items.length) {
      // If a new [tabBar] with less than (_controller.index + 1) items is provided,
      // clamp the current index.
      _controller.index = widget.tabBar.items.length - 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData existingMediaQuery = MediaQuery.of(context);
    MediaQueryData newMediaQuery = MediaQuery.of(context);

    Widget content = _TabSwitchingView(
      currentTabIndex: _controller.index,
      tabCount: widget.tabBar.items.length,
      tabBuilder: widget.tabBuilder,
    );
    EdgeInsets contentPadding = EdgeInsets.zero;

    if (widget.resizeToAvoidBottomInset) {
      // Remove the view inset and add it back as a padding in the inner content.
      newMediaQuery = newMediaQuery.removeViewInsets(removeBottom: true);
      contentPadding = EdgeInsets.only(bottom: existingMediaQuery.viewInsets.bottom);
    }

    if (widget.tabBar != null &&
        // Only pad the content with the height of the tab bar if the tab
        // isn't already entirely obstructed by a keyboard or other view insets.
        // Don't double pad.
        (!widget.resizeToAvoidBottomInset ||
            widget.tabBar.preferredSize.height > existingMediaQuery.viewInsets.bottom)) {
      // (xster): Use real size after partial layout instead of preferred size.
      // https://github.com/flutter/flutter/issues/12912
      final double bottomPadding =
          // widget.tabBar.preferredSize.height +
          existingMediaQuery.padding.bottom;

      // If tab bar opaque, directly stop the main content higher. If
      // translucent, let main content draw behind the tab bar but hint the
      // obstructed area.
      // if (widget.tabBar.opaque(context)) {
      contentPadding = EdgeInsets.only(bottom: bottomPadding);
      newMediaQuery = newMediaQuery.removePadding(removeBottom: true);
      // } else {
      //   newMediaQuery = newMediaQuery.copyWith(
      //     padding: newMediaQuery.padding.copyWith(
      //       bottom: bottomPadding,
      //     ),
      //   );
      // }
    }

    content = MediaQuery(
      data: newMediaQuery,
      child: Padding(
        padding: contentPadding,
        child: content,
      ),
    );

    return DecoratedBox(
      decoration: BoxDecoration(
        color: CupertinoDynamicColor.maybeResolve(widget.backgroundColor, context) ??
            Theme.of(context).scaffoldBackgroundColor,
      ),
      child: Stack(
        children: <Widget>[
          // The main content being at the bottom is added to the stack first.
          content,
          MediaQuery(
            data: existingMediaQuery.copyWith(textScaleFactor: 1),
            child: Align(
              alignment: Alignment.bottomCenter,
              // Override the tab bar's currentIndex to the current tab and hook in
              // our own listener to update the [_controller.currentIndex] on top of a possibly user
              // provided callback.
              child: widget.tabBar.copyWith(
                currentIndex: _controller.index,
                onTap: (int newIndex) {
                  _controller.index = newIndex;
                  // Chain the user's original callback.
                  widget.tabBar.onTap?.call(newIndex);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    if (widget.controller?._isDisposed == false) {
      _controller.removeListener(_onCurrentIndexChange);
    }
    _internalController?.dispose();
    super.dispose();
  }
}

/// A widget laying out multiple tabs with only one active tab being built
/// at a time and on stage. Off stage tabs' animations are stopped.
class _TabSwitchingView extends StatefulWidget {
  const _TabSwitchingView({
    required this.currentTabIndex,
    required this.tabCount,
    required this.tabBuilder,
  });

  final int currentTabIndex;
  final int tabCount;
  final IndexedWidgetBuilder tabBuilder;

  @override
  _TabSwitchingViewState createState() => _TabSwitchingViewState();
}

class _TabSwitchingViewState extends State<_TabSwitchingView> {
  final List<bool> shouldBuildTab = <bool>[];
  final List<FocusScopeNode> tabFocusNodes = <FocusScopeNode>[];

  // When focus nodes are no longer needed, we need to dispose of them, but we
  // can't be sure that nothing else is listening to them until this widget is
  // disposed of, so when they are no longer needed, we move them to this list,
  // and dispose of them when we dispose of this widget.
  final List<FocusScopeNode> discardedNodes = <FocusScopeNode>[];

  @override
  void initState() {
    super.initState();
    shouldBuildTab.addAll(List<bool>.filled(widget.tabCount, false));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _focusActiveTab();
  }

  @override
  void didUpdateWidget(_TabSwitchingView oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Only partially invalidate the tabs cache to avoid breaking the current
    // behavior. We assume that the only possible change is either:
    // - new tabs are appended to the tab list, or
    // - some trailing tabs are removed.
    // If the above assumption is not true, some tabs may lose their state.
    final int lengthDiff = widget.tabCount - shouldBuildTab.length;
    if (lengthDiff > 0) {
      shouldBuildTab.addAll(List<bool>.filled(lengthDiff, false));
    } else if (lengthDiff < 0) {
      shouldBuildTab.removeRange(widget.tabCount, shouldBuildTab.length);
    }
    _focusActiveTab();
  }

  // Will focus the active tab if the FocusScope above it has focus already.  If
  // not, then it will just mark it as the preferred focus for that scope.
  void _focusActiveTab() {
    if (tabFocusNodes.length != widget.tabCount) {
      if (tabFocusNodes.length > widget.tabCount) {
        discardedNodes.addAll(tabFocusNodes.sublist(widget.tabCount));
        tabFocusNodes.removeRange(widget.tabCount, tabFocusNodes.length);
      } else {
        tabFocusNodes.addAll(
          List<FocusScopeNode>.generate(
            widget.tabCount - tabFocusNodes.length,
            (int index) => FocusScopeNode(debugLabel: '$IluramaTabScaffold Tab ${index + tabFocusNodes.length}'),
          ),
        );
      }
    }
    FocusScope.of(context).setFirstFocus(tabFocusNodes[widget.currentTabIndex]);
  }

  @override
  void dispose() {
    for (final FocusScopeNode focusScopeNode in tabFocusNodes) {
      focusScopeNode.dispose();
    }
    for (final FocusScopeNode focusScopeNode in discardedNodes) {
      focusScopeNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: List<Widget>.generate(widget.tabCount, (int index) {
        final bool active = index == widget.currentTabIndex;
        shouldBuildTab[index] = active || shouldBuildTab[index];

        return HeroMode(
          enabled: active,
          child: Offstage(
            offstage: !active,
            child: TickerMode(
              enabled: active,
              child: FocusScope(
                node: tabFocusNodes[index],
                child: Builder(builder: (BuildContext context) {
                  return shouldBuildTab[index] ? widget.tabBuilder(context, index) : Container();
                }),
              ),
            ),
          ),
        );
      }),
    );
  }
}

/// A [RestorableProperty] that knows how to store and restore a
/// [CupertinoTabController].
///
/// The [CupertinoTabController] is accessible via the [value] getter. During
/// state restoration, the property will restore [CupertinoTabController.index]
/// to the value it had when the restoration data it is getting restored from
/// was collected.
class RestorableIluramaTabController extends RestorableChangeNotifier<IluramaTabController> {
  /// Creates a [RestorableAppTabController] to control the tab index of
  /// [AppTabScaffold] and [AppTabBar].
  ///
  /// The `initialIndex` must not be null and defaults to 0. The value must be
  /// greater than or equal to 0, and less than the total number of tabs.
  RestorableIluramaTabController({int initialIndex = 0})
      : assert(initialIndex >= 0),
        _initialIndex = initialIndex;

  final int _initialIndex;

  @override
  IluramaTabController createDefaultValue() {
    return IluramaTabController(initialIndex: _initialIndex);
  }

  @override
  IluramaTabController fromPrimitives(Object? data) {
    assert(data != null);
    return IluramaTabController(initialIndex: data as int);
  }

  @override
  Object toPrimitives() {
    return value.index;
  }
}
