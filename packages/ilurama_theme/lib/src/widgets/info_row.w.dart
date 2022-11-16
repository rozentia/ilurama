import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class InfoRow extends StatelessWidget {
  final String title;
  final String info;
  final TextStyle? titleStyle;
  final TextStyle? infoStyle;
  const InfoRow({
    Key? key,
    required this.title,
    required this.info,
    this.titleStyle,
    this.infoStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: titleStyle,
          ),
          Text(
            info,
            maxLines: 2,
            softWrap: true,
            style: infoStyle,
          )
        ],
      );
}
