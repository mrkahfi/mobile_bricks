import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kickavenue/src/features/data.dart';
import 'package:kickavenue/src/features/domain.dart';
import 'package:kickavenue/src/services/services.dart';

class ProfileApi {
  final DioClient _dioClient;

  ProfileApi(this._dioClient);

  Future<Result<UserResponse>> updateProfile({
    required ProfilePost profilePost,
  }) async {
    try {
      final response = await _dioClient.put(
        Endpoint.updateProfile,
        data: profilePost.toJson(),
      );
      return Result.success(UserResponse.fromJson(response['data']['user']));
    } catch (e, st) {
      return Result.failure(
        NetworkExceptions.getDioException(e, st),
        st,
      );
    }
  }
}


final profileApiProvider = Provider<ProfileApi>((ref) {
  return ProfileApi(ref.read(dioClientProvider));
});
