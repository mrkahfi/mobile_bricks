import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:{{ packageName }}/src/features/main/data/models/responses/item_response.dart';

/// The use of [freezed] must be pragmatical, means not every object should be freezed
/// If there is no need for all of its generated functions, then it is okay to generate
/// only one or two function by hand, shared schema, or using online Json-to-dart converter

/// Example of the envelope of product items response retrieved from REST API
class ExampleResponse {
  List<ItemResponse> items = [];
  int total = 0;
  int skip = 0;
  int limit = 0;

  ExampleResponse(
      {required this.items,
      required this.total,
      required this.skip,
      required this.limit});

  ExampleResponse.fromJson(Map<String, dynamic> json) {
    items = [];
    if (json['items'] != null) {
      items = <ItemResponse>[];
      json['items'].forEach((v) {
        items.add(ItemResponse.fromJson(v));
      });
    }
    total = json['total'];
    skip = json['skip'];
    limit = json['limit'];
  }
}
