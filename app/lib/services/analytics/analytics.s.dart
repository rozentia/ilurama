import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';

final _log = Logger('AnalyticsService');

@lazySingleton
class AnalyticsService {
  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;
  FirebaseAnalyticsObserver getAnalyticsObserver() => FirebaseAnalyticsObserver(analytics: _analytics);

  Future<void> some() async {
    _analytics.logAppOpen();
    _analytics.logEvent(name: 'name');
    _analytics.logLogin();
    _analytics.logScreenView();
    _analytics.logSearch(searchTerm: 'searchTerm');
    _analytics.logShare(contentType: 'contentType', itemId: 'itemId', method: 'method');
    _analytics.logSignUp(signUpMethod: 'signUpMethod');
    _analytics.logTutorialBegin();
    _analytics.logTutorialComplete();
  }
}
