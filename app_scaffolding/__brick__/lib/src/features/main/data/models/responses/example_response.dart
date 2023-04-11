import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:{{ packageName }}/src/features/main/data/models/responses/item_response.dart';

/// The use of [freezed] must be pragmatical, means not every object
/// should be freezed. If there is no need for all of its generated functions,
/// then it's OK to generate only one or two function by hand, shared schema,
/// or using Json-to-dart converter

/// Example of the envelope of product items response retrieved from REST API
class ExampleResponse {
  ExampleResponse({
    required this.items,
    required this.limit,
    required this.skip,
    required this.total,
  });

  ExampleResponse.fromJson(Map<String, dynamic> json) {
    total = json['total'] as int;
    skip = json['skip'] as int;
    limit = json['limit'] as int;

    items = [];

    if (!json.containsKey('items')) return;

    if (json['items'] is List<dynamic>) {
      for (final item in (json['items'] as List<dynamic>)) {
        items.add(ItemResponse.fromJson(item as Map<String, dynamic>));
      }
    }
  }

  /// Item of responses
  List<ItemResponse> items = [];

  /// Total number of items
  int total = 0;

  /// How many item would be skipped
  int skip = 0;

  /// Number of limit
  int limit = 0;
}
