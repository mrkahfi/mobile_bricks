import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '{{ featureName.snakeCase() }}_state.freezed.dart';

@freezed
class {{ featureName.pascalCase() }}State with _$ {{ featureName.pascalCase() }}State {
  const factory HomeState({
    @Default(AsyncValue.data(null)) AsyncValue<List<Item>?> value,
  }) = _{{ featureName.pascalCase() }}State;
}
