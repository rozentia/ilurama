import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:ilurama/app/locator/locator.dart';
import 'package:ilurama/models/models.dart';
import 'package:ilurama/services/auth/auth.dart';
import 'package:ilurama/services/content/content.dart';
import 'package:ilurama/services/user/user.dart';
import 'package:logging/logging.dart';
import 'package:stacked/stacked.dart';

class UserViewModel extends ReactiveViewModel {
  final _log = Logger('UserViewModel');
  final AuthServiceInterface _authService;
  final UserServiceInterface _userService;
  final ContentServiceInterface _contentService;

  UserViewModel({
    AuthServiceInterface? authService,
    UserServiceInterface? userService,
    ContentServiceInterface? contentService,
  })  : _authService = authService ?? getIt<AuthServiceInterface>(),
        _userService = userService ?? getIt<UserServiceInterface>(),
        _contentService = contentService ?? getIt<ContentServiceInterface>();

  @override
  List<ReactiveServiceMixin> get reactiveServices => [
        _authService as ReactiveServiceMixin,
        _userService as ReactiveServiceMixin,
        _contentService as ReactiveServiceMixin,
      ];

  bool get authenticated => _authService.authenticated;
  Option<User> get currentUser => _userService.currentUser;
  String get currentUserEmail => _authService.currentFirebaseUser?.email ?? '';
  bool get currentUserHasEmailVerified => optionOf(_authService.currentFirebaseUser).fold(
        () => false,
        (firebaseUser) => firebaseUser.emailVerified,
      );
  Option<String> get currentUserDisplayName => optionOf(_authService.currentFirebaseUser?.displayName);
  List<Collection> get currentUserCollections => _contentService.allUserCollections;
  List<ColorCode> get currentUserColorCodes => _contentService.allUserColorCodes;
  List<Scene> get currentUserScenes => _contentService.allUserScenes;

  Future<void> startSocialSignIn(AuthType authType) => runBusyFuture(_handleSignIn(authType));

  Future<void> _handleSignIn(AuthType authType) async {
    final result = await _authService.handleSignIn(authType);
    result.fold(
      //LOOSERROR notify
      (l) {
        _log.severe(l);
        setError(true);
      },
      (r) => setError(null),
    );
    //: Compensate for latency on notifyListeners while signin in
    if (hasError) return;
    int cycle = 0;
    while (currentUser.isNone()) {
      await Future.delayed(const Duration(milliseconds: 500));
      cycle++;
      if (cycle > 4) break;
    }
  }

  Future<void> signOut() => runBusyFuture(_authService.handleSignOut());

  //- Email Verification
  Timer? emailVerifier;
  void runVerification() {
    if (emailVerifier?.isActive == true) emailVerifier!.cancel();
    emailVerifier = Timer.periodic(const Duration(seconds: 3), (timer) => checkEmailVerified(timer));
  }

  Future<void> checkEmailVerified(Timer timer) async {
    if (_authService.currentFirebaseUser == null) return;
    await _authService.currentFirebaseUser!.reload();
    if (_authService.currentFirebaseUser?.emailVerified == true) {
      timer.cancel();
      notifyListeners();
    }
  }

  Future<bool> resendEmailActivation() async {
    try {
      await _authService.resendEmailVerification();
      return true;
    } catch (e) {
      //LOOSERROR - unlogged
      return false;
    }
  }

  Future<bool> requestAccountDeletion() async {
    return true;
  }

  @override
  void dispose() {
    if (emailVerifier?.isActive == true) emailVerifier!.cancel();
    super.dispose();
  }
}
