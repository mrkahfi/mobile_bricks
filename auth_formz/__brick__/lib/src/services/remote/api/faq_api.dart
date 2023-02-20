import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kickavenue/src/features/profile/data/response/faq_response.dart';
import 'package:kickavenue/src/services/services.dart';

class FaqApi {
  FaqApi(
    this._dioClient,
  );
  final DioClient _dioClient;

  Future<Result<List<FaqCollectionResponse>>> getFaq() async {
    try {
      final response = await _dioClient.get(Endpoint.faq);

      return Result.success((response['data'] as List)
          .map((e) => FaqCollectionResponse.fromJson(e))
          .toList());
    } catch (e, st) {
      return Result.failure(
        NetworkExceptions.getDioException(e, st),
        st,
      );
    }
  }
}

final faqApiProvider = Provider<FaqApi>((ref) {
  return FaqApi(ref.read(dioClientProvider));
});
