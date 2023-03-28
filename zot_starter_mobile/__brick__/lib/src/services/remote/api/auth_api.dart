import 'package:zot_starter/src/services/remote/config/config.dart';

class AuthApi {
  final DioClient _dioClient;

  AuthApi(this._dioClient);

  /// [INFO]
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
      return ApiResponse.success(response['data']['token']);
    } catch (e, st) {
      return ApiResponse.failure(
        NetworkExceptions.getDioException(e, st),
        st,
      );
    }
  }

  Future<ApiResponse<void>> logout() async {
    return const ApiResponse.success(null);
  }
}
