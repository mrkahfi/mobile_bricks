import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/responses/{{ modelName.snakeCase() }}_response.dart';
import '../../../../../src/services/remote/api/api.dart';
import '../../../../../src/services/remote/config/config.dart';

class {{ featureNameName.pascalCase() }}Repository {
  {{ featureNameName.pascalCase() }}Repository(this._{{ featureNameName.camelCase() }}Api);
  final {{ featureNameName.pascalCase() }}Api _{{ featureNameName.camelCase() }}Api;

  Future<ApiResponse<List<{{ modelName.pascalCase() }}Response>>> fetchItems() {
    return ApiResponse.success([]);
  }
}

final {{ featureNameName.camelCase() }}RepositoryProvider =
    Provider((ref) => {{ featureNameName.pascalCase() }}Repository(ref.watch({{ featureNameName.camelCase() }}ApiProvider)));
