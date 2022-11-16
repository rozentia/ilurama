import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class AppBarPinButton extends StatefulWidget {
  final StreamController<void> onBuildController;
  final StreamController<bool> appBarPinButtonController;
  final Widget button;

  const AppBarPinButton({
    required this.onBuildController,
    required this.appBarPinButtonController,
    required this.button,
  });

  @override
  _AppBarPinButtonState createState() => _AppBarPinButtonState();
}

class _AppBarPinButtonState extends State<AppBarPinButton> {
  bool showAppBarPinButton = false;
  @override
  void initState() {
    super.initState();
    widget.onBuildController.stream.listen((_) {
      if (mounted) {
        final double statusBarHeight = MediaQuery.of(context).padding.top;
        final RenderBox renderBox = context.findRenderObject() as RenderBox;
        final Offset position = renderBox.localToGlobal(Offset.zero);
        final bool show = position.dy + renderBox.size.height <
            statusBarHeight + kToolbarHeight;
        if (showAppBarPinButton != show) {
          showAppBarPinButton = show;
          widget.appBarPinButtonController.sink.add(showAppBarPinButton);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) => widget.button;
}
