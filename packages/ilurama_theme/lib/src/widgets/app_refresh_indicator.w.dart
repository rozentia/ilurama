import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:shared_extensions/shared_extensions.dart';
import '../styles/styles.dart';

class AppBarRefreshIndicator extends StatelessWidget {
  final ValueListenable<double?> listenableValue;
  final Animation<Color>? valueColor;
  final double strokeWidth;
  final String? semanticsLabel;
  final String? semanticsValue;
  const AppBarRefreshIndicator({
    Key? key,
    required this.listenableValue,
    this.valueColor,
    this.strokeWidth = 4.0,
    this.semanticsLabel,
    this.semanticsValue,
  }) : super(key: key);

  /// Function to resolve the progress value upon scrolling or
  /// performing refresh future
  static double? resolveValue({
    required bool isBusy,
    required double scrollOffset,
    double maxDragOffset = 100.0,
  }) =>
      isBusy ? null : (scrollOffset * -1).clamp(0.0, maxDragOffset).toDouble().mapToRange(0.0, maxDragOffset, 0.0, 1.0);

  factory AppBarRefreshIndicator.baseColor({
    required BuildContext context,
    required ValueListenable<double?> listenableValue,
  }) =>
      AppBarRefreshIndicator(
        listenableValue: listenableValue,
        valueColor: AlwaysStoppedAnimation<Color>(
          baseColor(context),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<double?>(
      valueListenable: listenableValue,
      builder: (context, value, widget) {
        return value == 0.0
            ? Container()
            : AspectRatio(
                aspectRatio: 1.0,
                child: value == null
                    ? CircularProgressIndicator(
                        valueColor: valueColor,
                        strokeWidth: strokeWidth,
                        semanticsLabel: semanticsLabel,
                        semanticsValue: semanticsValue,
                      )
                    : CircularProgressIndicator(
                        value: value,
                        valueColor: valueColor,
                        strokeWidth: strokeWidth,
                        semanticsLabel: semanticsLabel,
                        semanticsValue: semanticsValue,
                      ),
              );
      },
    );
  }
}
