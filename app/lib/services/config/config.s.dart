import 'package:ilurama/services/config/config.i.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Singleton(signalsReady: false, as: ConfigServiceInterface)
class ConfigService implements ConfigServiceInterface {
  ConfigService._();

  @factoryMethod
  static Future<ConfigService> init(
    SharedPreferences sharedPreferences,
  ) async {
    return ConfigService._();
  }
}
