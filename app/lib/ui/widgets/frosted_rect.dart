import 'dart:ui';

import 'package:ilurama_theme/ilurama_theme.dart';

class FrostedRect extends StatelessWidget {
  const FrostedRect({Key? key, this.backgroundOpacity = 1.0, this.blurOpacity = 1.0, this.blurValue = 25.0})
      : super(key: key);
  final double backgroundOpacity;
  final double blurOpacity;
  final double blurValue;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Stack(
      children: [
        //= Bar blur effect
        ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: blurValue, sigmaY: blurValue),
            child: Container(color: Colors.transparent),
          ),
        ),

        //= Bar background style
        Opacity(
          opacity: backgroundOpacity,
          child: Neumorphic(
            style: NeumorphicStyle(
              boxShape: const NeumorphicBoxShape.rect(),
              intensity: 0.5,
              color: frostColor(context),
            ),
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: disabledColor(context), width: 0.5),
                  top: BorderSide(color: disabledColor(context), width: 0.5),
                ),
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
