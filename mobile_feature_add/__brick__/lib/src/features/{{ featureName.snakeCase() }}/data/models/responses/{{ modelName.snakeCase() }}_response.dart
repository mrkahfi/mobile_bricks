// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part '{{ modelName.snakeCase() }}_response.freezed.dart';
part '{{ modelName.snakeCase() }}_response.g.dart';

/// Raw object representation the schema retrieved from server
@freezed
class {{ modelName.pascalCase() }}Response with _${{ modelName.pascalCase() }}Response {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory {{ modelName.pascalCase() }}Response({ @Default(null) int? id }) 
  = _{{ modelName.pascalCase() }}Response;

  factory {{ modelName.pascalCase() }}Response.fromJson(Map<String, dynamic> json) =>
      _${{ modelName.pascalCase() }}ResponseFromJson(json);
}
