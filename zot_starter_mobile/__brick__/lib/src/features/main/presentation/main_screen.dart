import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zog_ui/zog_ui.dart';
import 'package:zot_starter/src/features/main/presentation/main_state.dart';
import 'package:zot_starter/src/features/main/presentation/home/home_screen.dart';
import 'package:zot_starter/src/presentation/app_controller.dart';

import 'main_controller.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageController =
        ref.watch(mainControllerProvider.notifier).pageController;
    final MainTab selectedTab = ref.watch(mainControllerProvider).selectedTab;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: const Icon(
            Icons.dark_mode,
          ),
          onPressed: () =>
              ref.read(appControllerProvider.notifier).toggleThemeMode()),
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          const HomeScreen(),
          ContentScreen(title: MainTab.tab2.label),
          ContentScreen(title: MainTab.tab3.label),
          ContentScreen(title: MainTab.tab4.label),
          ContentScreen(title: MainTab.tab5.label),
        ],
      ),
      bottomNavigationBar: ZeroNavigationBar(
        items: MainTab.values
            .map((e) => ZeroNavigationBarItem(icon: e.icon, label: e.label))
            .toList(),
        activeIndex: MainTab.values.indexOf(selectedTab),
        onTap: (index) =>
            ref.read(mainControllerProvider.notifier).selectTab(index),
      ),
    );
  }
}

class ContentScreen extends StatelessWidget {
  final String title;

  const ContentScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ZeroAppBar(
        title: Text(title),
      ),
      body: Center(child: ZeroText.body1(title)),
    );
  }
}
