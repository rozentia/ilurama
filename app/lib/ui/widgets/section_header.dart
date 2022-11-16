import 'package:ilurama_theme/ilurama_theme.dart';

class SectionHeader extends StatelessWidget {
  final String text;
  const SectionHeader(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Text(
        text.toUpperCase(),
        style: caption(context).copyWith(
          color: secondaryColor(context),
          fontSize: 13,
          fontWeight: FW.regular,
        ),
      );
}
