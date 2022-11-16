import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';

class DynamicLinkService {
  Future handleDynamicLinks() async {
    // Firstly, when app start with deep link
    final PendingDynamicLinkData? data = await FirebaseDynamicLinks.instance.getInitialLink();
    await _handleDeepLink(data);

    // Secondly, when app was on background and back to foreground by being triggered with deep link,
    // Those callback function will be triggered.
    FirebaseDynamicLinks.instance.onLink.listen((PendingDynamicLinkData dynamicLink) async {
      await _handleDeepLink(dynamicLink);
    }, onError: (e) {
      //LOOSERROR -
    });
  }

  Future<void> _handleDeepLink(PendingDynamicLinkData? data) async {
    if (data == null) return;
    final Uri deepLink = data.link;

    var isInStore = deepLink.pathSegments.contains('some-path');
    if (isInStore) await _doSomething(deepLink.queryParameters['key']);
  }

  Future<void> _doSomething(String? queryValue) async {
    //Do something when deep link triggered
    print(queryValue);
  }
}
