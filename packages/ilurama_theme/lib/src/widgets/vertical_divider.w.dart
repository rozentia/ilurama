import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../styles/styles.dart';

class VDivider extends StatelessWidget {
  const VDivider({
    Key? key,
    this.height = 50,
    this.thickness = 0.5,
    this.indent = 0.0,
    this.color,
  })  : assert(height >= 0.0),
        assert(indent >= 0.0),
        super(key: key);

  final double height;
  final double thickness;
  final double indent;

  final Color? color;

  @override
  Widget build(BuildContext context) => Container(
        height: height,
        width: 1,
        decoration: BoxDecoration(
          border: Border(
              left: BorderSide(
            color: color ?? variantColor(context),
            width: thickness <= 0.0 ? 0.3 : thickness,
          )),
        ),
      );
}
