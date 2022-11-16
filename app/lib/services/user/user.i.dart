import 'package:dartz/dartz.dart';

import '../../models/models.dart';

abstract class UserServiceInterface {
  ///@ Returns the current user if logged in or null
  Option<User> get currentUser;

  ///@ Returns the Firebase/Firestore UID of the current user if authenticated
  String? get currentUserUid;

  ///@ Returns the user's display name from FirebaseAuth User
  Option<String> get currentUserDisplayName;

  ///@ Fetch user's custom matches for given product id
  Future<Option<List<String>>> getCustomMatchesForUser(String originProductId);

  ///@ Save a new product custom match for current user
  Future<Option<bool>> saveCustomMatchForUser(String origin, String match);

  ///@ Follow some user
  Future<void> follow(User user);

  ///@ Unfollow some user
  Future<void> unfollow(User user);

  ///@ True if this is the first time the app calls this
  bool get isFirstCall;

  ///@ True if this is the first time the app is being runned
  bool get isFirstRun;

  ///@ True if the user has watched the onboarding view
  bool get onBoardDone;

  ///@ Set onBoardDone to true
  Future<void> setOnboardDoneToTrue();
}
