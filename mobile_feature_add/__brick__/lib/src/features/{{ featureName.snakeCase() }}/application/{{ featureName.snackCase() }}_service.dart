import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/repositories/{{ featureNameName.camelCase() }}_repository.dart';
import '../domain/{{ featureNameName.snakeCase() }}_mapper.dart';
import '../domain/entity/{{ entityName.snakeCase() }}.dart';
import '../../../../src/services/remote/config/api_response.dart';

class {{ featureNameName.pascaleCase() }}Service {
  {{ featureNameName.pascaleCase() }}Service(this._{{ featureNameName.camelCase() }}Repository);

  final {{ featureNameName.pascaleCase() }}Repository _{{ featureNameName.camelCase() }}Repository;

  Future<ApiResponse<List<{{ modelName.pascalCase() }}>>> fetch{{ modelName.pascalCase() }}s() async {
    final response = await _{{ featureNameName.camelCase() }}Repository.fetch{{ modelName.pascalCase() }}s();
    return {{ featureNameName.pascaleCase() }}Mapper.map{{ modelName.pascalCase() }}ListResponseTo{{ entityName.pascalCase() }}List(response);
  }
}

final {{ featureNameName.camelCase() }}ServiceProvider = Provider<{{ featureNameName.pascaleCase() }}Service>((ref) {
  return {{ featureNameName.pascaleCase() }}Service(
    ref.read({{ featureNameName.camelCase() }}RepositoryProvider),
  );
});
