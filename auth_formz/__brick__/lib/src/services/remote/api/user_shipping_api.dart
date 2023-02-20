import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kickavenue/src/features/application.dart';
import 'package:kickavenue/src/services/services.dart';

class UserShippingApi {
  final DioClient _dioClient;

  UserShippingApi(this._dioClient);

  Future<Result<List<AddressResponse>>> getUserShippingList() async {
    try {
      final response = await _dioClient.get(Endpoint.addresses);
      return Result.success((response['data'] as List)
          .map((e) => AddressResponse.fromJson(e))
          .toList());
    } catch (e, st) {
      return Result.failure(
        NetworkExceptions.getDioException(e, st),
        st,
      );
    }
  }

  Future<Result<AddressResponse>> createUserShipping(
    AddressRequest request,
  ) async {
    try {
      final response = await _dioClient.post(
        Endpoint.addresses,
        data: request.toJson(),
      );
      return Result.success(
        AddressResponse.fromJson(response['data']),
      );
    } catch (e, st) {
      return Result.failure(
        NetworkExceptions.getDioException(e, st),
        st,
      );
    }
  }

  Future<Result<AddressResponse>> updateUserShipping(
    int id,
    AddressRequest request,
  ) async {
    try {
      final response = await _dioClient.put(
        '${Endpoint.addresses}/$id',
        data: request.toJson(),
      );
      return Result.success(
        AddressResponse.fromJson(response['data']),
      );
    } catch (e, st) {
      return Result.failure(
        NetworkExceptions.getDioException(e, st),
        st,
      );
    }
  }

  Future<Result<void>> archiveUserShipping(int id) async {
    try {
      await _dioClient.delete('${Endpoint.addresses}/$id');
      return const Result.success(null);
    } catch (e, st) {
      return Result.failure(
        NetworkExceptions.getDioException(e, st),
        st,
      );
    }
  }
}

final userShippingApiProvider = Provider<UserShippingApi>((ref) {
  return UserShippingApi(ref.read(dioClientProvider));
});
