import 'package:freezed_annotation/freezed_annotation.dart';

part 'item_response.freezed.dart';
part 'item_response.g.dart';

/// Raw object representation the schema retrieved from server
@JsonSerializable(fieldRename: FieldRename.snake)
@freezed
class ItemResponse with _$ItemResponse {
  factory ItemResponse({
    @Default(null) int? id,
    @Default(null) String? title,
    @Default(null) String? description,
    @Default(null) int? price,
    @Default(null) double? discountPercentage,
    @Default(null) double? rating,
    @Default(null) int? stock,
    @Default(null) String? brand,
    @Default(null) String? category,
    @Default(null) String? thumbnail,
    @Default([]) List<String>? images,
  }) = _ItemResponse;

  factory ItemResponse.fromJson(Map<String, dynamic> json) =>
      _$ItemResponseFromJson(json);
}
