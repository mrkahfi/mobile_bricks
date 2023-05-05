import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../domain/entity/{{ entityName.snakeCase() }}.dart';

part '{{ featureName.snakeCase() }}_state.freezed.dart';

@freezed
class {{ featureName.pascalCase() }}State with _${{ featureName.pascalCase() }}State {
  const factory {{ featureName.pascalCase() }}State({
    @Default(AsyncValue.data(null)) AsyncValue<List<{{ entityName.pascalCase() }}>?> value,
  }) = _{{ featureName.pascalCase() }}State;
}
