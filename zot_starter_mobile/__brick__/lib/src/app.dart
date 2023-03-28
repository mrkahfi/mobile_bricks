import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:zog_ui/zog_ui.dart';

import 'package:zot_starter/src/app/config/config.dart';
import 'package:zot_starter/src/app/themes/app_theme.dart';
import 'package:zot_starter/src/constants/constants.dart';
import 'package:zot_starter/src/presentation/app_controller.dart';
import 'package:zot_starter/src/routes/routes.dart';

class MyApp extends ConsumerStatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  Widget build(BuildContext context) {
    final GoRouter routers = ref.watch(goRouterProvider);

    return ZeroApp.router(
      routeInformationParser: routers.routeInformationParser,
      routerDelegate: routers.routerDelegate,
      routeInformationProvider: routers.routeInformationProvider,
      localizationsDelegates: context.localizationDelegates,
      debugShowCheckedModeBanner: false,
      title: AppConfig.appName.value,
      theme: AppTheme.light,
      builder: (context, child) {
        final isProdVariant = F.flavor == Flavor.prod;
        return _FlavorBanner(
          show: true,
          child: child,
        );
      },
      darkTheme: AppTheme.dark,
      themeMode: ref.watch(appControllerProvider).currentTheme,
      color: ref.watch(appControllerProvider).currentTheme == ThemeMode.light
          ? LightColors.primaryColor
          : DarkColors.primaryColor,
    );
  }
}

class _FlavorBanner extends StatelessWidget {
  final Widget? child;
  final bool show;

  const _FlavorBanner({required this.show, this.child});

  @override
  Widget build(BuildContext context) {
    return show
        ? Banner(
            location: BannerLocation.topEnd,
            message: AppConfig.appBannerName.value,
            color: LightColors.neutralColor[10],
            child: child,
          )
        : Container(
            child: child,
          );
  }
}
