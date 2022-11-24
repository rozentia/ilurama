import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ilurama_theme/ilurama_theme.dart';
import 'package:stacked/stacked.dart';

import '../../../../app/constants/constants.dart';
import '../../../components/components.dart';
import '../../../widgets/widgets.dart';
import 'email_form.vm.dart';

const _footerContentHeight = 230.0;
final textStyle = bodyText1().copyWith(color: Colors.white70);
const crossFadeDuration = Duration(milliseconds: 200);

class EmailSignInView extends StatelessWidget {
  const EmailSignInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> signInUpFormKey = GlobalKey<FormState>();
    final GlobalKey<FormState> recoverFormKey = GlobalKey<FormState>();

    return ViewModelBuilder<EmailAuthFormViewModel>.reactive(
        viewModelBuilder: () => EmailAuthFormViewModel(),
        builder: (context, model, widget) {
          return NeumorphicTheme(
            themeMode: ThemeMode.dark,
            darkTheme: IluramaTheme.neumorphic_dark,
            child: Theme(
              data: IluramaTheme.material_dark,
              child: Stack(
                children: [
                  //W! Background
                  SizedBox.expand(
                    child: Container(
                      color: IluramaColors.canvasColor.dark,
                      child: Opacity(
                          opacity: 0.5,
                          child: SvgPicture.string(iluramaLogoIcon,
                              color: secondaryColor(context), fit: BoxFit.fitHeight)),
                    ),
                  ),

                  //W! Main Content
                  Positioned.fill(
                    bottom: -(_footerContentHeight + 20),
                    child: Scaffold(
                      backgroundColor: Colors.transparent,
                      body: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          //W! Header
                          Align(
                            alignment: Alignment.centerLeft,
                            child: IconButton(
                                padding: const EdgeInsets.all(20),
                                onPressed: model.isBusy ? null : () => context.router.pop(false),
                                disabledColor: CupertinoColors.inactiveGray.withOpacity(0.3),
                                icon: const Icon(
                                  CupertinoIcons.xmark_circle_fill,
                                  color: CupertinoColors.inactiveGray,
                                )),
                          ),
                          //W! Page View
                          Expanded(
                            child: ValueListenableBuilder<EmailAuthPage>(
                                valueListenable: model.pageSelection,
                                builder: (context, value, widget) {
                                  final crossFadeState = model.pageSelection.value == EmailAuthPage.signIn ||
                                          model.pageSelection.value == EmailAuthPage.signUp
                                      ? CrossFadeState.showFirst
                                      : CrossFadeState.showSecond;
                                  return SingleChildScrollView(
                                    child: Padding(
                                      padding: const EdgeInsets.only(bottom: 250.0),
                                      child: AnimatedCrossFade(
                                        crossFadeState: crossFadeState,
                                        duration: crossFadeDuration,
                                        firstChild: SignInPage(viewModel: model, formKey: signInUpFormKey),
                                        secondChild: RecoverResendPage(viewModel: model, formKey: recoverFormKey),
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        ],
                      ),
                    ),
                  ),
                  //W! Footer
                  Positioned(
                    bottom: 20.0,
                    left: 20,
                    right: 20,
                    height: _footerContentHeight,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          //W! Action Control
                          EmailAuthActionControl(
                            viewModel: model,
                            signInUpFormKey: signInUpFormKey,
                            recoverPasswordFormKey: recoverFormKey,
                          ),
                          //W! Action Error
                          SizedBox(
                            height: 60,
                            child: Center(
                              child: model.hasError
                                  ? Text(
                                      '${model.modelError}',
                                      style: bodyText1(context).copyWith(
                                        color: IluramaColors.critical.from(context),
                                      ),
                                    )
                                  : const SizedBox(),
                            ),
                          ),
                          //W! Option Control
                          ValueListenableBuilder<EmailAuthPage>(
                            valueListenable: model.pageSelection,
                            builder: (context, value, widget) {
                              return AnimatedCrossFade(
                                crossFadeState: value == EmailAuthPage.signIn
                                    ? CrossFadeState.showFirst
                                    : CrossFadeState.showSecond,
                                duration: const Duration(milliseconds: 500),
                                firstChild: TextWithActionableTap(
                                  firstLine: 'msg_no_account_question'.tr(),
                                  actionableLine: 'common.titles.auth.sign_up'.tr(),
                                  onTap: () => model.pageSelection.value = EmailAuthPage.signUp,
                                ),
                                secondChild: TextWithActionableTap(
                                  firstLine: 'msg_have_an_account_question'.tr(),
                                  actionableLine: 'common.titles.auth.sign_in'.tr(),
                                  onTap: () => model.pageSelection.value = EmailAuthPage.signIn,
                                ),
                              );
                            },
                          ),
                          const SizedBox(height: 15),
                          TextWithActionableTap(
                            firstLine: 'msg_forgot_password_question'.tr(),
                            actionableLine: 'msg_reset_password_here'.tr(),
                            onTap: () => model.pageSelection.value = EmailAuthPage.recoverPassword,
                          ),
                          const SizedBox(height: 10),

                          /// The code below is being deprecated in favor of an activation resend option
                          /// handled by the ActivationView/ViewModel...
                          // const SizedBox(height: 10),
                          // TextWithActionableTap(
                          //   firstLine: 'No activation email?... ',
                          //   actionableLine: 'Resend here.',
                          //   onTap: () => model.pageSelection.value = EmailAuthPage.resendActivation,
                          // )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}

//W! SignIn / SignUp Page
class SignInPage extends StatefulWidget {
  final EmailAuthFormViewModel viewModel;
  final GlobalKey<FormState> formKey;

  const SignInPage({Key? key, required this.viewModel, required this.formKey}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final TextEditingController passwordConfirmationController;
  late final TextEditingController nameController;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    passwordConfirmationController = TextEditingController();
    nameController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final labelTextStyle = bodyText1().copyWith(fontSize: 12, color: CupertinoColors.systemGrey.darkColor);

    return Form(
      key: widget.formKey,
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: AutofillGroup(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //W! Form Title
              Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: widget.viewModel.pageSelection.value == EmailAuthPage.signIn
                    ? Text(
                        '$kLPATH_common_titles_auth.sign_in'.tr(),
                        style: headline1(context).copyWith(color: Colors.white),
                      )
                    : Text(
                        '$kLPATH_common_titles_auth.sign_up'.tr(),
                        style: headline1(context).copyWith(color: Colors.white),
                      ),
              ),
              //W! Email field
              Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  autofillHints: const [AutofillHints.username],
                  decoration: InputDecoration(
                    labelText: '$kLPATH_common_labels.email'.tr().toUpperCase(),
                    labelStyle: labelTextStyle,
                  ),
                  validator: widget.viewModel.onValidateEmail,
                  onChanged: widget.viewModel.onEmailFieldChange,
                ),
              ),
              //W! Password Field
              Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: TextFormField(
                  controller: passwordController,
                  // obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  autofillHints: const [AutofillHints.password],
                  textInputAction: widget.viewModel.pageSelection.value == EmailAuthPage.signIn
                      ? TextInputAction.done
                      : TextInputAction.next,
                  onEditingComplete: widget.viewModel.pageSelection.value == EmailAuthPage.signIn
                      ? () => TextInput.finishAutofillContext()
                      : null,
                  decoration: InputDecoration(
                    labelText: '$kLPATH_common_labels.password'.tr().toUpperCase(),
                    labelStyle: labelTextStyle,
                  ),
                  validator: widget.viewModel.pageSelection.value == EmailAuthPage.signIn
                      ? widget.viewModel.onValidateRequiredPassword
                      : widget.viewModel.onValidateSignUpPassword,
                  onChanged: widget.viewModel.onPasswordFieldChange,
                ),
              ),
              //W! Pwd Confirm Field
              if (widget.viewModel.pageSelection.value == EmailAuthPage.signUp) ...[
                Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: TextFormField(
                    controller: passwordConfirmationController,
                    // obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    autofillHints: const [AutofillHints.newPassword],
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelText: '$kLPATH_common_labels.confirm_password'.tr().toUpperCase(),
                      labelStyle: labelTextStyle,
                    ),
                    validator: widget.viewModel.pageSelection.value == EmailAuthPage.signUp
                        ? widget.viewModel.onValidateConfirmationPassword
                        : null,
                    onChanged: widget.viewModel.onPasswordConfirmationFieldChange,
                  ),
                ),
                //W! Name field
                Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: TextFormField(
                    controller: nameController,
                    keyboardType: TextInputType.name,
                    autofillHints: const [AutofillHints.givenName],
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      labelText: '$kLPATH_common_labels.name'.tr().toUpperCase(),
                      labelStyle: labelTextStyle,
                    ),
                    onChanged: widget.viewModel.onNameFieldChange,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

//W! Recover/Resend Page
class RecoverResendPage extends StatelessWidget {
  final EmailAuthFormViewModel viewModel;
  final GlobalKey<FormState> formKey;
  const RecoverResendPage({Key? key, required this.viewModel, required this.formKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final labelTextStyle = bodyText1(context).copyWith(fontSize: 10, color: CupertinoColors.systemGrey.darkColor);

    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //W! Form Title
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: Text(
                '$kLPATH_common_titles_auth.reset_password'.tr(),
                style: headline1(context).copyWith(color: Colors.white),
              ),
            ),
            //W! Email (reset) field
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              autofillHints: const [AutofillHints.email],
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                labelText: '$kLPATH_common_labels.email'.tr().toUpperCase(),
                labelStyle: labelTextStyle,
              ),
              validator: viewModel.onValidateEmail,
              onChanged: viewModel.onResetPasswordEmailFieldChange,
            ),
          ],
        ),
      ),
    );
  }
}

//W! Action Control
class EmailAuthActionControl extends StatelessWidget {
  final EmailAuthFormViewModel viewModel;
  final GlobalKey<FormState> signInUpFormKey;
  final GlobalKey<FormState> recoverPasswordFormKey;
  const EmailAuthActionControl(
      {Key? key, required this.viewModel, required this.signInUpFormKey, required this.recoverPasswordFormKey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<EmailAuthPage>(
      valueListenable: viewModel.pageSelection,
      builder: (context, value, widget) {
        final selectedPage = value == EmailAuthPage.signIn || value == EmailAuthPage.signUp
            ? CrossFadeState.showFirst
            : CrossFadeState.showSecond;
        return AnimatedCrossFade(
          crossFadeState: selectedPage,
          duration: crossFadeDuration,
          firstChild: value == EmailAuthPage.signIn
              ? ActivityAwareButton(
                  label: '$kLPATH_common_titles_auth.sign_in'.tr(),
                  isBusy: viewModel.isBusy,
                  onPressed: () {
                    if (signInUpFormKey.currentState?.validate() == true) {
                      viewModel.runBusyFuture(viewModel.onSignInClicked()).then((result) {
                        if (result) context.router.pop(result);
                      });
                    }
                  },
                )
              : ActivityAwareButton(
                  label: '$kLPATH_common_titles_auth.sign_up'.tr(),
                  isBusy: viewModel.isBusy,
                  onPressed: () {
                    if (signInUpFormKey.currentState?.validate() == true) {
                      viewModel.runBusyFuture<bool>(viewModel.onRegisterClicked()).then((result) {
                        if (result) context.router.pop(result);
                      });
                    }
                  },
                ),
          secondChild: value == EmailAuthPage.recoverPassword
              ? ActivityAwareButton(
                  label: '$kLPATH_common_titles_auth.reset_password'.tr(),
                  isBusy: viewModel.isBusy,
                  onPressed: () {
                    if (recoverPasswordFormKey.currentState?.validate() == true) {
                      viewModel.runBusyFuture<bool>(viewModel.onRecoverPasswordClicked()).then((result) {
                        if (result) {
                          showTopSnackBar(
                            context,
                            CustomSnackBar.success(
                                message: 'msg_password_reset_instructions_sent_to'.tr(args: [viewModel.email])),
                          );
                          viewModel.pageSelection.value = EmailAuthPage.signIn;
                        }
                      });
                    }
                  },
                )
              : ActivityAwareButton(
                  label: 'Resend Activation',
                  isBusy: viewModel.isBusy,
                  onPressed: () {},
                ),
        );
      },
    );
  }
}

class TextWithActionableTap extends StatelessWidget {
  final String firstLine;
  final String actionableLine;
  final VoidCallback onTap;
  const TextWithActionableTap({
    super.key,
    required this.firstLine,
    required this.actionableLine,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      maxLines: 2,
      text: TextSpan(
        style: textStyle,
        text: firstLine,
        children: [
          TextSpan(
            recognizer: TapGestureRecognizer()..onTap = onTap,
            text: actionableLine,
            style: textStyle.copyWith(
              fontWeight: FW.semiBold,
              color: IluramaColors.accentColor,
            ),
          ),
        ],
      ),
    );
  }
}
