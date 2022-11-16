import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import '../styles/styles.dart';
import '../theme/colors.dart';

import 'text.w.dart';

class ListTileChip extends StatelessWidget {
  final String? text;
  final Color? color;
  final Color? foregroundColor;
  final IconData? icon;
  final TextStyle? style;
  final double maxWidth;

  const ListTileChip(this.icon, this.text, this.color,
      {Key? key, this.foregroundColor, this.style, this.maxWidth = 100})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _foregroundColor = foregroundColor ?? IluramaColors.textOverAccent;
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: maxWidth),
      child: Align(
        alignment: Alignment.topRight,
        child: SizedBox(
          height: 30,
          child: IntrinsicWidth(
            child: Neumorphic(
              padding: const EdgeInsets.all(4),
              style: NeumorphicStyle(
                  depth: 0, color: color ?? accentColor(context), boxShape: const NeumorphicBoxShape.stadium()),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (icon != null)
                    SizedBox(width: 30, height: 22, child: Icon(icon, size: 20, color: _foregroundColor)),
                  if (text?.isNotEmpty == true)
                    Expanded(
                      child: TextLine(
                        text,
                        style: (style ?? const TextStyle()).copyWith(
                          color: _foregroundColor,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
