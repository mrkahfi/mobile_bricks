import '../data/models/responses/{{ modelName.snakeCase() }}_response.dart';
import '../domain/entity/{{ entityName.snakeCase() }}.dart';
import '../../../services/remote/config/api_response.dart';

/// Mapper is a class responsible to map raw objects retrieved from the API
/// to models acccording to UI needs
class {{ featureName.pascalCase() }}Mapper {
  const {{ featureName.pascalCase() }}Mapper._();

  static ApiResponse<List<{{ entityName.pascalCase() }}>> map{{ modelName.pascalCase() }}ListResponseTo{{ entityName.pascalCase() }}List(
    ApiResponse<List<{{ modelName.pascalCase() }}Response>> response,
  ) {
    return response.when(
      success: (data) =>
          ApiResponse.success(_map{{ modelName.pascalCase() }}ListRespoTo{{ entityName.pascalCase() }}List(data)),
      failure: ApiResponse.failure,
    );
  }

  static List<{{ entityName.pascalCase() }}> _map{{ modelName.pascalCase() }}ListRespoTo{{ entityName.pascalCase() }}List(
      List<{{ modelName.pascalCase() }}Response> data) {
    return data.map((e) => {{ entityName.pascalCase() }}(id: e.id)).toList();
  }
}
