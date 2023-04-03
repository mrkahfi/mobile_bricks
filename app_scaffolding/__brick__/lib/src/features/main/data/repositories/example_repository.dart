import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:{{ packageName }}/src/features/main/data/models/responses/item_response.dart';
import 'package:{{ packageName }}/src/services/remote/api/example_api.dart';
import 'package:{{ packageName }}/src/services/remote/config/config.dart';

class ExampleRepository {
  final ExampleApi _exampleApi;

  ExampleRepository(this._exampleApi);

  /// This just mocks the fetch request from REST API
  Future<ApiResponse<List<ItemResponse>>> fetchItems() {
    return _exampleApi.getItems();
  }
}

final exampleRepositoryProvider =
    Provider((ref) => ExampleRepository(ref.watch(exampleApiProvider)));
