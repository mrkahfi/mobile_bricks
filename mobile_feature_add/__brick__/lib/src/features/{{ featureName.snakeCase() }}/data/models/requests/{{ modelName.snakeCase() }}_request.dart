import 'package:freezed_annotation/freezed_annotation.dart';

part '{{ modelName.snakeCase() }}_request.freezed.dart';
part '{{ modelName.snakeCase() }}_request.g.dart';

/// Raw object representating the request payload
@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
@freezed
class ItemRequest with _$ItemRequest {
  factory {{ modelName.pascalCase() }}Request({
  }) = _{{ modelName.pascalCase() }}Request;
}
