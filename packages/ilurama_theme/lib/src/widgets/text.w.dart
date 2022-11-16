import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class TextLine extends StatelessWidget {
  final String? text;
  final TextStyle? style;
  const TextLine(
    this.text, {
    Key? key,
    this.style = const TextStyle(),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Text(
        text ?? '',
        style: style,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      );
}
