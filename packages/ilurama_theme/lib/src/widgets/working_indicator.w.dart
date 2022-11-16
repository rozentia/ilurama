import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class WorkingIndicator extends StatelessWidget {
  final Color? color;
  const WorkingIndicator({Key? key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
                color ?? NeumorphicTheme.currentTheme(context).accentColor),
          ),
        ),
      );
}
