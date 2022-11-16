import 'package:auto_route/auto_route.dart';

import '../../ui/views/views.dart';
import '../../ui/widgets/widgets.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'View,Route',
  routes: <AutoRoute>[
    AutoRoute(path: '/login', name: 'login', page: LoginView),
    AutoRoute(path: 'error/:errorCode', name: 'error', page: ErrorView),
    CustomRoute(
      path: '/flashlight',
      name: 'flashlight',
      page: FlashlightView,
      fullscreenDialog: true,
      transitionsBuilder: TransitionsBuilders.zoomIn,
    ),
    CustomRoute(
      path: '/onboard',
      name: 'onboard',
      page: OnboardView,
      fullscreenDialog: true,
      transitionsBuilder: TransitionsBuilders.fadeIn,
    ),
    CustomRoute(
      path: '/',
      page: HomeView,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      children: [
        //- Posts
        AutoRoute(
          path: 'posts',
          name: 'PostsRouter',
          page: CupertinoWrapper,
          children: [
            AutoRoute(path: '', page: PostsView),
            AutoRoute(path: ':postId', page: PostItemView),
            RedirectRoute(path: '*', redirectTo: ''),
          ],
        ),
        //- Library
        AutoRoute(
          path: 'library',
          name: 'LibraryRouter',
          page: CupertinoWrapper,
          children: [
            AutoRoute(path: '', page: LibraryView),
            AutoRoute(path: ':libraryItemId', page: LibraryItemView),
            AutoRoute(path: ':collectionId', page: CollectionItemView),
            AutoRoute(path: ':colorCodeId', page: ColorCodeItemView),
            AutoRoute(path: ':postId', page: PostItemEditorView),
            AutoRoute(path: ':libraryItemId/compareWith/:targetItemId', page: CompareItemView),
            RedirectRoute(path: '*', redirectTo: ''),
          ],
        ),
        //- Content
        AutoRoute(
          path: 'content',
          name: 'ContentRouter',
          page: CupertinoWrapper,
          children: [
            AutoRoute(path: '', page: ContentView),
            AutoRoute(path: ':collectionId', page: CollectionItemView),
            AutoRoute(path: ':colorCodeId', page: ColorCodeItemView),
            AutoRoute(path: ':postId', page: PostItemEditorView),
            AutoRoute(path: ':libraryItemId', page: LibraryItemView),
            RedirectRoute(path: '*', redirectTo: ''),
          ],
        ),
        //- Account
        AutoRoute(
          path: 'user',
          name: 'UserRouter',
          page: CupertinoWrapper,
          children: [
            AutoRoute(path: '', page: UserView),
            AutoRoute(path: 'settings', page: SettingsView),
            RedirectRoute(path: '*', redirectTo: ''),
          ],
        ),
      ],
    ),
  ],
)
class $AppRouter {}
