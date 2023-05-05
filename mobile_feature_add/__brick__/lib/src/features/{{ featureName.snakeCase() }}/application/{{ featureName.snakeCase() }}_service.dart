
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/repositories/{{ featureName.snakeCase() }}_repository.dart';
import '../domain/{{ featureName.snakeCase() }}_mapper.dart';
import '../domain/entity/{{ entityName.snakeCase() }}.dart';
import '../../../../src/services/remote/config/api_response.dart';

class {{ featureName.pascalCase() }}Service {
  {{ featureName.pascalCase() }}Service(this._{{ featureName.camelCase() }}Repository);

  final {{ featureName.pascalCase() }}Repository _{{ featureName.camelCase() }}Repository;

  Future<ApiResponse<List<{{ entityName.pascalCase() }}>>> fetch{{ entityName.pascalCase() }}s() async {
    final response = await _{{ featureName.camelCase() }}Repository.fetch{{ modelName.pascalCase() }}s();
    return {{ featureName.pascalCase() }}Mapper.map{{ modelName.pascalCase() }}ListResponseTo{{ entityName.pascalCase() }}List(response);
  }
}

final {{ featureName.camelCase() }}ServiceProvider = Provider<{{ featureName.pascalCase() }}Service>((ref) {
  return {{ featureName.pascalCase() }}Service(
    ref.read({{ featureName.camelCase() }}RepositoryProvider),
  );
});
