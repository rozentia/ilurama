import 'package:ilurama_theme/ilurama_theme.dart';

class ActionSheetFrame extends StatelessWidget {
  final Widget child;
  const ActionSheetFrame({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor(context),
      padding: const EdgeInsets.all(20),
      child: child,
    );
  }
}
