import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:zot_ecommerce/src/features/authentication/sign_in/presentation/sign_in_screen.dart';

export 'package:go_router/go_router.dart';

enum Routes { signin }

final Provider<GoRouter> goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/signin',
    debugLogDiagnostics: true,
    redirect: (context, state) async {
      return '/signin';
    },
    routes: <GoRoute>[
      GoRoute(
          path: '/signin',
          name: Routes.signin.name,
          builder: (BuildContext context, GoRouterState state) =>
              const SignInScreen(),
          routes: const []),
    ],
  );
});
