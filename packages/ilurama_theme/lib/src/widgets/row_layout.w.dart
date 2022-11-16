import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class RowLayout extends StatelessWidget {
  final double? height;
  final double width;
  final Widget? leftFlexible;
  final Widget? leftExpanded;
  final Widget? centerFlexible;
  final Widget? centerExpanded;
  final Widget? rightFlexible;
  final Widget? rightExpanded;
  final CrossAxisAlignment crossAxisAlignment;

  const RowLayout({
    Key? key,
    this.height,
    this.width = double.infinity,
    this.leftFlexible,
    this.leftExpanded,
    this.centerFlexible,
    this.centerExpanded,
    this.rightFlexible,
    this.rightExpanded,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Row(
        crossAxisAlignment: crossAxisAlignment,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (leftExpanded != null)
            Expanded(child: leftExpanded!)
          else if (leftFlexible != null)
            Flexible(child: leftFlexible!),
          if (centerExpanded != null)
            Expanded(child: centerExpanded!)
          else if (centerFlexible != null)
            Flexible(child: centerFlexible!),
          if (rightExpanded != null)
            Expanded(child: rightExpanded!)
          else if (rightFlexible != null)
            Flexible(child: rightFlexible!),
        ],
      ),
    );
  }
}
