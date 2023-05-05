import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/responses/{{ modelName.snakeCase() }}_response.dart';
import '../../../../../src/services/api/{{ featureName.snakeCase() }}_api.dart';
import '../../../../services/remote/config/config.dart';

class {{ featureName.pascalCase() }}Repository {
  {{ featureName.pascalCase() }}Repository(this._{{ featureName.camelCase() }}Api);
  final {{ featureName.pascalCase() }}Api _{{ featureName.camelCase() }}Api;

  Future<ApiResponse<List<{{ modelName.pascalCase() }}Response>>> fetch{{ modelName.pascalCase() }}s() async {
    return await _{{ featureName.camelCase() }}Api.get{{ modelName.pascalCase() }}s();
  }
}

final {{ featureName.camelCase() }}RepositoryProvider =
    Provider((ref) => {{ featureName.pascalCase() }}Repository(ref.watch({{ featureName.camelCase() }}ApiProvider)));
