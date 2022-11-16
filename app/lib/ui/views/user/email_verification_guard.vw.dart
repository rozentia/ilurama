import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:ilurama_theme/ilurama_theme.dart';
import 'package:stacked/stacked.dart';

import '../../../app/locator/locator.dart';
import '../../../services/auth/auth.dart';
import '../../components/components.dart';
import '../../widgets/widgets.dart';

class EmailVerificationGuard extends StatelessWidget {
  final String emailAddress;
  final Future<bool> Function() resendEmailActivation;
  const EmailVerificationGuard({
    Key? key,
    required this.emailAddress,
    required this.resendEmailActivation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> isBusy = ValueNotifier<bool>(false);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            CupertinoIcons.exclamationmark_triangle,
            size: 42,
            color: IluramaColors.warning.from(context),
          ),
          const SizedBox(height: 10),
          Text('title_email_activation_pending'.tr(), style: headline3(context)),
          const SizedBox(height: 10),
          Text(
            'msg_email_activation_pending'.tr(args: [emailAddress]),
            style: bodyText2(context),
            maxLines: 20,
          ),
          const SizedBox(height: 40),
          const SizedBox(height: 20),
          ValueListenableBuilder<bool>(
            valueListenable: isBusy,
            builder: (context, value, widget) => ActivityAwareButton(
              label: 'btn_resend_activation_email'.tr(),
              isBusy: value,
              onPressed: () {
                isBusy.value = true;
                resendEmailActivation().then(
                  (result) {
                    isBusy.value = false;
                    showTopSnackBar(
                      context,
                      result
                          ? CustomSnackBar.success(message: 'msg_activation_email_sent'.tr(args: [emailAddress]))
                          : CustomSnackBar.error(
                              message: 'msg_activation_email_error'.tr(args: [emailAddress]),
                            ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class EmailVerificationGuardModalViewModel extends BaseViewModel {
  final AuthServiceInterface _authService;

  EmailVerificationGuardModalViewModel({AuthServiceInterface? authService})
      : _authService = authService ?? getIt<AuthServiceInterface>();

  String get currentlyLoggedInUserEmail => _authService.currentFirebaseUser?.email ?? '';
  bool get isEmailVerified => _authService.currentFirebaseUser?.emailVerified == true;

  Future<bool> resendEmailActivation() async {
    try {
      _authService.resendEmailVerification();
      return true;
    } catch (e) {
      //LOOSERROR - unhandled
      return false;
    }
  }
}
