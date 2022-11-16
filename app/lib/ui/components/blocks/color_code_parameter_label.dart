import 'package:ilurama_theme/ilurama_theme.dart';

import '../../../models/models.dart';

class ColorCodeParameterLabel extends StatelessWidget {
  final ColorCodeParameterType parameterType;
  final bool disabled;
  const ColorCodeParameterLabel(
    this.parameterType, {
    Key? key,
    this.disabled = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Opacity(
            opacity: disabled ? 0.4 : 1.0,
            child: Neumorphic(
              margin: const EdgeInsets.all(5),
              style: NeumorphicStyle(
                disableDepth: true,
                boxShape: const NeumorphicBoxShape.circle(),
                shape: NeumorphicShape.convex,
                surfaceIntensity: 2.0,
                color: parameterType.color,
              ),
              child: const SizedBox.square(dimension: 14),
            ),
          ),
        ),
        const SizedBox(width: 5),
        Text(
          parameterType.parameterTypeName.toUpperCase(),
          overflow: TextOverflow.fade,
          style: (disabled
                  ? subtitle1(context).copyWith(color: subtitle1(context).color!.withOpacity(0.3))
                  : subtitle1(context))
              .copyWith(fontWeight: FontWeight.w600, fontSize: 14, letterSpacing: 0.3),
        ),
      ],
    );
  }
}
