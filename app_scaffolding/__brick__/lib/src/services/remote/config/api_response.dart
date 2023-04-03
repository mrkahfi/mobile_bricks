// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:{{ packageName }}/src/services/remote/config/network_exceptions.dart';

part 'api_response.freezed.dart';

@freezed
class ApiResponse<T> with _$ApiResponse<T> {
  /// [INFO]
  /// This function is returning when it success, usually call it inside try
  /// of try...catch, so it will be safe to get data from this function.
  const factory ApiResponse.success(T data) = Success<T>;

  /// [INFO]
  /// This function is returning when it failure, usually call it inside catch
  /// of try...catch, so it will be more helpful to get error from try catch.
  const factory ApiResponse.failure(
    NetworkExceptions error,
    StackTrace stackTrace,
  ) = Failure<T>;
}
