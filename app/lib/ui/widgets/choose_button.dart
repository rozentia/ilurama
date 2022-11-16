import 'package:ilurama_theme/ilurama_theme.dart';

class ChooseButton extends StatelessWidget {
  const ChooseButton({
    Key? key,
    this.trailing,
    required this.text,
    this.onTap,
    this.padding = const EdgeInsets.all(15),
    this.spacing = 10,
  }) : super(key: key);
  final Widget? trailing;
  final String text;
  final EdgeInsets padding;
  final double spacing;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: accentColor(context)),
          borderRadius: BorderRadius.circular(13),
          color: backgroundColor(context).darken(1),
        ),
        padding: padding,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (trailing != null) trailing!,
            if (trailing != null) SizedBox(width: spacing),
            text.asButton(context),
          ],
        ),
      ),
    );
  }
}
