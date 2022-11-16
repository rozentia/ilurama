import 'package:ilurama_theme/ilurama_theme.dart';

class InputLabel extends StatelessWidget {
  const InputLabel(this.text, {Key? key}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(left: 3, bottom: 10),
        child: Text(
          text.toUpperCase(),
          style: overline(context).copyWith(color: secondaryColor(context)),
        ),
      );
}
