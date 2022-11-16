import 'dart:async';
import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:stacked/stacked.dart';

import '../../app/core/core.dart';
import '../analytics/analytics.s.dart';
import 'auth.i.dart';
import 'auth_type.dart';

final _log = Logger('AuthService');

@Singleton(as: AuthServiceInterface, signalsReady: false)
class AuthService with ReactiveServiceMixin implements AuthServiceInterface {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;
  final bool appleSignInAvailable;
  final AnalyticsService analyticsService;

  AuthService._(
    this._firebaseAuth,
    this._googleSignIn, {
    required this.appleSignInAvailable,
    required this.analyticsService,
  }) {
    _authenticated.value = _firebaseAuth.currentUser != null;
    _firebaseAuth.authStateChanges().listen((user) {
      _authenticated.value = user != null;
    });

    _firebaseAuth.userChanges().listen((user) {
      _currentFirebaseUser.value = user;
    });

    listenToReactiveValues([_authenticated, _currentFirebaseUser]);
  }

  final ReactiveValue<bool> _authenticated = ReactiveValue<bool>(false);
  @override
  bool get authenticated => _authenticated.value;
  final ReactiveValue<User?> _currentFirebaseUser = ReactiveValue<User?>(null);

  @override
  User? get currentFirebaseUser => _currentFirebaseUser.value;

  @override
  StreamSubscription<bool> listen(void Function(bool) callback) => _authenticated.listen(callback);

  @factoryMethod
  static Future<AuthService> init(
    FirebaseAuth firebaseAuth,
    GoogleSignIn googleSignIn,
    SignInWithApple signInWithApple,
    AnalyticsService analyticsService,
  ) async {
    _log.fine('Initializing AuthService from @factoryMethod');
    final authService = AuthService._(
      firebaseAuth,
      googleSignIn,
      analyticsService: analyticsService,
      appleSignInAvailable: await SignInWithApple.isAvailable(),
    );
    _log.fine('AuthService initialized');
    return authService;
  }

  @override
  Future<Either<AuthFailure, UserCredential>> handleSignIn(AuthType authType) async => authType
          //= Determine the future to run
          .maybeWhen<Future<Either<AuthFailure, AuthCredential>>>(
            authWithApple: () => _handleAppleSignIn(),
            authWithGoogle: () => _handleGoogleSignIn(),
            orElse: () async => const Left(AuthFailure.unknownAuthFailure()),
          )
          //= Sign into Firebase using OAuth Credential
          .then<Either<AuthFailure, UserCredential>>((oAuthCredentialOrFailure) => oAuthCredentialOrFailure.fold(
                (failure) => Future.value(Left(failure)),
                (oAuthCredential) => _fbSignIn(oAuthCredential),
              ))
          .then((userOrFailure) {
        if (userOrFailure.isRight()) {
          _authenticated.value = _firebaseAuth.currentUser != null;
          if (_firebaseAuth.currentUser == null) return userOrFailure;
          //= Store userId in Analytics
          // analyticsService
          //     .setUserProperties(_firebaseAuth.currentUser!.uid)
          //     .then((_) => _log.info('analytics saved userId'));
        }
        return userOrFailure;
      });

  @override
  Future<Either<AuthFailure, Unit>> handleSignOut() async {
    try {
      if (_firebaseAuth.currentUser != null) {
        await _firebaseAuth.signOut();
        if (await _googleSignIn.isSignedIn()) await _googleSignIn.signOut();
      }
      _authenticated.value = false;
      return const Right(unit);
    } catch (e, s) {
      _log.severe(e);
      await FirebaseCrashlytics.instance.recordError(e, s, reason: 'handleSignOut');
      return const Left(UnknownAuthFailure());
    }
  }

  @override
  Future<Either<AuthFailure, UserCredential>> handleEmailSignIn(String email, String password) async {
    try {
      final credential = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      if (credential.user == null) return const Left(AuthFailure.unknownAuthFailure());
      return Right(credential);
    } on FirebaseAuthException catch (e) {
      return Left(AuthFailure.firebaseAuthFailure(FirebaseAuthFailure.fromCode(e.code)));
    } catch (e) {
      return const Left(AuthFailure.unknownAuthFailure());
    }
  }

  @override
  Future<Either<AuthFailure, UserCredential>> handleEmailSignUp({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      if (credential.user == null) return const Left(AuthFailure.unknownAuthFailure());
      final user = credential.user!;
      await Future.wait([
        user.sendEmailVerification(),
        user.updateDisplayName(name),
      ]);
      return Right(credential);
    } on FirebaseAuthException catch (e) {
      return Left(AuthFailure.firebaseAuthFailure(FirebaseAuthFailure.fromCode(e.code)));
    } catch (e) {
      return const Left(AuthFailure.unknownAuthFailure());
    }
  }

  @override
  Future<void> resendEmailVerification() async {
    if (_firebaseAuth.currentUser == null) return;
    if (_firebaseAuth.currentUser!.emailVerified) return;
    await _firebaseAuth.currentUser!.sendEmailVerification();
  }

  @override
  Future<Either<AuthFailure, void>> sendResetPasswordLink(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      return const Right(null);
    } on FirebaseAuthException catch (e) {
      return Left(AuthFailure.firebaseAuthFailure(FirebaseAuthFailure.fromCode(e.code)));
    } catch (e) {
      return const Left(AuthFailure.unknownAuthFailure());
    }
  }

  //-                                                                              HELPERS

  ///@ Starts sign in with google process and returns oauth credential or failure
  Future<Either<AuthFailure, AuthCredential>> _handleGoogleSignIn() async {
    try {
      //= Start Google Sign In process
      _log.info('Started SignIn with Google');
      final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
      if (googleSignInAccount == null) return const Left(CancelledByUser());

      final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken,
      );
      _log.info('SignIn with Google Done!');
      //= Set global authenticated value (notifies all listeners)
      return Right(credential);
    } catch (e, s) {
      _log.severe(e);
      await FirebaseCrashlytics.instance.recordError(e, s, reason: '_handleGoogleSignIn');
      return const Left(UnknownAuthFailure());
    }
  }

  ///@ Starts the sign in with apple process and returns oauth credential or failure
  Future<Either<AuthFailure, AuthCredential>> _handleAppleSignIn() async {
    try {
      _log.info('Started SignIn with Apple');
      final rawNonce = generateNonce();
      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        nonce: sha256.convert(utf8.encode(rawNonce)).toString(),
      );

      // Create an `OAuthCredential` from the credential returned by Apple.
      //! If the nonce we generated earlier does
      //! not match the nonce in `appleCredential.identityToken`, sign in will fail.
      final AuthCredential oauthCredential = OAuthProvider('apple.com').credential(
        idToken: appleCredential.identityToken,
        rawNonce: rawNonce,
      );
      _log.info('SignIn with Apple Done!');
      return Right(oauthCredential);
    } catch (e, s) {
      _log.severe(e);
      await FirebaseCrashlytics.instance.recordError(e, s, reason: '_handleAppleSignIn');
      return const Left(UnknownAuthFailure());
    }
  }

  ///@ Signs the user in at Firebase using the provided OAuth credential and returns Firebase Auth Credential
  Future<Either<AuthFailure, UserCredential>> _fbSignIn(AuthCredential credential) async {
    try {
      _log.info('Signing in @ Firebase');
      return Right(await _firebaseAuth.signInWithCredential(credential));
    } catch (e, s) {
      _log.severe(e);
      await FirebaseCrashlytics.instance.recordError(e, s, reason: '_fbSignIn');
      return const Left(UnknownAuthFailure());
    }
  }
}
