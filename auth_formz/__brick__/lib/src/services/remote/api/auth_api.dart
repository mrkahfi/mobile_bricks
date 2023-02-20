import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kickavenue/src/features/data.dart';
import 'package:kickavenue/src/services/services.dart';

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
  Future<Result<String>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dioClient.post(
        Endpoint.login,
        data: {
          'email': email,
          'password': password,
        },
      );
      return Result.success(response['data']['token']);
    } catch (e, st) {
      return Result.failure(
        NetworkExceptions.getDioException(e, st),
        st,
      );
    }
  }

  /// [INFO]
  /// @POST(Endpoints.register)
  /// @Data(
  ///   String email (required)
  ///   String typed_email (required)
  ///   String password (required)
  /// )
  /// @Return(String token)
  Future<Result<String>> register({
    required String email,
    required String typedEmail,
    required String password,
  }) async {
    try {
      final response = await _dioClient.post(
        Endpoint.register,
        data: {
          'email': email,
          'typed_email': typedEmail,
          'password': password,
        },
      );
      return Result.success(response['data']['token']);
    } catch (e, st) {
      return Result.failure(
        NetworkExceptions.getDioException(e, st),
        st,
      );
    }
  }

  /// [INFO]
  /// @GET(Endpoints.profile)
  /// @Return(UserResponse user)
  Future<Result<UserResponse>> profile() async {
    try {
      final response = await _dioClient.get(Endpoint.profile);
      return Result.success(UserResponse.fromJson(response['data']));
    } catch (e, st) {
      return Result.failure(
        NetworkExceptions.getDioException(e, st),
        st,
      );
    }
  }

  Future<Result<void>> logout() async {
    return const Result.success(null);
  }

  Future<Result<void>> forgotPassword({required String email}) async {
    try {
      await _dioClient.post(
        Endpoint.forgotPassword,
        data: {
          'email': email,
        },
      );
      return const Result.success(null);
    } catch (error, stackTrace) {
      return Result.failure(
          NetworkExceptions.getDioException(error, stackTrace), stackTrace);
    }
  }

  Future<Result<void>> sendVerificationLink() async {
    try {
      await _dioClient.put(Endpoint.verificationLink);
      return const Result.success(null);
    } catch (error, stackTrace) {
      return Result.failure(
          NetworkExceptions.getDioException(error, stackTrace), stackTrace);
    }
  }

  Future<Result<String>> uploadAsset({
    required String name,
    required String filePath,
  }) async {
    try {
      File file = File(filePath);

      String fileName = filePath.split('/').last;
      final formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(
          file.path,
          filename: fileName,
        ),
        "name": name,
      });

      final response = await _dioClient.post(
        Endpoint.uploadAsset,
        data: formData,
      );
      return Result.success(response['data']['url']);
    } catch (e, st) {
      return Result.failure(
        NetworkExceptions.getDioException(e, st),
        st,
      );
    }
  }

  Future<Result<UserResponse>> editProfilePicture({
    required String email,
    required String firstName,
    required String familyName,
    required String birthedAt,
    required String sex,
    required int sellerLocationId,
    required String? imgUrl,
  }) async {
    try {
      final response = await _dioClient.put(
        Endpoint.editProfilePicture,
        data: {
          'email': email,
          'first_name': firstName,
          'family_name': familyName,
          'birthed_at': birthedAt,
          'sex': sex,
          'seller_location_id': sellerLocationId,
          'img_url': imgUrl,
        },
      );
      return Result.success(UserResponse.fromJson(response['data']));
    } catch (e, st) {
      return Result.failure(
        NetworkExceptions.getDioException(e, st),
        st,
      );
    }
  }
}

final authApiProvider = Provider<AuthApi>((ref) {
  return AuthApi(ref.read(dioClientProvider));
});
