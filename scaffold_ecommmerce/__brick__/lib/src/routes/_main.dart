part of 'routes.dart';

final _mainRoutes = ShellRoute(
  navigatorKey: _shellNavigatorKey,
  pageBuilder: (context, state, child) {
    log('location: ${state.location}');
    return NoTransitionPage(
      child: MainScreen(
        location: state.location,
        child: child,
      ),
    );
  },
  routes: [
    GoRoute(
      path: Routes.main.path,
      name: Routes.main.name,
      parentNavigatorKey: _shellNavigatorKey,
      pageBuilder: (BuildContext context, GoRouterState state) =>
          const NoTransitionPage(child: HomeScreen()),
    ),
    GoRoute(
      path: MainTabRoute.tab1.path,
      parentNavigatorKey: _shellNavigatorKey,
      pageBuilder: (BuildContext context, GoRouterState state) =>
          const NoTransitionPage(child: HomeScreen()),
    ),
    GoRoute(
      path: MainTabRoute.tab2.path,
      parentNavigatorKey: _shellNavigatorKey,
      pageBuilder: (BuildContext context, GoRouterState state) =>
          NoTransitionPage(
        child: ContentScreen(title: MainTabRoute.tab2.label),
      ),
    ),
    GoRoute(
      path: MainTabRoute.tab3.path,
      parentNavigatorKey: _shellNavigatorKey,
      pageBuilder: (BuildContext context, GoRouterState state) =>
          NoTransitionPage(
        child: ContentScreen(title: MainTabRoute.tab3.label),
      ),
    ),
    GoRoute(
      path: MainTabRoute.tab4.path,
      parentNavigatorKey: _shellNavigatorKey,
      pageBuilder: (BuildContext context, GoRouterState state) =>
          NoTransitionPage(
        child: ContentScreen(title: MainTabRoute.tab4.label),
      ),
    ),
    GoRoute(
      path: MainTabRoute.tab5.path,
      parentNavigatorKey: _shellNavigatorKey,
      pageBuilder: (BuildContext context, GoRouterState state) =>
          NoTransitionPage(
        child: ContentScreen(title: MainTabRoute.tab5.label),
      ),
    ),
  ],
);
