import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

import 'settings.vm.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SettingsViewModel>.reactive(
      builder: (context, model, child) {
        return Container();
      },
      viewModelBuilder: () => SettingsViewModel(),
    );
  }
}
