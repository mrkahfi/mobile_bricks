import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:zog_ui/zog_ui.dart';
import 'package:{{ packageName }}/src/features/main/presentation/main_controller.dart';
import 'package:{{ packageName }}/src/routes/routes.dart';

/// Screen that contains the bottom navigation bar along with the children tabs
class MainScreen extends ConsumerWidget {
  /// Create [MainScreen] object with a key
  const MainScreen({
    required this.child,
    required this.location,
    super.key,
  });

  /// Route for every child for bottomNavigationBar
  final String location;

  /// Represents tabs for bottomNavigationBar
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.dark_mode),
        onPressed: () =>
            ref.read(mainControllerProvider.notifier).toggleThemeMode(),
      ),
      body: child,
      bottomNavigationBar: ZeroNavigationBar(
        items: MainTabRoute.values
            .map(
              (e) => ZeroNavigationBarItem(
                icon: e.icon,
                label: e.label,
              ),
            )
            .toList(),
        activeIndex: MainTabRoute.values
            .indexWhere((element) => element.path == location),
        onTap: (index) => context.go(MainTabRoute.values[index].path),
      ),
    );
  }
}

class ContentScreen extends StatelessWidget {
  const ContentScreen({
    required this.title,
    super.key,
  });
  final String title;

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
