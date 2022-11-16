import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:ilurama/app/constants/constants.dart';
import 'package:ilurama/app/routes/routes.dart';
import 'package:ilurama/ui/views/views.dart';
import 'package:ilurama/wiredash_env.dart';
import 'package:ilurama_theme/ilurama_theme.dart';
import 'package:logging/logging.dart';
import 'package:wiredash/wiredash.dart';

import 'app/locator/locator.dart';
import 'services/analytics/analytics.dart';
import 'services/user/user.dart';

final _log = Logger('IluramaApp');

//-                                                                         IluramaApp
class IluramaApp extends StatelessWidget {
  final String env;
  final dynamic error;
  final _router = AppRouter();

  IluramaApp({Key? key, required this.env, this.error}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (error != null) {
      _log.severe(error.toString());
      return const AppWrapper(home: ErrorView(errorCode: 101));
    }

    Future.delayed(const Duration(milliseconds: 1000)).then((_) => SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle(
            statusBarColor: Platform.isAndroid ? Colors.transparent : null,
            statusBarBrightness: SchedulerBinding.instance.window.platformBrightness,
            statusBarIconBrightness: SchedulerBinding.instance.window.platformBrightness,
          ),
        ));

    _log.fine('Building Main Widget');

    final bool isFirstCallOnMobile = kIsWeb ? false : getIt<UserServiceInterface>().isFirstCall;

    return Wiredash(
      projectId: wiredashProjectId,
      secret: wiredashProjectKey,
      theme: WiredashThemeData.fromColor(
        primaryColor: IluramaColors.accentColor,
        brightness: context.brightness,
      ),
      child: NeumorphicTheme(
        theme: IluramaTheme.neumorphic_light,
        darkTheme: IluramaTheme.neumorphic_dark,
        child: MaterialApp.router(
          routerDelegate: AutoRouterDelegate(
            _router,
            navRestorationScopeId: kNavRestorationScopeId,
            navigatorObservers: () => [getIt<AnalyticsService>().getAnalyticsObserver()],
            initialRoutes:
                // true //: Toggle this with the line below to start with the onboarding reoute
                isFirstCallOnMobile ? [Onboard()] : [const HomeRoute()],
          ),
          routeInformationParser: _router.defaultRouteParser(includePrefixMatches: true),
          debugShowCheckedModeBanner: false,
          title: 'Ilurama App',
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          theme: IluramaTheme.material_light,
          darkTheme: IluramaTheme.material_dark,
          restorationScopeId: kRestorationId,
        ),
      ),
    );
  }
}

//-                                                                         AppWrapper
class AppWrapper extends StatelessWidget {
  final Widget? home;
  const AppWrapper({Key? key, this.home}) : super(key: key);

  @override
  Widget build(BuildContext context) => NeumorphicApp(
        debugShowCheckedModeBanner: false,
        title: 'Ilurama App',
        theme: IluramaTheme.neumorphic_light,
        darkTheme: IluramaTheme.neumorphic_dark,
        materialTheme: IluramaTheme.material_light,
        materialDarkTheme: IluramaTheme.material_dark,
        home: home,
      );
}
