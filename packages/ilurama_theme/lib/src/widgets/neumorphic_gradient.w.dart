import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class NeumorphicGradient extends StatelessWidget {
  final Widget? child;
  final double? width;
  final double? height;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final EdgeInsets childPadding;
  final EdgeInsets childMargin;
  final Gradient? gradient;
  final NeumorphicStyle? style;

  const NeumorphicGradient({
    Key? key,
    this.child,
    this.width,
    this.height,
    this.padding = const EdgeInsets.all(0),
    this.margin = const EdgeInsets.all(0),
    this.childPadding = const EdgeInsets.all(0),
    this.childMargin = const EdgeInsets.all(0),
    required this.gradient,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Neumorphic(
        style: style!,
        margin: margin,
        padding: padding,
        child: Container(
          width: width,
          height: height,
          padding: childPadding,
          margin: childMargin,
          decoration: BoxDecoration(gradient: gradient),
          child: child,
        ),
      );
}
