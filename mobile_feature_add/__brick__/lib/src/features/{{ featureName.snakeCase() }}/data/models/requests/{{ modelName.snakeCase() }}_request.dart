import 'package:freezed_annotation/freezed_annotation.dart';

part '{{ modelName.snakeCase() }}_request.freezed.dart';
part '{{ modelName.snakeCase() }}_request.g.dart';

/// Raw object representating the request payload
@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
@freezed
class {{ modelName.pascalCase() }}Request with _${{ modelName.pascalCase() }}Request {
  factory {{ modelName.pascalCase() }}Request({  @Default(null) int? id }) 
  = _{{ modelName.pascalCase() }}Request;
}
