import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zog_ui/zog_ui.dart';
import 'package:{{ packageName }}/src/features/main/presentation/home/home_controller.dart';
import 'package:{{ packageName }}/src/features/main/presentation/home/widgets/some_widget.dart';
import 'package:{{ packageName }}/src/features/main/presentation/main_state.dart';
import 'package:{{ packageName }}/src/utils/extensions/num_extension.dart';
import 'package:{{ packageName }}/src/utils/extensions/widget_extension.dart';

// Any widget or screen having more than 200 lines of code is to be splitted
// into multiple parts
// Private widgets go here
part 'widgets/_content_widget.dart';
part 'widgets/_other_private_widget.dart';
part 'widgets/_skeleton_widget.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(homeControllerProvider).value;
    return Scaffold(
      drawer: ZeroNavigationDrawer(
        style: const ZeroNavigationDrawerStyle(shape: RoundedRectangleBorder()),
        children: [
          _OtherPrivateWidget(),
          const SomeWidget(),
        ],
      ),
      appBar: ZeroAppBar(
        title: Text(MainTab.tab1.label),
        actions: [
          IconButton(
            onPressed: () =>
                ref.read(homeControllerProvider.notifier).fetchItems(),
            icon: const Icon(ZeroIcons.appSync),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(ZeroIcons.bell),
          )
        ],
      ),
      body: items.isLoading
          ? _SkeletonWidget().withDefaultPadding
          : _ContentWidget(),
    );
  }
}
