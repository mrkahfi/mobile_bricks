import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../src/features/{{ featureName.snakeCase() }}/data/models/responses/{{ featureName.snakeCase() }}_response.dart';
import '../../../src/features/{{ featureName.snakeCase() }}/data/models/responses/{{ modelName.snakeCase() }}_response.dart';
import '../../services/remote/config/config.dart';


class {{ featureName.pascalCase() }}Api {

  const {{ featureName.pascalCase() }}Api(this._dioClient);

  final DioClient _dioClient;

  Future<ApiResponse<List<{{ modelName.pascalCase() }}Response>>> get{{ modelName.pascalCase() }}s() async {
    try {
      final json = await _dioClient.get('{{ modelName.paramCase }}Endpoint') as String;
      final response =
          {{ featureName.pascalCase() }}Response.fromJson(jsonDecode(json) as Map<String, dynamic>);

      return ApiResponse.success(response.items);
    } on Exception catch (e, st) {
      return ApiResponse.failure(
        NetworkExceptions.getDioException(e, st),
        st,
      );
    } catch (e, st) {
      return ApiResponse.failure(
        NetworkExceptions.getError(e, st),
        st,
      );
    }
  }
}

final {{ featureName.camelCase() }}ApiProvider = Provider<{{ featureName.pascalCase() }}Api>((ref) {
  return {{ featureName.pascalCase() }}Api(ref.read(dioClientProvider));
});
