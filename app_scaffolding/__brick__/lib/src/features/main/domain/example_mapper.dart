import 'package:{{ packageName }}/src/features/main/data/models/responses/item_response.dart';
import 'package:{{ packageName }}/src/features/main/domain/models/item.dart';
import 'package:{{ packageName }}/src/services/remote/config/api_response.dart';

/// Mapper is a class responsible to map raw objects retrieved from the API
/// to models acccording to UI needs
class ExampleMapper {
  const ExampleMapper._();

  static ApiResponse<List<Item>> mapItemListResponseToItemList(
    ApiResponse<List<ItemResponse>> response,
  ) {
    return response.when(
      success: (data) => ApiResponse.success(
        _mapItemListRespoToItemList(data),
      ),
      failure: (error, stacktrace) => ApiResponse.failure(error, stacktrace),
    );
  }

  static List<Item> _mapItemListRespoToItemList(List<ItemResponse> data) {
    return data
        .map((e) => Item(
            id: e.id,
            title: e.title,
            description: e.description,
            profileImg: e.images?.first,
            thumbnail: e.thumbnail))
        .toList();
  }
}
