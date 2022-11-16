import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../styles/styles.dart' as styles;

class SubbedButton extends StatelessWidget {
  final IconData icon;
  final bool critical;
  final void Function() onPressed;
  final String subtitle;
  const SubbedButton({
    Key? key,
    required this.icon,
    required this.onPressed,
    required this.subtitle,
    this.critical = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      height: 90,
      child: Column(
        children: [
          SizedBox(
            height: 45,
            width: 45,
            child: NeumorphicButton(
              style: NeumorphicStyle(
                color: critical ? styles.accentColor(context) : null,
                shape: NeumorphicShape.convex,
                depth: 5,
                surfaceIntensity: 0.4,
                border: critical ? const NeumorphicBorder.none() : const NeumorphicBorder(width: 0.1),
              ),
              onPressed: onPressed,
              child: NeumorphicIcon(
                icon,
                style: NeumorphicStyle(
                    color: critical ? Colors.white : styles.criticalColor(context),
                    shape: NeumorphicShape.concave,
                    depth: 0,
                    surfaceIntensity: critical ? 0 : 1,
                    border: const NeumorphicBorder()),
              ),
            ),
          ),
          const SizedBox(height: 15),
          Text(
            subtitle.toUpperCase(),
            textAlign: TextAlign.center,
            style: styles.overline(context).copyWith(fontSize: 8),
          )
        ],
      ),
    );
  }
}
