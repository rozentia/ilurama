import 'package:auto_route/auto_route.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ilurama/ui/views/user/email_verification_guard.vw.dart';
import 'package:ilurama_theme/ilurama_theme.dart';
import 'package:line_icons/line_icons.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:stacked/stacked.dart';

import '../../../app/locator/locator.dart';
import '../../../app/routes/routes.dart';
import '../../../services/auth/auth.dart';
import '../../../services/user/user.dart';

const kTabRoutes = [
  PostsRouter(),
  LibraryRouter(),
  ContentRouter(),
  UserRouter(),
];

class HomeView extends StatelessWidget implements AutoRouteWrapper {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget wrappedRoute(BuildContext context) => CupertinoScaffold(body: this);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
        viewModelBuilder: () => HomeViewModel(),
        builder: (context, model, widget) {
          final tabRoutes = [
            const LibraryRouter(),
            if (model.authenticatedAndUserLoaded) ...const [
              ContentRouter(),
              // TODO Uncomment below to activate Scenes feature
              // PostsRouter(),
            ],
            const UserRouter(),
          ];

          return AutoTabsScaffold(
            lazyLoad: false,
            routes: tabRoutes,
            bottomNavigationBuilder: (context, router) {
              return IluramaTabBar(
                bottomInset: 25,
                iconSize: 24.0,
                onTap: router.setActiveIndex,
                currentIndex: router.activeIndex,
                items: <BottomNavigationBarItem>[
                  // if (model.authenticatedAndUserLoaded)
                  //   BottomNavigationBarItem(
                  //     icon: const Icon(LineIcons.home),
                  //     label: 'tab_title_home'.tr(),
                  //   ),
                  BottomNavigationBarItem(
                    icon: const Icon(LineIcons.swatchbook),
                    label: 'tab_title_library'.tr(),
                  ),
                  if (model.authenticatedAndUserLoaded)
                    BottomNavigationBarItem(
                      icon: const Icon(LineIcons.suitcase),
                      label: 'tab_title_content'.tr(),
                    ),
                  BottomNavigationBarItem(
                    icon: const Icon(LineIcons.user),
                    label: 'tab_title_user'.tr(),
                  ),
                ],
              );
            },
          );
        });
  }
}

class HomeViewModel extends ReactiveViewModel {
  final AuthServiceInterface _authService;
  final UserServiceInterface _userService;

  HomeViewModel({
    AuthServiceInterface? authService,
    UserServiceInterface? userService,
  })  : _authService = authService ?? getIt<AuthServiceInterface>(),
        _userService = userService ?? getIt<UserServiceInterface>();

  @override
  List<ReactiveServiceMixin> get reactiveServices => [
        _authService as ReactiveServiceMixin,
        _userService as ReactiveServiceMixin,
      ];

  // TODO Uncomment below to remove the onBoardDone bypass
  bool get onBoardDone => _userService.onBoardDone;

  bool? get userHasEmailVerified => optionOf(_authService.currentFirebaseUser).fold<bool?>(
        () => null,
        (user) => user.emailVerified,
      );

  bool get authenticatedAndUserLoaded => _authService.currentFirebaseUser?.emailVerified == true;
}
