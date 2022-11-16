import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class CupertinoWrapper extends StatelessWidget {
  const CupertinoWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const CupertinoScaffold(body: AutoRouter());
}
