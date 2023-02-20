import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kickavenue/src/features/data.dart';
import 'package:kickavenue/src/services/services.dart';

class VoucherApi {
  final DioClient _dioClient;

  VoucherApi(this._dioClient);

  Future<Result<VoucherCollectionResponse>> getAllVoucher(int page) async {
    try {
      final response = await _dioClient.get(
        Endpoint.getAllVoucher,
        queryParameters: {
          "page": page,
        },
      );
      return Result.success(
        VoucherCollectionResponse.fromJson(response['data']),
      );
    } catch (e, st) {
      return Result.failure(
        NetworkExceptions.getDioException(e, st),
        st,
      );
    }
  }

  Future<Result<VoucherCollectionResponse>> getAllHistoryVoucher(int page) async {
    try {
      final response = await _dioClient.get(
        Endpoint.getAllVoucher,
        queryParameters: {
          'status': 'history',
          "page": page,
        },
      );
      return Result.success(
        VoucherCollectionResponse.fromJson(response['data']),
      );
    } catch (e, st) {
      return Result.failure(
        NetworkExceptions.getDioException(e, st),
        st,
      );
    }
  }
}

final voucherApiProvider = Provider<VoucherApi>((ref) {
  return VoucherApi(ref.read(dioClientProvider));
});
