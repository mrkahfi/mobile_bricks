import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:zog_ui/zog_ui.dart';

import 'package:{{ packageName }}/src/app/config/config.dart';
import 'package:{{ packageName }}/src/app/themes/app_theme.dart';
import 'package:{{ packageName }}/src/constants/constants.dart';
import 'package:{{ packageName }}/src/controllers/app_controller.dart';
import 'package:{{ packageName }}/src/routes/routes.dart';
import 'package:{{ packageName }}/src/utils/dynamic_link/dynamic_link_notifier.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routers = ref.watch(goRouterProvider);
    ref.listen<Uri?>(
      dynamicLinkNotifierProvider,
      (prevUri, currentUri) => handleDeepLink(ref, routers, currentUri),
    );

    return ZeroApp.router(
      routeInformationParser: routers.routeInformationParser,
      routerDelegate: routers.routerDelegate,
      routeInformationProvider: routers.routeInformationProvider,
      localizationsDelegates: context.localizationDelegates,
      title: AppConfig.appName.value,
      theme: AppTheme.light,
      builder: (context, child) {
        final isProdVariant = F.flavor == Flavor.prod;
        return _FlavorBanner(
          show: !isProdVariant,
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
  const _FlavorBanner({required this.show, this.child});

  final Widget? child;
  final bool show;

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