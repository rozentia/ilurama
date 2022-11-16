import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../app/core/core.dart';
import 'auth_type.dart';

abstract class AuthServiceInterface {
  ///@ Current authentication state
  bool get authenticated;

  ///@ The authenticated user in Firebase Auth
  User? get currentFirebaseUser;

  ///@ Register a [callback] to run when authentication state changes
  StreamSubscription<bool> listen(void Function(bool) callback);

  ///@ Signs a user in and links its account with the device ID
  Future<Either<AuthFailure, UserCredential>> handleSignIn(AuthType authType);

  ///@ Signs a user out , clear all its data stored in device ad removes
  ///@ the linked device id from its account
  Future<Either<AuthFailure, Unit>> handleSignOut();

  ///@ Signs in a user usin email and password
  Future<Either<AuthFailure, UserCredential>> handleEmailSignIn(String email, String password);

  ///@ Signs up a user using email and password
  Future<Either<AuthFailure, UserCredential>> handleEmailSignUp({
    required String email,
    required String password,
    required String name,
  });

  ///@ Sends the email verification to the currently logged in user if it is not verified;
  Future<void> resendEmailVerification();

  ///@ Send reset password link
  Future<Either<AuthFailure, void>> sendResetPasswordLink(String email);
}
