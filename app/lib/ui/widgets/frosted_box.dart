import 'dart:ui';

import 'package:ilurama_theme/ilurama_theme.dart';

class FrostedBox extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  final double blur;

  /// If [decoration] is provided [borderRadius], [color] and [colorOpacity] will be ignored
  final BoxDecoration? decoration;
  final Color color;
  final double colorOpacity;
  final double borderRadius;
  const FrostedBox({
    Key? key,
    required this.child,
    this.padding = const EdgeInsets.all(20),
    this.blur = 30.0,
    this.decoration,
    this.color = const Color(0xFFFFFFFF),
    this.colorOpacity = 0.2,
    this.borderRadius = 15,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox(
        child: ClipRRect(
          borderRadius: decoration?.borderRadius ?? BorderRadius.circular(borderRadius),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
            child: Container(
              decoration: decoration ??
                  BoxDecoration(
                    borderRadius: BorderRadius.circular(borderRadius),
                    color: Colors.grey.shade50.withOpacity(colorOpacity),
                  ),
              padding: padding,
              child: child,
            ),
          ),
        ),
      );
}
