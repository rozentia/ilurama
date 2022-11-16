import 'package:firebase_core/firebase_core.dart';
import 'package:flamingo/flamingo.dart';
import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';

import '../firebase_options_dev.dart';
import '../firebase_options.dart';
import 'constants/constants.dart';
import 'database/init.dart';
import 'locator/locator.setup.dart';

Future<bool> initializeApp(String env) async {
  final log = Logger('initializeApp');

  log.fine('Initializing App');

  try {
    await Future.wait([
      Flamingo.initializeApp(options: DefaultFirebaseOptions.currentPlatform),
      Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform),
      initializeDatabase(),
    ]);
    if (!kReleaseMode) {
      //= Inititalize DEBUG ONLY elements
      final firebaseDebugApp = await Firebase.initializeApp(
        name: kFirebaseDebugApp,
        options: DefaultFirebaseDevOptions.currentPlatform,
      );
      Flamingo.overrideWithSetting(
        isWebCache: false,
        firestoreInstance: FirebaseFirestore.instanceFor(app: firebaseDebugApp),
        storageInstance: FirebaseStorage.instanceFor(app: firebaseDebugApp),
      );
    }

    /*
    //= Firebase Simulator Setup
    if (env == Environment.dev) {
    log.info('Setting Firestore Emulator for Dev Environment');
    String host = Platform.isAndroid ? '10.0.2.2' : 'localhost';
    Flamingo.configureEmulator();
    FirebaseFirestore.instance.useFirestoreEmulator(host, 8080);
    FirebaseAuth.instance.useAuthEmulator(host, 9099);
    FirebaseStorage.instance.useStorageEmulator(host, 9199);
    }
    */

    await setupLocator(env);
    await getIt.allReady();

    log.fine('Initialization Done!');
    return true;
  } catch (e) {
    log.severe(e);
    rethrow;
  }
}
