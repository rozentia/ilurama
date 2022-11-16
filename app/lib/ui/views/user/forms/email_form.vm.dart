import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ilurama/app/extensions/extensions.dart';
import 'package:ilurama_theme/ilurama_theme.dart';
import 'package:stacked/stacked.dart';

import '../../../../app/constants/constants.dart';
import '../../../../app/core/core.dart';
import '../../../../app/locator/locator.dart';
import '../../../../services/auth/auth.dart';

enum EmailAuthPage {
  signIn,
  signUp,
  recoverPassword,
  resendActivation,
}

class EmailAuthFormViewModel extends BaseViewModel {
  final AuthServiceInterface _authService;
  final ValueNotifier<int> recoverResendSelection = ValueNotifier<int>(0);
  final ValueNotifier<EmailAuthPage> pageSelection = ValueNotifier<EmailAuthPage>(EmailAuthPage.signIn);

  EmailAuthFormViewModel({AuthServiceInterface? authService})
      : _authService = authService ?? getIt<AuthServiceInterface>() {
    emailError.addListener(() => notifyListeners());
    passwordError.addListener(() => notifyListeners());
    passwordConfirmationError.addListener(() => notifyListeners());
  }

  String _email = '';
  String get email => _email;
  String _password = '';
  String _passwordConfirmation = '';
  String _name = '';

  ValueNotifier<String?> emailError = ValueNotifier(null);
  ValueNotifier<String?> passwordError = ValueNotifier(null);
  ValueNotifier<String?> passwordConfirmationError = ValueNotifier(null);

  bool get hasSignInValidationErrors => emailError.value != null || passwordError.value != null;
  bool get hasSignUpValidationErrors => hasSignInValidationErrors || passwordConfirmationError.value != null;

  void onEmailFieldChange(String email) => _email = email;
  void onPasswordFieldChange(String password) => _password = password;
  void onPasswordConfirmationFieldChange(String passwordConfirmation) => _passwordConfirmation = passwordConfirmation;
  void onNameFieldChange(String name) => _name = name;
  void onResetPasswordEmailFieldChange(String email) => _email = email;

  String? onValidateEmail(String? email) {
    if (email == null || email.isEmpty == true) return '$kLPATH_common_msgErrors_validationErrors.email_required'.tr();
    if (!email.isValidEmail) return '$kLPATH_common_msgErrors_validationErrors.invalid_email'.tr();
    return null;
  }

  String? onValidateRequiredPassword(String? password) {
    if (password == null || password.isEmpty == true) {
      return '$kLPATH_common_msgErrors_validationErrors.password_required'.tr();
    }
    return null;
  }

  String? onValidateSignUpPassword(String? password) {
    if (password == null || password.isEmpty == true) {
      return '$kLPATH_common_msgErrors_validationErrors.password_required'.tr();
    }
    if (!password.hasMinLength(8)) {
      return '$kLPATH_common_msgErrors_validationErrors.pwd_at_least_n_char_long'.tr();
    }
    if (!password.hasMinNormalChar(3)) {
      return '$kLPATH_common_msgErrors_validationErrors.pwd_must_contain_at_least_n_letters'.tr();
    }
    if (!password.hasMinUppercase(1)) {
      return '$kLPATH_common_msgErrors_validationErrors.pwd_must_contain_at_least_n_uppercase'.tr();
    }
    if (!password.hasMinNumericChar(1)) {
      return '$kLPATH_common_msgErrors_validationErrors.pwd_must_contain_at_least_n_numbers'.tr();
    }
    if (!password.hasMinSpecialChar(1)) {
      return '$kLPATH_common_msgErrors_validationErrors.pwd_must_contain_at_least_n_specials'.tr();
    }
    return null;
  }

  String? onValidateConfirmationPassword(String? confirmationPassword) {
    if (confirmationPassword == null || confirmationPassword.isEmpty == true) {
      return '$kLPATH_common_msgErrors_validationErrors.pwd_confirmation_required'.tr();
    }
    if (_password != _passwordConfirmation) return '$kLPATH_common_msgErrors_validationErrors.pwd_mismatch'.tr();
    return null;
  }

  void onSignUpSelected() => pageSelection.value = EmailAuthPage.signUp;
  void onSignInSelected() => pageSelection.value = EmailAuthPage.signIn;
  void onRecoverPasswordSelected() => pageSelection.value = EmailAuthPage.recoverPassword;
  bool _isValidForSignIn() => onValidateEmail(_email) == null && onValidateRequiredPassword(_password) == null;
  bool _isValidForSignUp() =>
      _isValidForSignIn() &&
      onValidateConfirmationPassword(_password) == null &&
      onValidateConfirmationPassword(_passwordConfirmation) == null;
  bool _isValidForReset() => onValidateEmail(_email) != null;

  bool setErrorFromAuthResult(Either<AuthFailure, dynamic> result) => result.fold<bool>(
        (failure) {
          setError(failure.errorUIMessage);
          return false;
        },
        (_) {
          setError(null);
          return true;
        },
      );

  Future<bool> onSignInClicked() async {
    if (!_isValidForSignIn()) return false;
    return setErrorFromAuthResult(await _authService.handleEmailSignIn(_email, _password));
  }

  Future<bool> onRegisterClicked() async {
    if (!_isValidForSignUp()) return false;
    return setErrorFromAuthResult(
        await _authService.handleEmailSignUp(email: _email, password: _password, name: _name));
  }

  Future<bool> onRecoverPasswordClicked() async {
    if (!_isValidForReset()) return false;
    return setErrorFromAuthResult(await _authService.sendResetPasswordLink(_email));
  }
}
