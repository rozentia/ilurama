import 'package:ilurama/app/extensions/extensions.dart';
import 'package:ilurama_theme/ilurama_theme.dart';
import 'package:line_icons/line_icons.dart';

class ColorInfoBlock extends StatelessWidget {
  final Color itemColor;
  const ColorInfoBlock({
    Key? key,
    required this.itemColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hex = '#${itemColor.toHex8.toString().substring(2).toUpperCase()}';
    const separator = SizedBox(height: 2);
    return SizedBox(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //= Hex
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            'HEX'.asSectionHeader,
            const SizedBox(height: 5.0),
            hex.asButton(context),
          ],
        ),
        //= RGB
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            'RGB'.asSectionHeader,
            const SizedBox(height: 5.0),
            Row(
              children: [
                CircleLeader(color: Colors.red.shade900, label: 'R'),
                itemColor.red.toString().asButton(context)
              ],
            ),
            separator,
            Row(
              children: [
                CircleLeader(color: Colors.green.shade600, label: 'G'),
                itemColor.green.toString().asButton(context)
              ],
            ),
            separator,
            Row(
              children: [
                CircleLeader(color: Colors.blue.shade900, label: 'B'),
                itemColor.blue.toString().asButton(context)
              ],
            ),
          ],
        ),
        //= HSB
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            'HSL'.asSectionHeader,
            const SizedBox(height: 5.0),
            Row(
              children: [
                CircleLeader(
                    gradient: SweepGradient(colors: [
                      Colors.green.shade700,
                      Colors.lightBlue.shade900,
                      Colors.pink.shade800,
                      Colors.deepPurple.shade800,
                      Colors.green.shade700,
                    ]),
                    label: 'H'),
                itemColor.hue.toStringAsFixed(2).asButton(context)
              ],
            ),
            separator,
            Row(
              children: [
                CircleLeader(color: Colors.green.shade600, label: 'S'),
                itemColor.saturation.toStringAsFixed(2).asButton(context),
              ],
            ),
            separator,
            Row(
              children: [
                CircleLeader(color: Colors.yellow.shade700, icon: LineIcons.sun),
                itemColor.lightness.toStringAsFixed(2).asButton(context)
              ],
            ),
          ],
        )
      ],
    ));
  }
}

class CircleLeader extends StatelessWidget {
  const CircleLeader({
    Key? key,
    this.color,
    this.gradient,
    this.label,
    this.icon,
  }) : super(key: key);
  final Color? color;
  final Gradient? gradient;
  final String? label;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: SizedBox.square(
        dimension: 17.0,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(17.0), color: color, gradient: gradient),
            ),
            if (label != null) Text(label!, style: caption(context).copyWith(fontSize: 11, color: Colors.white)),
            if (icon != null)
              Icon(
                icon!,
                color: (color ?? Colors.white).isLight ? Colors.black : Colors.white,
                size: 17,
              )
          ],
        ),
      ),
    );
  }
}
