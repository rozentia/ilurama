import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_core/firebase_core.dart';

import '../../app/locator/locator.dart';
import '../auth/auth.dart';

class CloudFunctionsService {
  final functions = FirebaseFunctions.instanceFor(app: Firebase.app(), region: 'europe-west1');

  Future<void> requestAccountDeletion() async {
    try {
      final userUid = getIt<AuthServiceInterface>().currentFirebaseUser?.uid;
      if (userUid == null) throw Exception('User either not authenticated or not found');
      final response = await functions.httpsCallable('app-reqdel').call(userUid);
      print(response.data);
    } catch (e) {
      //LOOSERROR -
      print(e);
    }
  }
}
