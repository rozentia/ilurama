import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constants/constants.dart';
import 'locator/locator.dart';

Future<bool> isFirstRun() async =>
    optionOf(getIt<SharedPreferences>().get(PreferenceKeys.isFirstRun)).fold<Future<bool>>(
      //= Sets the value to false and returns true
      () => getIt<SharedPreferences>().setBool(PreferenceKeys.isFirstRun, false).then((e) => !e),
      //= Returns the value stored (false)
      (a) => Future.value(a as bool),
    );
