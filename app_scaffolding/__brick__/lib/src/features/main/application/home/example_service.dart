import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:{{ packageName }}/src/features/main/data/models/responses/item_response.dart';

import 'package:{{ packageName }}/src/features/main/data/repositories/example_repository.dart';
import 'package:{{ packageName }}/src/features/main/domain/example_mapper.dart';
import 'package:{{ packageName }}/src/features/main/domain/models/item.dart';
import 'package:{{ packageName }}/src/services/remote/config/api_response.dart';

class ExampleService {
  final ExampleRepository _exampleRepository;

  ExampleService(
    this._exampleRepository,
  );

  Future<ApiResponse<List<Item>>> fetchItems() async {
    final ApiResponse<List<ItemResponse>> response =
        await _exampleRepository.fetchItems();
    return ExampleMapper.mapItemListResponseToItemList(response);
  }
}

final exampleServiceProvider = Provider<ExampleService>((ref) {
  return ExampleService(
    ref.read(exampleRepositoryProvider),
  );
});
