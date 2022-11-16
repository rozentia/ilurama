// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/cupertino.dart' as _i5;
import 'package:flutter/material.dart' as _i4;

import '../../entities/color_item/color_item.dart' as _i6;
import '../../ui/views/views.dart' as _i1;
import '../../ui/widgets/widgets.dart' as _i2;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    Login.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.LoginView(),
      );
    },
    Error.name: (routeData) {
      final args = routeData.argsAs<ErrorArgs>();
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i1.ErrorView(
          key: args.key,
          errorCode: args.errorCode,
        ),
      );
    },
    Flashlight.name: (routeData) {
      final args = routeData.argsAs<FlashlightArgs>();
      return _i3.CustomPage<dynamic>(
        routeData: routeData,
        child: _i1.FlashlightView(
          args.color,
          key: args.key,
        ),
        fullscreenDialog: true,
        transitionsBuilder: _i3.TransitionsBuilders.zoomIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    Onboard.name: (routeData) {
      final args = routeData.argsAs<OnboardArgs>(orElse: () => const OnboardArgs());
      return _i3.CustomPage<dynamic>(
        routeData: routeData,
        child: _i1.OnboardView(key: args.key),
        fullscreenDialog: true,
        transitionsBuilder: _i3.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    HomeRoute.name: (routeData) {
      return _i3.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.HomeView(),
        transitionsBuilder: _i3.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    PostsRouter.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.CupertinoWrapper(),
      );
    },
    LibraryRouter.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.CupertinoWrapper(),
      );
    },
    ContentRouter.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.CupertinoWrapper(),
      );
    },
    UserRouter.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.CupertinoWrapper(),
      );
    },
    PostsRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.PostsView(),
      );
    },
    PostItemRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.PostItemView(),
      );
    },
    LibraryRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.LibraryView(),
      );
    },
    LibraryItemRoute.name: (routeData) {
      final args = routeData.argsAs<LibraryItemRouteArgs>();
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i1.LibraryItemView(
          args.libraryItemId,
          key: args.key,
          parentRouteShortTitle: args.parentRouteShortTitle,
        ),
      );
    },
    CollectionItemRoute.name: (routeData) {
      final args = routeData.argsAs<CollectionItemRouteArgs>();
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i1.CollectionItemView(
          args.collectionId,
          key: args.key,
          parentRouteShortTitle: args.parentRouteShortTitle,
        ),
      );
    },
    ColorCodeItemRoute.name: (routeData) {
      final args = routeData.argsAs<ColorCodeItemRouteArgs>();
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i1.ColorCodeItemView(
          args.colorCodeId,
          key: args.key,
          parentRouteShortTitle: args.parentRouteShortTitle,
        ),
      );
    },
    PostItemEditorRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.PostItemEditorView(),
      );
    },
    CompareItemRoute.name: (routeData) {
      final args = routeData.argsAs<CompareItemRouteArgs>();
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i1.CompareItemView(
          key: args.key,
          source: args.source,
          target: args.target,
        ),
      );
    },
    ContentRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.ContentView(),
      );
    },
    UserRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.UserView(),
      );
    },
    SettingsRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SettingsView(),
      );
    },
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(
          Login.name,
          path: '/login',
        ),
        _i3.RouteConfig(
          Error.name,
          path: 'error/:errorCode',
        ),
        _i3.RouteConfig(
          Flashlight.name,
          path: '/flashlight',
        ),
        _i3.RouteConfig(
          Onboard.name,
          path: '/onboard',
        ),
        _i3.RouteConfig(
          HomeRoute.name,
          path: '/',
          children: [
            _i3.RouteConfig(
              PostsRouter.name,
              path: 'posts',
              parent: HomeRoute.name,
              children: [
                _i3.RouteConfig(
                  PostsRoute.name,
                  path: '',
                  parent: PostsRouter.name,
                ),
                _i3.RouteConfig(
                  PostItemRoute.name,
                  path: ':postId',
                  parent: PostsRouter.name,
                ),
                _i3.RouteConfig(
                  '*#redirect',
                  path: '*',
                  parent: PostsRouter.name,
                  redirectTo: '',
                  fullMatch: true,
                ),
              ],
            ),
            _i3.RouteConfig(
              LibraryRouter.name,
              path: 'library',
              parent: HomeRoute.name,
              children: [
                _i3.RouteConfig(
                  LibraryRoute.name,
                  path: '',
                  parent: LibraryRouter.name,
                ),
                _i3.RouteConfig(
                  LibraryItemRoute.name,
                  path: ':libraryItemId',
                  parent: LibraryRouter.name,
                ),
                _i3.RouteConfig(
                  CollectionItemRoute.name,
                  path: ':collectionId',
                  parent: LibraryRouter.name,
                ),
                _i3.RouteConfig(
                  ColorCodeItemRoute.name,
                  path: ':colorCodeId',
                  parent: LibraryRouter.name,
                ),
                _i3.RouteConfig(
                  PostItemEditorRoute.name,
                  path: ':postId',
                  parent: LibraryRouter.name,
                ),
                _i3.RouteConfig(
                  CompareItemRoute.name,
                  path: ':libraryItemId/compareWith/:targetItemId',
                  parent: LibraryRouter.name,
                ),
                _i3.RouteConfig(
                  '*#redirect',
                  path: '*',
                  parent: LibraryRouter.name,
                  redirectTo: '',
                  fullMatch: true,
                ),
              ],
            ),
            _i3.RouteConfig(
              ContentRouter.name,
              path: 'content',
              parent: HomeRoute.name,
              children: [
                _i3.RouteConfig(
                  ContentRoute.name,
                  path: '',
                  parent: ContentRouter.name,
                ),
                _i3.RouteConfig(
                  CollectionItemRoute.name,
                  path: ':collectionId',
                  parent: ContentRouter.name,
                ),
                _i3.RouteConfig(
                  ColorCodeItemRoute.name,
                  path: ':colorCodeId',
                  parent: ContentRouter.name,
                ),
                _i3.RouteConfig(
                  PostItemEditorRoute.name,
                  path: ':postId',
                  parent: ContentRouter.name,
                ),
                _i3.RouteConfig(
                  LibraryItemRoute.name,
                  path: ':libraryItemId',
                  parent: ContentRouter.name,
                ),
                _i3.RouteConfig(
                  '*#redirect',
                  path: '*',
                  parent: ContentRouter.name,
                  redirectTo: '',
                  fullMatch: true,
                ),
              ],
            ),
            _i3.RouteConfig(
              UserRouter.name,
              path: 'user',
              parent: HomeRoute.name,
              children: [
                _i3.RouteConfig(
                  UserRoute.name,
                  path: '',
                  parent: UserRouter.name,
                ),
                _i3.RouteConfig(
                  SettingsRoute.name,
                  path: 'settings',
                  parent: UserRouter.name,
                ),
                _i3.RouteConfig(
                  '*#redirect',
                  path: '*',
                  parent: UserRouter.name,
                  redirectTo: '',
                  fullMatch: true,
                ),
              ],
            ),
          ],
        ),
      ];
}

/// generated route for
/// [_i1.LoginView]
class Login extends _i3.PageRouteInfo<void> {
  const Login()
      : super(
          Login.name,
          path: '/login',
        );

  static const String name = 'Login';
}

/// generated route for
/// [_i1.ErrorView]
class Error extends _i3.PageRouteInfo<ErrorArgs> {
  Error({
    _i5.Key? key,
    required int errorCode,
  }) : super(
          Error.name,
          path: 'error/:errorCode',
          args: ErrorArgs(
            key: key,
            errorCode: errorCode,
          ),
        );

  static const String name = 'Error';
}

class ErrorArgs {
  const ErrorArgs({
    this.key,
    required this.errorCode,
  });

  final _i5.Key? key;

  final int errorCode;

  @override
  String toString() {
    return 'ErrorArgs{key: $key, errorCode: $errorCode}';
  }
}

/// generated route for
/// [_i1.FlashlightView]
class Flashlight extends _i3.PageRouteInfo<FlashlightArgs> {
  Flashlight({
    required _i5.Color color,
    _i5.Key? key,
  }) : super(
          Flashlight.name,
          path: '/flashlight',
          args: FlashlightArgs(
            color: color,
            key: key,
          ),
        );

  static const String name = 'Flashlight';
}

class FlashlightArgs {
  const FlashlightArgs({
    required this.color,
    this.key,
  });

  final _i5.Color color;

  final _i5.Key? key;

  @override
  String toString() {
    return 'FlashlightArgs{color: $color, key: $key}';
  }
}

/// generated route for
/// [_i1.OnboardView]
class Onboard extends _i3.PageRouteInfo<OnboardArgs> {
  Onboard({_i5.Key? key})
      : super(
          Onboard.name,
          path: '/onboard',
          args: OnboardArgs(key: key),
        );

  static const String name = 'Onboard';
}

class OnboardArgs {
  const OnboardArgs({this.key});

  final _i5.Key? key;

  @override
  String toString() {
    return 'OnboardArgs{key: $key}';
  }
}

/// generated route for
/// [_i1.HomeView]
class HomeRoute extends _i3.PageRouteInfo<void> {
  const HomeRoute({List<_i3.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i2.CupertinoWrapper]
class PostsRouter extends _i3.PageRouteInfo<void> {
  const PostsRouter({List<_i3.PageRouteInfo>? children})
      : super(
          PostsRouter.name,
          path: 'posts',
          initialChildren: children,
        );

  static const String name = 'PostsRouter';
}

/// generated route for
/// [_i2.CupertinoWrapper]
class LibraryRouter extends _i3.PageRouteInfo<void> {
  const LibraryRouter({List<_i3.PageRouteInfo>? children})
      : super(
          LibraryRouter.name,
          path: 'library',
          initialChildren: children,
        );

  static const String name = 'LibraryRouter';
}

/// generated route for
/// [_i2.CupertinoWrapper]
class ContentRouter extends _i3.PageRouteInfo<void> {
  const ContentRouter({List<_i3.PageRouteInfo>? children})
      : super(
          ContentRouter.name,
          path: 'content',
          initialChildren: children,
        );

  static const String name = 'ContentRouter';
}

/// generated route for
/// [_i3.EmptyRouterPage]
class UserRouter extends _i3.PageRouteInfo<void> {
  const UserRouter({List<_i3.PageRouteInfo>? children})
      : super(
          UserRouter.name,
          path: 'user',
          initialChildren: children,
        );

  static const String name = 'UserRouter';
}

/// generated route for
/// [_i1.PostsView]
class PostsRoute extends _i3.PageRouteInfo<void> {
  const PostsRoute()
      : super(
          PostsRoute.name,
          path: '',
        );

  static const String name = 'PostsRoute';
}

/// generated route for
/// [_i1.PostItemView]
class PostItemRoute extends _i3.PageRouteInfo<void> {
  const PostItemRoute()
      : super(
          PostItemRoute.name,
          path: ':postId',
        );

  static const String name = 'PostItemRoute';
}

/// generated route for
/// [_i1.LibraryView]
class LibraryRoute extends _i3.PageRouteInfo<void> {
  const LibraryRoute()
      : super(
          LibraryRoute.name,
          path: '',
        );

  static const String name = 'LibraryRoute';
}

/// generated route for
/// [_i1.LibraryItemView]
class LibraryItemRoute extends _i3.PageRouteInfo<LibraryItemRouteArgs> {
  LibraryItemRoute({
    required String libraryItemId,
    _i5.Key? key,
    String? parentRouteShortTitle,
  }) : super(
          LibraryItemRoute.name,
          path: ':libraryItemId',
          args: LibraryItemRouteArgs(
            libraryItemId: libraryItemId,
            key: key,
            parentRouteShortTitle: parentRouteShortTitle,
          ),
        );

  static const String name = 'LibraryItemRoute';
}

class LibraryItemRouteArgs {
  const LibraryItemRouteArgs({
    required this.libraryItemId,
    this.key,
    this.parentRouteShortTitle,
  });

  final String libraryItemId;

  final _i5.Key? key;

  final String? parentRouteShortTitle;

  @override
  String toString() {
    return 'LibraryItemRouteArgs{libraryItemId: $libraryItemId, key: $key, parentRouteShortTitle: $parentRouteShortTitle}';
  }
}

/// generated route for
/// [_i1.CollectionItemView]
class CollectionItemRoute extends _i3.PageRouteInfo<CollectionItemRouteArgs> {
  CollectionItemRoute({
    required String collectionId,
    _i5.Key? key,
    String? parentRouteShortTitle,
  }) : super(
          CollectionItemRoute.name,
          path: ':collectionId',
          args: CollectionItemRouteArgs(
            collectionId: collectionId,
            key: key,
            parentRouteShortTitle: parentRouteShortTitle,
          ),
        );

  static const String name = 'CollectionItemRoute';
}

class CollectionItemRouteArgs {
  const CollectionItemRouteArgs({
    required this.collectionId,
    this.key,
    this.parentRouteShortTitle,
  });

  final String collectionId;

  final _i5.Key? key;

  final String? parentRouteShortTitle;

  @override
  String toString() {
    return 'CollectionItemRouteArgs{collectionId: $collectionId, key: $key, parentRouteShortTitle: $parentRouteShortTitle}';
  }
}

/// generated route for
/// [_i1.ColorCodeItemView]
class ColorCodeItemRoute extends _i3.PageRouteInfo<ColorCodeItemRouteArgs> {
  ColorCodeItemRoute({
    required String colorCodeId,
    _i5.Key? key,
    String? parentRouteShortTitle,
  }) : super(
          ColorCodeItemRoute.name,
          path: ':colorCodeId',
          args: ColorCodeItemRouteArgs(
            colorCodeId: colorCodeId,
            key: key,
            parentRouteShortTitle: parentRouteShortTitle,
          ),
        );

  static const String name = 'ColorCodeItemRoute';
}

class ColorCodeItemRouteArgs {
  const ColorCodeItemRouteArgs({
    required this.colorCodeId,
    this.key,
    this.parentRouteShortTitle,
  });

  final String colorCodeId;

  final _i5.Key? key;

  final String? parentRouteShortTitle;

  @override
  String toString() {
    return 'ColorCodeItemRouteArgs{colorCodeId: $colorCodeId, key: $key, parentRouteShortTitle: $parentRouteShortTitle}';
  }
}

/// generated route for
/// [_i1.PostItemEditorView]
class PostItemEditorRoute extends _i3.PageRouteInfo<void> {
  const PostItemEditorRoute()
      : super(
          PostItemEditorRoute.name,
          path: ':postId',
        );

  static const String name = 'PostItemEditorRoute';
}

/// generated route for
/// [_i1.CompareItemView]
class CompareItemRoute extends _i3.PageRouteInfo<CompareItemRouteArgs> {
  CompareItemRoute({
    _i5.Key? key,
    required _i6.ColorItem source,
    required _i6.ColorItem target,
  }) : super(
          CompareItemRoute.name,
          path: ':libraryItemId/compareWith/:targetItemId',
          args: CompareItemRouteArgs(
            key: key,
            source: source,
            target: target,
          ),
        );

  static const String name = 'CompareItemRoute';
}

class CompareItemRouteArgs {
  const CompareItemRouteArgs({
    this.key,
    required this.source,
    required this.target,
  });

  final _i5.Key? key;

  final _i6.ColorItem source;

  final _i6.ColorItem target;

  @override
  String toString() {
    return 'CompareItemRouteArgs{key: $key, source: $source, target: $target}';
  }
}

/// generated route for
/// [_i1.ContentView]
class ContentRoute extends _i3.PageRouteInfo<void> {
  const ContentRoute()
      : super(
          ContentRoute.name,
          path: '',
        );

  static const String name = 'ContentRoute';
}

/// generated route for
/// [_i1.UserView]
class UserRoute extends _i3.PageRouteInfo<void> {
  const UserRoute()
      : super(
          UserRoute.name,
          path: '',
        );

  static const String name = 'UserRoute';
}

/// generated route for
/// [_i1.SettingsView]
class SettingsRoute extends _i3.PageRouteInfo<void> {
  const SettingsRoute()
      : super(
          SettingsRoute.name,
          path: 'settings',
        );

  static const String name = 'SettingsRoute';
}
