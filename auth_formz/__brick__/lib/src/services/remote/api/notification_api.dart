import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kickavenue/src/features/data.dart';
import 'package:kickavenue/src/services/services.dart';

class NotificationApi {
  NotificationApi(
    this._dioClient,
  );
  final DioClient _dioClient;

  Future<Result<NotificationPreferenceCollectionResponse>>
      notificationPreference(int page, String type) async {
    try {
      final response = await _dioClient.get(
        Endpoint.notification,
        queryParameters: {
          "page": page,
          "type": type,
        },
      );

      return Result.success(
        NotificationPreferenceCollectionResponse.fromJson(
          response['data'],
        ),
      );
    } catch (e, st) {
      return Result.failure(
        NetworkExceptions.getDioException(e, st),
        st,
      );
    }
  }

  Future<Result<UpdateNotificationPreferenceResponse>>
      updateNotificationPreference({
    required int id,
    required bool isActive,
  }) async {
    try {
      final response = await _dioClient.post(
        Endpoint.notification,
        data: {
          'notification_id': id,
          'is_active': isActive,
        },
      );
      return Result.success(
        UpdateNotificationPreferenceResponse.fromJson(
          response['data'],
        ),
      );
    } catch (e, st) {
      return Result.failure(
        NetworkExceptions.getDioException(e, st),
        st,
      );
    }
  }
}

final notificationApiProvider = Provider<NotificationApi>((ref) {
  return NotificationApi(ref.read(dioClientProvider));
});
