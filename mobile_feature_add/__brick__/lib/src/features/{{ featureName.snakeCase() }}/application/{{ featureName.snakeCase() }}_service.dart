
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../src/data/services/remote/config/api_response.dart';
import '../../../../src/domain/entities/item.dart';

class {{ featureName.pascalCase() }}Service {
  {{ featureName.pascalCase() }}Service();


  Future<ApiResponse<List<Item>>> doSomething() async {
    return const ApiResponse.success([]);
  }
}


final {{ featureName.camelCase() }}ServiceProvider = Provider<{{ featureName.pascalCase() }}Service>((ref) {
  return {{ featureName.pascalCase() }}Service();
});
