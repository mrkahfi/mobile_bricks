part of 'routes.dart';

final _authRoutes = GoRoute(
  path: Routes.signin.path,
  name: Routes.signin.name,
  builder: (BuildContext context, GoRouterState state) => const SignInScreen(),
);
