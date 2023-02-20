import 'dart:async';
import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zot_ecommerce/src/app/config/config.dart';
import 'package:zot_ecommerce/src/app/firebase/config/routers.dart';
import 'package:zot_ecommerce/src/app/firebase/config/themes.dart';
import 'package:zot_ecommerce/src/app/firebase/firebase_options.dart';

void main() {
  F.flavor = Flavor.stag;

  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp(
        name: DefaultFirebaseOptions.currentName,
        options: DefaultFirebaseOptions.currentPlatform,
      );
      await EasyLocalization.ensureInitialized();
      runApp(const ProviderScope(child: MyApp()));
    },
    (error, stackTrace) {
      log(error.toString(), error: error, stackTrace: stackTrace);
    },
  );
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
      title: '{{ appName }}',
      theme: AppTheme.defaultTheme,
    );
  }
}
