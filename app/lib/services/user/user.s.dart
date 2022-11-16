import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb_auth;
import 'package:flamingo/flamingo.dart';
import 'package:ilurama/app/constants/constants.dart';
import 'package:ilurama/models/content/custom_matches/custom_matches.m.dart';
import 'package:injectable/injectable.dart';
import 'package:is_first_run/is_first_run.dart';
import 'package:logging/logging.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

import '../../models/content/user/user.m.dart';
import 'user.i.dart';

final _log = Logger('UserService');

@Singleton(as: UserServiceInterface, signalsReady: false)
class UserService with ReactiveServiceMixin implements UserServiceInterface {
  final ReactiveValue<User?> _currentUser = ReactiveValue<User?>(null);
  final ReactiveValue<fb_auth.User?> _currentFirebaseUser = ReactiveValue<fb_auth.User?>(null);

  UserService._(fb_auth.FirebaseAuth firebaseAuth) {
    _updateCurrentUser(firebaseAuth.currentUser);
    _currentFirebaseUser.value = firebaseAuth.currentUser;
    firebaseAuth
        .authStateChanges()
        .listen((maybeFbUser) => _updateCurrentUser(maybeFbUser).then((_) => _currentFirebaseUser.value = maybeFbUser));
    listenToReactiveValues([
      _currentUser,
      _currentFirebaseUser,
    ]);
  }

  @factoryMethod
  static Future<UserService> init(fb_auth.FirebaseAuth firebaseAuth) async {
    _log.fine('Initializing UserService from @factoryMethod');
    final preferences = await SharedPreferences.getInstance();

    final service = UserService._(firebaseAuth);

    service._isFirstCall = await IsFirstRun.isFirstCall();
    service._isFirstRun = await IsFirstRun.isFirstRun();

    if (!preferences.containsKey(kOnboardWasViewed)) await preferences.setBool(kOnboardWasViewed, false);
    service._onBoardDone = preferences.getBool(kOnboardWasViewed) ?? false;

    _log.fine('UserService initialized');
    return service;
  }

  bool _isFirstCall = false;
  bool _isFirstRun = false;
  bool _onBoardDone = false;

  @override
  bool get isFirstCall => _isFirstCall;

  @override
  bool get isFirstRun => _isFirstRun;

  @override
  bool get onBoardDone => _onBoardDone;

  @override
  Future<void> setOnboardDoneToTrue() async {
    final preferences = await SharedPreferences.getInstance();
    preferences.setBool(kOnboardWasViewed, true);
  }

  @override
  Option<User> get currentUser => optionOf(_currentUser.value);

  @override
  String? get currentUserUid => _currentFirebaseUser.value?.uid;

  @override
  Option<String> get currentUserDisplayName => optionOf(_currentFirebaseUser.value?.displayName);

  User? get currentUserDocument => currentUserUid == null ? null : User(id: currentUserUid);

  @override
  Future<Option<List<String>>> getCustomMatchesForUser(String originProductId) async {
    if (currentUserDocument == null) return const None();
    final currentMatchPath = '${currentUserDocument!.customMatches.ref.path}/$originProductId';
    return optionOf(CustomMatches(snapshot: await firestoreInstance.doc(currentMatchPath).get()).productMatches);
  }

  @override
  Future<Option<bool>> saveCustomMatchForUser(String origin, String match) async {
    if (currentUserDocument == null) return const None();
    final currentMatchPath = '${currentUserDocument!.customMatches.ref.path}/$origin';
    final currentMatch = CustomMatches(snapshot: await firestoreInstance.doc(currentMatchPath).get());
    // ignore: prefer_collection_literals
    currentMatch.productMatches = Set.of([
      ...(currentMatch.productMatches ??= [match]),
      match
    ]).toList();
    await DocumentAccessor().save(currentMatch);
    return const Some(true);
  }

  @override
  Future<void> follow(User user) {
    // FFEATURE: implement follow
    throw UnimplementedError();
  }

  @override
  Future<void> unfollow(User user) {
    // FFEATURE: implement unfollow
    throw UnimplementedError();
  }

  //-                                                                              HELPERS

  ///@ Returns the firestore user document of [maybeFbUser] or null
  Future<User?> _updateCurrentUser(fb_auth.User? maybeFbUser) async => optionOf(maybeFbUser)
      .fold(
          () => Future.value(null),
          //= Load the user document
          (fbUser) => _getOrCreateUser(fbUser.uid))
      .then((maybeGhUser) => _currentUser.value = maybeGhUser);

  ///@ Returns the firestore user document for [uid] or creates a new one
  Future<User> _getOrCreateUser(String uid) async {
    final ghUser = await DocumentAccessor().load(User(id: uid));
    if (ghUser != null) return ghUser;
    final newGhUser = await User(id: uid).save();
    return newGhUser;
  }
}
