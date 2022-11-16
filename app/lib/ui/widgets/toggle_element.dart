import 'package:ilurama_theme/ilurama_theme.dart';

class ToggleElementBlock extends StatelessWidget {
  final IconData? icon;
  final String label;
  final TextStyle? style;
  const ToggleElementBlock(this.label, {this.icon, this.style, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null) Icon(icon),
          const SizedBox(width: 10),
          Text(label, style: style),
        ],
      ),
    );
  }
}
