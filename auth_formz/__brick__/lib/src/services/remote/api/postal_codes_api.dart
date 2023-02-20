import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kickavenue/src/features/application.dart';
import 'package:kickavenue/src/services/services.dart';

class PostalCodesApi {
  final DioClient _dioClient;

  PostalCodesApi(this._dioClient);

  Future<Result<List<CountryResponse>>> getCountries() async {
    try {
      final response = await _dioClient.get(Endpoint.countries);
      return Result.success((response['data'] as List)
          .map((e) => CountryResponse.fromJson(e))
          .toList());
    } catch (e, st) {
      return Result.failure(
        NetworkExceptions.getDioException(e, st),
        st,
      );
    }
  }

  Future<Result<List<ProvinceResponse>>> getProvinces({
    required String country,
  }) async {
    try {
      final response = await _dioClient.get(
        Endpoint.province,
        queryParameters: {
          'country': country,
        },
      );
      return Result.success((response['data'] as List)
          .map((e) => ProvinceResponse.fromJson(e))
          .toList());
    } catch (e, st) {
      return Result.failure(
        NetworkExceptions.getDioException(e, st),
        st,
      );
    }
  }

  Future<Result<List<CityResponse>>> getCities({
    required String country,
    required String province,
  }) async {
    try {
      final response = await _dioClient.get(
        Endpoint.city,
        queryParameters: {
          'country': country,
          'province': province,
        },
      );
      return Result.success((response['data'] as List)
          .map((e) => CityResponse.fromJson(e))
          .toList());
    } catch (e, st) {
      return Result.failure(
        NetworkExceptions.getDioException(e, st),
        st,
      );
    }
  }
}

final postalCodesApiProvider = Provider<PostalCodesApi>((ref) {
  return PostalCodesApi(ref.read(dioClientProvider));
});
