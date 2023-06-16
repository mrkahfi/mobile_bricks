import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:{{ packageName }}/src/data/models/responses/example_response.dart';
import 'package:{{ packageName }}/src/data/models/responses/item_response.dart';
import 'package:{{ packageName }}/src/data/services/remote/config/config.dart';
import 'package:{{ packageName }}/src/utils/delay.dart';

class ExampleApi {
  const ExampleApi();

  // const ExampleApi(this._dioClient);

  // final DioClient _dioClient;

  Future<ApiResponse<List<ItemResponse>>> getItems() async {
    try {
      // // Real response should be this
      // Uncomment if no more mocking
      // await _dioClient.get(Endpoint.items);

      // This is to mock how the items fetched from server
      await delay();

      final json = await rootBundle.loadString('assets/jsons/example.json');
      final response =
          ExampleResponse.fromJson(jsonDecode(json) as Map<String, dynamic>);

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

final exampleApiProvider = Provider<ExampleApi>((ref) {
  // return ExampleApi(ref.read(dioClientProvider));
  return const ExampleApi();
});
