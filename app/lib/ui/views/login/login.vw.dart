import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

import 'login.vm.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      builder: (context, model, child) {
        return Container();
      },
      viewModelBuilder: () => LoginViewModel(),
    );
  }
}
