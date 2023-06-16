import 'package:freezed_annotation/freezed_annotation.dart';

part 'item_request.freezed.dart';
part 'item_request.g.dart';

/// Raw object representating the request payload
@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
@freezed
class ItemRequest with _$ItemRequest {
  factory ItemRequest({
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
  }) = _ItemRequest;
}
