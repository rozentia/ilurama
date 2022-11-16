import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:ilurama_theme/ilurama_theme.dart';

class AlertOkOnly extends StatelessWidget {
  const AlertOkOnly({Key? key, required this.title, required this.message}) : super(key: key);
  final String title;
  final String message;

  @override
  Widget build(BuildContext context) {
    final List<Widget> actions = [TextButton(onPressed: () => Navigator.pop(context), child: const Text('OK'))];
    return Platform.isIOS
        ? CupertinoAlertDialog(title: Text(title), content: Text(message), actions: actions)
        : AlertDialog(title: Text(title), content: Text(message), actions: actions);
  }
}

class AlertYesNo extends StatelessWidget {
  const AlertYesNo({
    Key? key,
    required this.title,
    required this.message,
    this.customYes,
    this.customNo,
  }) : super(key: key);
  final String title;
  final String message;

  /// Custom text for [yes] button
  final String? customYes;

  /// Custom text for [no] button
  final String? customNo;

  @override
  Widget build(BuildContext context) {
    final List<Widget> actions = [
      TextButton(onPressed: () => Navigator.pop(context, false), child: Text(customNo ?? 'respond_no'.tr())),
      TextButton(onPressed: () => Navigator.pop(context, true), child: Text(customYes ?? 'respond_yes'.tr())),
    ];
    return Platform.isIOS
        ? CupertinoAlertDialog(title: Text(title), content: Text(message), actions: actions)
        : AlertDialog(title: Text(title), content: Text(message), actions: actions);
  }
}
