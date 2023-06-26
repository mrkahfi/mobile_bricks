import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:{{ packageName }}/src/data/repositories/auth_repository.dart';
import 'package:{{ packageName }}/src/features/main/presentation/home/home_screen.dart';
import 'package:{{ packageName }}/src/features/presentations.dart';
import 'package:{{ packageName }}/src/utils/dynamic_link/dynamic_link_notifier.dart';
import 'package:{{ packageName }}/src/utils/extensions/string_extension.dart';

// It is better to split the route into smal chunks based on their focused area
// or based on feature modules
part '_auth.dart';
part '_deeplink_handler.dart';
part '_go_router_refresh_stream.dart';
part '_main.dart';

enum Routes {
  signin,
  main;

  String get path {
    if (this == main) return '/';
    return '/${name.toKebabCase}';
  }
}

enum MainTabRoute {
  tab1,
  tab2,
  tab3,
  tab4,
  tab5,
  ;

  String get path {
    return '/${name.toKebabCase}';
  }

  Widget get icon {
    switch (this) {
      case tab1:
        return const Icon(Icons.home);
      case tab2:
        return const Icon(Icons.list);
      case tab3:
        return const Icon(Icons.search);
      case tab4:
        return const Icon(Icons.history);
      case tab5:
        return const Icon(Icons.person);
    }
  }

  String get label {
    return name.toUpperCase();
  }
}

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final Provider<GoRouter> goRouterProvider = Provider<GoRouter>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return GoRouter(
    initialLocation: Routes.main.path,
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    redirect: (context, state) {
      final isLoggedIn = authRepository.currentUser != null;

      if (!isLoggedIn) {
        return Routes.signin.path;
      }

      if (state.location == Routes.main.path) {
        return MainTabRoute.tab1.path;
      }

      return null;
    },
    refreshListenable: GoRouterRefreshStream(authRepository.authStateChanges()),
    routes: [
      _authRoutes,
      _mainRoutes,
    ],
  );
});
