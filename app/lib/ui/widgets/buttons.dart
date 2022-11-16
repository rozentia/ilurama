import 'package:flutter/cupertino.dart';
import 'package:ilurama_theme/ilurama_theme.dart';

class ActivityAwareButton extends StatelessWidget {
  final bool isBusy;
  final VoidCallback onPressed;
  final bool disabled;
  final String label;
  final double height;
  final Color color;
  final Color labelColor;
  const ActivityAwareButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.isBusy = false,
    this.disabled = false,
    this.height = 45,
    this.color = IluramaColors.accentColor,
    this.labelColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        style: NeumorphicStyle(
          boxShape: const NeumorphicBoxShape.stadium(),
          color: disabled ? IluramaColors.tertiarySystemFill.dark : color,
        ),
        onPressed: onPressed,
        child: SizedBox(
          width: double.infinity,
          height: height,
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (isBusy)
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: CupertinoActivityIndicator(color: labelColor, radius: 12),
                  ),
                Text(
                  label,
                  style:
                      button(context).copyWith(fontWeight: FW.semiBold, color: disabled ? Colors.white38 : labelColor),
                ),
              ],
            ),
          ),
        ));
  }
}
