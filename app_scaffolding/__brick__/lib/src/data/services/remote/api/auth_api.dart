// ignore_for_file: inference_failure_on_function_invocation

import 'package:{{ packageName }}/src/data/services/remote/config/config.dart';

class AuthApi {
  AuthApi(this._dioClient);

  final DioClient _dioClient;

  /// @POST(Endpoints.login)
  /// @Data(
  ///   String email (required)
  ///   String password (required)
  /// )
  /// @Return(String token)
  Future<ApiResponse<String>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dioClient.post(
        Endpoint.signIn,
        data: {
          'email': email,
          'password': password,
        },
      );
      return ApiResponse.success(response as String);
    } on Exception catch (e, st) {
      return ApiResponse.failure(
        NetworkExceptions.getDioException(e, st),
        st,
      );
    } catch (e, st) {
      return ApiResponse.failure(
        NetworkExceptions.getError(e, st),
        st,
      );
    }
  }

  Future<ApiResponse<void>> logout() async {
    return const ApiResponse.success(null);
  }
}
