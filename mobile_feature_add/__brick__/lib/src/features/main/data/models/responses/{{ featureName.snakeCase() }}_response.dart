import 'package:freezed_annotation/freezed_annotation.dart';
import '{{ modelName.snakeCase() }}_response.dart';

/// The use of [freezed] must be pragmatical, means not every object
/// should be freezed. If there is no need for all of its generated functions,
/// then it's OK to generate only one or two function by hand, shared schema,
/// or using Json-to-dart converter

/// {{ featureName.pascalCase() }} of the envelope of product items response retrieved from REST API
class {{ featureName.pascalCase() }}Response {
  {{ featureName.pascalCase() }}Response({
    required this.items,
    required this.limit,
    required this.skip,
    required this.total,
  });

  {{ featureName.pascalCase() }}Response.fromJson(Map<String, dynamic> json) {
    total = json['total'] as int;
    skip = json['skip'] as int;
    limit = json['limit'] as int;

    items = [];

    if (!json.containsKey('items')) return;

    if (json['items'] is List<dynamic>) {
      for (final item in (json['items'] as List<dynamic>)) {
        items.add({{ modelName.pascalCase() }}Response.fromJson(item as Map<String, dynamic>));
      }
    }
  }

  /// {{ modelName.pascalCase() }} of responses
  List<{{ modelName.pascalCase() }}Response> items = [];

  /// Total number of items
  int total = 0;

  /// How many item would be skipped
  int skip = 0;

  /// Number of limit
  int limit = 0;
}
