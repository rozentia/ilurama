import 'package:ilurama_theme/ilurama_theme.dart';
import 'package:stacked/stacked.dart';

import 'anonymous_user.vw.dart';
import 'authenticated_user.vw.dart';
import 'user.vm.dart';

class UserView extends StatelessWidget {
  const UserView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<UserViewModel>.reactive(
      builder: (context, model, child) => model.isBusy
          ? const BusyScreen('...')
          : model.currentUser.fold<Widget>(
              () => AnonymousUserView(model),
              (currentUser) => AuthenticatedUserView(model),
            ),
      viewModelBuilder: () => UserViewModel(),
    );
  }
}

//- Busy Screen
class BusyScreen extends StatelessWidget {
  final String busyMessage;
  const BusyScreen(
    this.busyMessage, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox.square(dimension: 30, child: CircularProgressIndicator.adaptive()),
        const SizedBox(height: 10),
        Center(child: busyMessage.asBodyText1(context)),
      ],
    ));
  }
}
