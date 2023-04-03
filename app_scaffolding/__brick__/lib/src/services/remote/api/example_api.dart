import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:{{ packageName }}/src/features/main/data/models/responses/example_response.dart';
import 'package:{{ packageName }}/src/features/main/data/models/responses/item_response.dart';
import 'package:{{ packageName }}/src/services/remote/config/config.dart';

import 'package:{{ packageName }}/src/utils/delay.dart';
import 'package:flutter/services.dart' show rootBundle;

class ExampleApi {
  final DioClient _dioClient;

  const ExampleApi(
    this._dioClient,
  );

  Future<ApiResponse<List<ItemResponse>>> getItems() async {
    try {
      // // Real response should be this
      // Uncomment if no more mocking
      // final response = await _dioClient.get(
      //   Endpoint.items,
      // );

      // This is to mock how the items fetched from server
      await delay(true);
      final String json =
          await rootBundle.loadString('assets/jsons/example.json');
      final ExampleResponse response =
          ExampleResponse.fromJson(jsonDecode(json));

      return ApiResponse.success(response.items);
    } catch (e, st) {
      return ApiResponse.failure(
        NetworkExceptions.getDioException(e, st),
        st,
      );
    }
  }
}

final exampleApiProvider = Provider<ExampleApi>((ref) {
  return ExampleApi(
    ref.read(dioClientProvider),
  );
});
