import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:ilurama_theme/ilurama_theme.dart';

class FlashlightView extends StatelessWidget {
  final Color color;
  const FlashlightView(this.color, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      body: Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 40, 0, 0),
          child: IconButton(
            onPressed: () => context.router.pop(),
            icon: const Icon(CupertinoIcons.xmark),
          ),
        ),
      ),
    );
  }
}
