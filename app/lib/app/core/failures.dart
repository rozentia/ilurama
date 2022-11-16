import 'package:easy_localization/easy_localization.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../constants/constants.dart';

part 'failures.freezed.dart';

@freezed
class AppFailure with _$AppFailure {
  //= App Failures
  const factory AppFailure.initializationFailure(Exception exception) = InitializationFailure;
  const factory AppFailure.internalFailure(Exception exception) = InternalFailure;
  const factory AppFailure.googleFailure(dynamic failure) = GoogleFailure;
  const factory AppFailure.unknownError(dynamic error) = UnknownError;

  //= Data Failures
  const factory AppFailure.emptyValueReceived(String fromFunctionName) = EmptyValueReceived;
  const factory AppFailure.parseJsonFailure(Map<String, dynamic> keys) = ParseJsonFailure;
}

@freezed
class AuthFailure with _$AuthFailure {
  const AuthFailure._();
  const factory AuthFailure.authCancelledByUser() = CancelledByUser;
  const factory AuthFailure.userAlreadySignedIn() = UserAlreadySignedIn;
  const factory AuthFailure.firebaseAuthFailure(FirebaseAuthFailure failure) = FirebaseAuthAppFailure;
  const factory AuthFailure.unknownAuthFailure() = UnknownAuthFailure;
  const factory AuthFailure.serverSerror() = ServerError;

  String get errorUIMessage => when<String>(
        authCancelledByUser: () => '$kLPATH_common_msgErrors_authErrors.cancelled_by_user'.tr(),
        userAlreadySignedIn: () => '$kLPATH_common_msgErrors_authErrors.user_already_signed_in'.tr(),
        unknownAuthFailure: () => '$kLPATH_common_msgErrors_authErrors.unknown_auth_failure'.tr(),
        serverSerror: () => '$kLPATH_common_msgErrors_authErrors.server_error'.tr(),
        firebaseAuthFailure: (firebaseFailure) => firebaseFailure.when<String>(
          invalidEmail: () => '$kLPATH_common_msgErrors_authErrors.invalid_email'.tr(),
          userDisabled: () => '$kLPATH_common_msgErrors_authErrors.user_disabled'.tr(),
          userNotfound: () => '$kLPATH_common_msgErrors_authErrors.user_not_found'.tr(),
          wrongPassword: () => '$kLPATH_common_msgErrors_authErrors.wrong_password'.tr(),
          operationNotAllowed: () => '$kLPATH_common_msgErrors_authErrors.operation_not_allowed'.tr(),
          weakPassword: () => '$kLPATH_common_msgErrors_authErrors.weak_password'.tr(),
          unknown: () => '$kLPATH_common_msgErrors_authErrors.unknown_auth_failure'.tr(),
        ),
      );
}

@freezed
class FirebaseAuthFailure with _$FirebaseAuthFailure {
  const factory FirebaseAuthFailure.invalidEmail() = InvalidEmail;
  const factory FirebaseAuthFailure.userDisabled() = UserDisabled;
  const factory FirebaseAuthFailure.userNotfound() = UserNotFound;
  const factory FirebaseAuthFailure.wrongPassword() = WrongPassword;
  const factory FirebaseAuthFailure.operationNotAllowed() = OperationNotAllowed;
  const factory FirebaseAuthFailure.weakPassword() = WeakPassword;

  const factory FirebaseAuthFailure.unknown() = UnknownFBAuthFailure;

  static FirebaseAuthFailure fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return const FirebaseAuthFailure.invalidEmail();
      case 'auth/invalid-email':
        return const FirebaseAuthFailure.invalidEmail();
      case 'user-disabled':
        return const FirebaseAuthFailure.userDisabled();
      case 'user-not-found':
        return const FirebaseAuthFailure.userNotfound();
      case 'auth/user-not-found':
        return const FirebaseAuthFailure.userNotfound();
      case 'wrong-password':
        return const FirebaseAuthFailure.wrongPassword();
      case 'operation-not-allowed':
        return const FirebaseAuthFailure.operationNotAllowed();
      case 'weak-password':
        return const FirebaseAuthFailure.weakPassword();
      default:
        return const FirebaseAuthFailure.unknown();
    }
  }
}


/*
Unhandled Firebaseauth Exception Codes:

auth/missing-android-pkg-name
An Android package name must be provided if the Android app is required to be installed.

auth/missing-continue-uri
A continue URL must be provided in the request.

auth/missing-ios-bundle-id
An iOS Bundle ID must be provided if an App Store ID is provided.

auth/invalid-continue-uri
The continue URL provided in the request is invalid.

auth/unauthorized-continue-uri
The domain of the continue URL is not whitelisted. Whitelist the domain in the Firebase console.
*/