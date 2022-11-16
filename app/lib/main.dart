import 'dart:async';
import 'dart:io';
import 'dart:isolate';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:logging/logging.dart';

import 'app.dart';
import 'app/constants/constants.dart';
import 'app/core/core.dart';
import 'app/helpers/helpers.dart';
import 'app/init.dart';
import 'app/locale/codegen_loader.g.dart';

final log = Logger('main');

Future<void> main() async {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      initRootLogger();
      const environment = kReleaseMode ? Environment.prod : Environment.dev;
      log.info('Starting up Ilurama App in mode: $environment');

      if (!kIsWeb) {
        PlatformDispatcher.instance.onPlatformBrightnessChanged =
            () => Future.delayed(const Duration(milliseconds: 1000)).then((_) => SystemChrome.setSystemUIOverlayStyle(
                  SystemUiOverlayStyle(
                    statusBarColor: Platform.isAndroid ? Colors.transparent : null,
                    statusBarBrightness: SchedulerBinding.instance.window.platformBrightness,
                    statusBarIconBrightness: SchedulerBinding.instance.window.platformBrightness,
                  ),
                ));
        Isolate.current.addErrorListener(RawReceivePort((pair) async {
          final List<dynamic> errorAndStacktrace = pair;
          await FirebaseCrashlytics.instance.recordError(
            errorAndStacktrace.first,
            errorAndStacktrace.last,
            fatal: true,
          );
        }).sendPort);
      }

      try {
        await EasyLocalization.ensureInitialized();
        await initializeApp(environment);

        // TODO enable/disable crashlytics
        // FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

        runApp(
          RootRestorationScope(
            restorationId: kRestorationId,
            child: EasyLocalization(
                supportedLocales: const [Locale('en'), Locale('es'), Locale('ja')],
                fallbackLocale: const Locale('en'),
                path: 'assets/translations',
                useOnlyLangCode: true,
                assetLoader: const CodegenLoader(),
                child: IluramaApp(env: environment)),
          ),
        );
      } catch (e, s) {
        log.severe(e);
        // TODO enable/disable crashlytics
        FirebaseCrashlytics.instance.recordError(e, s, fatal: true);
        runApp(IluramaApp(env: Environment.dev, error: e));
      }
    },
    (e, s) {
      log.severe(e);
      // TODO enable/disable crashlytics
      // FirebaseCrashlytics.instance.recordError(e, s, fatal: true);
    },
  );
}
