import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:{{ packageName }}/src/features/main/application/home/example_service.dart';
import 'package:{{ packageName }}/src/features/main/presentation/home/home_state.dart';

class  {{ featureName.pascalCase() }}(Controller extends StateNotifier<HomeState> {
  {{ featureName.pascalCase() }}Controller(this.ref) : super(const HomeState());
  final Ref ref;

  Future<void> fetchItems() async {
    state = state.copyWith(value: const AsyncLoading());
    log('isLoading');
    final response = await ref.read(exampleServiceProvider).fetchItems();

    response.when(
      success: (data) {
        state = state.copyWith(value: AsyncValue.data(data));
      },
      failure: (error, stackTrace) {
        state = state.copyWith(value: AsyncValue.error(error, stackTrace));
      },
    );
  }
}

final  {{ featureName.camelCase() }}ControllerProvider =
    StateNotifierProvider<HomeController, HomeState>((ref) {
  final homeController = HomeController(ref)..fetchItems();
  return homeController;
});
