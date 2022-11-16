import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flamingo/flamingo.dart';

import '../constants/constants.dart';

@module
abstract class ThirdPartyServicesModule {
  @lazySingleton
  NavigationService get navigationService;
  @lazySingleton
  DialogService get dialogService;
  @lazySingleton
  SnackbarService get snackbarService;
  @lazySingleton
  BottomSheetService get bottomSheetService;

  @lazySingleton
  GoogleSignIn get googleSignIn => GoogleSignIn(scopes: ['email']);

  @lazySingleton
  SignInWithApple get signInWithApple => SignInWithApple();

  @lazySingleton
  FirebaseAuth get firebaseAuth => kReleaseMode
      ? FirebaseAuth.instance
      : FirebaseAuth.instanceFor(
          app: Firebase.app(kFirebaseDebugApp),
        );

  @lazySingleton
  FirebaseFirestore get firebaseFirestore => kReleaseMode
      ? FirebaseFirestore.instance
      : FirebaseFirestore.instanceFor(
          app: Firebase.app(kFirebaseDebugApp),
        );

  @lazySingleton
  FirebaseStorage get firebaseStorage => kReleaseMode
      ? FirebaseStorage.instance
      : FirebaseStorage.instanceFor(
          app: Firebase.app(kFirebaseDebugApp),
        );

  @lazySingleton
  Flamingo get flamingo => Flamingo.instance;

  @preResolve
  Future<SharedPreferences> get preferences => SharedPreferences.getInstance();
}
