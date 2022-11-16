import 'package:auto_route/auto_route.dart';

import '../routes/routes.dart';

extension ExtendedTabsRouter on TabsRouter {
  StackRouter get libraryRouter {
    final router = innerRouterOf<StackRouter>(LibraryRouter.name);
    if (router == null) throw Exception();
    return router;
  }

  StackRouter get contentRouter {
    final router = innerRouterOf<StackRouter>(ContentRouter.name);
    if (router == null) throw Exception();
    return router;
  }

  StackRouter get postsRouter {
    final router = innerRouterOf<StackRouter>(PostsRouter.name);
    if (router == null) throw Exception();
    return router;
  }

  StackRouter get userRouter {
    final router = innerRouterOf<StackRouter>(UserRouter.name);
    if (router == null) throw Exception();
    return router;
  }
}
