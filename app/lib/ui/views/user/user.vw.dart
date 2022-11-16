import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ilurama/app/extensions/extensions.dart';
import 'package:ilurama/services/auth/auth.dart';
import 'package:ilurama/ui/views/user/email_verification_guard.vw.dart';
import 'package:ilurama/ui/views/user/privacy.vw.dart';
import 'package:ilurama/ui/widgets/widgets.dart';
import 'package:ilurama_theme/ilurama_theme.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:stacked/stacked.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wiredash/wiredash.dart';

import 'forms/email_signin.vw.dart';
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
              (currentUser) => SignedInUserView(model),
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

//W! Signed In User View
class SignedInUserView extends StatelessWidget {
  final UserViewModel model;
  const SignedInUserView(this.model, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (model.currentUserHasEmailVerified != true) model.runVerification();
    return IluramaFrostedScaffold(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            key: const Key('UserContent'),
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
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
                const SizedBox(height: 100),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 20),
                  CupertinoButton(
                    child: Text('btn_share_feedback'.tr()),
                    onPressed: () => Wiredash.of(context).show(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CupertinoButton(
                        onPressed: () => CupertinoScaffold.showCupertinoModalBottomSheet(
                          barrierColor: barrierModalColor(context),
                          context: context,
                          builder: (_) => const PrivacyPolicyView(),
                          useRootNavigator: true,
                        ),
                        child: Text('title_privacy'.tr()),
                      ),
                      CupertinoButton(
                        onPressed: () {
                          launchUrl(Uri.parse('mailto:support@glarehub.net'));
                        },
                        child: Text('btn_support'.tr()),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Glarehub App version 1.0',
                    style: overline(context).copyWith(color: IluramaColors.secondaryColor.from(context)),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    '© 2022 Misfitcoders',
                    style: overline(context).copyWith(color: IluramaColors.secondaryColor.from(context)),
                  ),
                  const SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 50),
                    child: CupertinoButton(
                      color: ColorPalette.fireEngineRed,
                      onPressed: () => model.signOut(),
                      child: Text(
                        'text_sign_out'.tr(),
                        style: button(context).copyWith(color: IluramaColors.overCritical),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

//W! Anonymous View
class AnonymousUserView extends StatelessWidget {
  final UserViewModel model;
  const AnonymousUserView(this.model, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: [
        Opacity(
            opacity: 0.3,
            child: SvgPicture.string(glarehubLogoFeature, color: secondaryColor(context), fit: BoxFit.fitHeight)),
        SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            //W! Logo
            SizedBox(
              height: 100,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: SvgPicture.string(
                  logoHorizontalSVG,
                  color: IluramaColors.primaryTextColor.from(context),
                ),
              ),
            ),
            //W! Social Sign In
            Flexible(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(child: 'text_sign_in_with'.tr().asBodyText1(context)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        //W! Google Sign In Button
                        GestureDetector(
                          onTap: () => model.startSocialSignIn(const AuthWithGoogle()),
                          child: BorderGradientContainer(
                            bRadius: 30,
                            strokeWidth: 3,
                            gradient: SweepGradient(
                              colors: [Colors.blue, Colors.red, Colors.amber, Colors.green].seamlessSweep,
                            ),
                            child: SizedBox(
                              width: 200,
                              height: 50,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: SvgPicture.string(googleLogoSvg),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        //W! Apple Sign In Button
                        SignInWithAppleBuilder(
                          fallbackBuilder: (ctx) => const SizedBox(),
                          builder: (context) {
                            return GestureDetector(
                              onTap: () => model.startSocialSignIn(const AuthWithApple()),
                              child: BorderGradientContainer(
                                bRadius: 30,
                                strokeWidth: 3,
                                gradient: SweepGradient(
                                  colors: [
                                    MediaQuery.platformBrightnessOf(context) == Brightness.dark
                                        ? Colors.white
                                        : Colors.black,
                                  ].seamlessSweep,
                                ),
                                child: SizedBox(
                                  width: 200,
                                  height: 50,
                                  child: Padding(
                                    padding: const EdgeInsets.all(9.0),
                                    child: SvgPicture.string(MediaQuery.platformBrightnessOf(context) == Brightness.dark
                                        ? appleLogoDark
                                        : appleLogoLight),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 20),
                        //W! Sign In with Email Button
                        GestureDetector(
                          onTap: () => CupertinoScaffold.showCupertinoModalBottomSheet(
                            context: context,
                            barrierColor: barrierModalColor(context),
                            useRootNavigator: true,
                            builder: (context) => const EmailSignInView(),
                          ).then((_) => model.notifyListeners()),
                          child: BorderGradientContainer(
                            bRadius: 30,
                            strokeWidth: 3,
                            gradient: SweepGradient(
                              transform: const GradientRotation(-45),
                              colors: [
                                ColorPalette.kellyGreen,
                                ColorPalette.kellyGreen.darken(8),
                              ].seamlessSweep,
                            ),
                            child: const SizedBox(
                              width: 200,
                              height: 50,
                              child: Padding(
                                padding: EdgeInsets.all(9.0),
                                child: Icon(
                                  CupertinoIcons.envelope_fill,
                                  color: ColorPalette.kellyGreen,
                                  size: 30,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (model.hasError)
                    Flexible(
                      child: Container(
                        height: 90,
                        margin: const EdgeInsets.all(20),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: CupertinoColors.systemOrange.withOpacity(0.7),
                        ),
                        child: Center(
                          child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: 'msg_unknown_error_try_again'.tr().asBodyText1(context)),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            // const Expanded(child: SizedBox()),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(height: 20),
                CupertinoButton(
                  child: Text('btn_share_feedback'.tr()),
                  onPressed: () => Wiredash.of(context).show(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CupertinoButton(
                      onPressed: () => CupertinoScaffold.showCupertinoModalBottomSheet(
                        barrierColor: barrierModalColor(context),
                        context: context,
                        builder: (_) => const PrivacyPolicyView(),
                        useRootNavigator: true,
                      ),
                      child: Text('title_privacy'.tr()),
                    ),
                    CupertinoButton(
                      onPressed: () {
                        launchUrl(Uri.parse('mailto:support@glarehub.net'));
                      },
                      child: Text('btn_support'.tr()),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  'Glarehub App version 1.0',
                  style: overline(context).copyWith(color: IluramaColors.secondaryColor.from(context)),
                ),
                const SizedBox(height: 3),
                Text(
                  '© 2022 Misfitcoders',
                  style: overline(context).copyWith(color: IluramaColors.secondaryColor.from(context)),
                ),
                const SizedBox(height: 25),
              ],
            )
          ]),
        )),
      ],
    ));
  }
}
