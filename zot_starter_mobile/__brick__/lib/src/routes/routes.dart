import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:go_router/go_router.dart';
import 'package:zot_starter/src/features/auth/presentation/sign_in/sign_in_screen.dart';
import 'package:zot_starter/src/features/main/presentation/main_screen.dart';
import 'package:zot_starter/src/routes/go_router_refresh_stream.dart';
import 'package:zot_starter/src/features/auth/data/auth_repository.dart';

// It is better to split the route into smal chunks based on their focused area
// or based on feature modules
part '_auth.dart';
part '_main.dart';

enum Routes {
  signin,
  main,
  ;

  String get path {
    return '/$name';
  }
}

final Provider<GoRouter> goRouterProvider = Provider<GoRouter>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return GoRouter(
    initialLocation: Routes.signin.path,
    debugLogDiagnostics: true,
    redirect: (context, state) {
      final isLoggedIn = authRepository.currentUser != null;
      if (isLoggedIn) {
        if (state.location == Routes.signin.path) {
          return Routes.main.path;
        }
      }
      return null;
    },
    refreshListenable: GoRouterRefreshStream(authRepository.authStateChanges()),
    routes: <GoRoute>[_authRoutes, _mainRoutes],
  );
});
