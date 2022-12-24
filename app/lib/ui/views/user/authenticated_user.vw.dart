import 'package:flutter/cupertino.dart';
import 'package:ilurama/services/cloud_functions/cloud_functions.s.dart';
import 'package:ilurama_theme/ilurama_theme.dart';
import 'package:line_icons/line_icons.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wiredash/wiredash.dart';

import '../../widgets/widgets.dart';
import 'email_verification_guard.vw.dart';
import 'privacy.vw.dart';
import 'user.vm.dart';
import 'user_menu.dart';

class AuthenticatedUserView extends StatelessWidget {
  final UserViewModel model;
  const AuthenticatedUserView(this.model, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!model.currentUserHasEmailVerified) {
      model.runVerification();
    }
    return IluramaFrostedScaffold(
      appBarForegroundAlwaysVisible: true,
      appBarLeading: IconButton(
          onPressed: () => showBarModalBottomSheet<UserMenuOptions?>(
                context: context,
                useRootNavigator: true,
                builder: (context) => const UserMenu(),
              ).then(
                (selectedOption) {
                  if (selectedOption == null) return;
                  switch (selectedOption) {
                    case UserMenuOptions.contactSupport:
                      launchUrl(Uri.parse('mailto:support@glarehub.net'));
                      return;
                    case UserMenuOptions.shareFeedback:
                      Wiredash.of(context).show();
                      return;
                    case UserMenuOptions.showPrivacy:
                      CupertinoScaffold.showCupertinoModalBottomSheet(
                        barrierColor: barrierModalColor(context),
                        context: context,
                        builder: (_) => const PrivacyPolicyView(),
                        useRootNavigator: true,
                      );
                      return;
                    case UserMenuOptions.showTerms:
                      CupertinoScaffold.showCupertinoModalBottomSheet(
                        barrierColor: barrierModalColor(context),
                        context: context,
                        builder: (_) => const TermsOfServiceView(),
                        useRootNavigator: true,
                      );
                      return;
                    case UserMenuOptions.requestDeletion:
                      CloudFunctionsService().requestAccountDeletion().then((result) {
                        showDialog(
                            context: context,
                            builder: (_) => AlertOkOnly(
                                  //TRANSLATE -
                                  title: 'Account Deletion',
                                  message:
                                      'An email containing instructions on how to delete your account has been sent to your inbox.',
                                ));
                      });

                      return;
                    default:
                      return;
                  }
                },
              ),
          icon: const Icon(
            CupertinoIcons.ellipsis,
            color: IluramaColors.accentColor,
          )),
      appBarActions: [
        IconButton(
            onPressed: () => model.signOut(),
            icon: const Icon(
              LineIcons.alternateSignOut,
              color: IluramaColors.accentColor,
            ))
      ],
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            key: const Key('UserContent'),
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              model.currentUserDisplayName.fold(
                () => const SizedBox(height: 60),
                (displayName) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 10),
                  child: Center(child: displayName.asHeadline2(context)),
                ),
              ),
              if (!model.currentUserHasEmailVerified)
                EmailVerificationGuard(
                  emailAddress: model.currentUserEmail,
                  resendEmailActivation: model.resendEmailActivation,
                )
              else
                Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        UserContentDetailBox(model.currentUserCollections.length.toString(), 'collections'),
                        UserContentDetailBox(model.currentUserColorCodes.length.toString(), 'color codes'),
                        UserContentDetailBox(model.currentUserScenes.length.toString(), 'scenes'),
                      ],
                    )),
            ],
          ),
        ),
      ],
    );
  }
}

class UserContentDetailBox extends StatelessWidget {
  final String data;
  final String label;
  const UserContentDetailBox(this.data, this.label, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          data.asHeadline3(context),
          const SizedBox(height: 10),
          label.toUpperCase().asCaption(context),
        ],
      ),
    );
  }
}
