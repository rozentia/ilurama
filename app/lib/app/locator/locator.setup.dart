import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';

import 'locator.setup.config.dart';

final getIt = GetIt.instance;

final _log = Logger('setupLocator');

@injectableInit
Future<void> setupLocator(String env) async {
  _log.fine('Seting up dependency locator');
  await $initGetIt(getIt, environment: env);
  _log.fine('Dependency locator setup completed');
}
