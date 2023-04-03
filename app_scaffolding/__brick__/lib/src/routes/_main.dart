part of 'routes.dart';

final _mainRoutes = GoRoute(
    path: Routes.main.path,
    name: Routes.main.name,
    builder: (BuildContext context, GoRouterState state) => const MainScreen(),
    routes: const []);
