import 'package:ilurama_theme/ilurama_theme.dart';
import 'package:stacked/stacked.dart';

import 'error.vm.dart';

class ErrorView extends StatelessWidget {
  final int errorCode;
  const ErrorView({Key? key, required this.errorCode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ErrorViewModel>.reactive(
      builder: (context, model, child) {
        return const Scaffold(
          body: Center(child: Text('Error')),
        );
      },
      viewModelBuilder: () => ErrorViewModel(),
    );
  }
}
