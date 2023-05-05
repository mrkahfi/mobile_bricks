import '../data/models/responses/item_response.dart';
import '../domain/entity/item.dart';
import '../../../../src/services/remote/config/api_response.dart';

/// Mapper is a class responsible to map raw objects retrieved from the API
/// to models acccording to UI needs
class {{ featureNameName.pascalCase() }}Mapper {
  const {{ featureNameName.pascalCase() }}Mapper._();

  static ApiResponse<List<{{ modelName.pascalCase() }}>> map{{ modelName.pascalCase() }}ListResponseTo{{ modelName.pascalCase() }}List(
    ApiResponse<List<{{ modelName.pascalCase() }}Response>> response,
  ) {
    return response.when(
      success: (data) => ApiResponse.success(
        _map{{ modelName.pascalCase() }}ListRespoTo{{ modelName.pascalCase() }}List(data),
      ),
      failure: ApiResponse.failure,
    );
  }

  static List<{{ modelName.pascalCase() }}> _map{{ modelName.pascalCase() }}ListRespoTo{{ modelName.pascalCase() }}List(List<{{ modelName.pascalCase() }}Response> data) {
    return data
        .map(
          (e) => {{ modelName.pascalCase() }}(
          ),
        )
        .toList();
  }
}
