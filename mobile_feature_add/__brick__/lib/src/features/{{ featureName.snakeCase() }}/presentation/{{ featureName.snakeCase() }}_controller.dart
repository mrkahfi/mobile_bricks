

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../application/{{ featureName.snakeCase() }}_service.dart';
import './{{ featureName.snakeCase() }}_state.dart';


class  {{ featureName.pascalCase() }}Controller extends StateNotifier<{{ featureName.pascalCase() }}State> {
  {{ featureName.pascalCase() }}Controller(this.ref) : super(const {{ featureName.pascalCase() }}State());
  final Ref ref;

  Future<void> fetch{{ entityName.pascalCase() }}s() async {
    state = state.copyWith(value: const AsyncLoading());
    
    final response = await ref.read({{ featureName.camelCase() }}ServiceProvider).doSomething();

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
    StateNotifierProvider<{{ featureName.pascalCase() }}Controller, {{ featureName.pascalCase() }}State>((ref) {
  final homeController = {{ featureName.pascalCase() }}Controller(ref)..fetch{{ entityName.pascalCase() }}s();
  return homeController;
});
