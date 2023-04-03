import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:{{ packageName }}/src/features/main/presentation/main_state.dart';

class MainController extends StateNotifier<MainState> {
  MainController(this.ref) : super(const MainState());

  final Ref ref;
  final PageController _pageController = PageController(initialPage: 0);

  PageController get pageController => _pageController;

  void selectTab(int index) {
    state = state.copyWith(selectedTab: MainTab.values[index]);
    pageController.jumpToPage(index);
  }
}

final mainControllerProvider = StateNotifierProvider<MainController, MainState>(
    (ref) => MainController(ref));
