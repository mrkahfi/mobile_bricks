import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zot_ecommerce/src/config/routers.dart';
import 'package:zot_ecommerce/src/config/themes.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GoRouter routers = ref.watch(goRouterProvider);
    return MaterialApp.router(
      routerConfig: routers,
      debugShowCheckedModeBanner: false,
      title: 'ZOT Ecommerce',
      theme: AppTheme.defaultTheme,
    );
  }
}
