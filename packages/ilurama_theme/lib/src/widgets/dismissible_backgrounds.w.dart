import 'package:flutter/cupertino.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import '../styles/styles.dart';
import '../theme/theme.dart';

class DismissibleBackgroundDelete extends StatelessWidget {
  const DismissibleBackgroundDelete({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      style: NeumorphicStyle(
        color: criticalColor(context),
        depth: -1,
        // shadowLightColorEmboss: Colors.black.withOpacity(0.3),
        shape: NeumorphicShape.concave,
        boxShape: const NeumorphicBoxShape.rect(),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Align(
        alignment: Alignment.centerRight,
        child: SizedBox(
          width: 60,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Icon(CupertinoIcons.delete, size: 20, color: Colors.white),
              ),
              Flexible(
                  child: Text('Eliminar',
                      style: caption(context).copyWith(
                          color: IluramaColors.overCritical,
                          fontSize: 15.0,
                          fontWeight: FW.regular,
                          letterSpacing: -0.16))),
            ],
          ),
        ),
      ),
    );
  }
}

class DismissibleBackgroundLayout extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String text;
  final Alignment alignment;
  const DismissibleBackgroundLayout({
    Key? key,
    required this.icon,
    required this.text,
    required this.alignment,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Neumorphic(
        style: NeumorphicStyle(
          color: color,
          depth: -10,
          shadowLightColorEmboss: Colors.black.withOpacity(0.3),
          shape: NeumorphicShape.concave,
          boxShape: const NeumorphicBoxShape.rect(),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          alignment: alignment,
          child: SizedBox(
            width: 60,
            child: Column(
              children: [
                IconButton(
                  icon: Icon(icon, color: Colors.white),
                  onPressed: () {},
                ),
                Text(
                  text,
                  style: const TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
        ),
      );
}
