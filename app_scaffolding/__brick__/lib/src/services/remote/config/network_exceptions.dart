import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../utils/extensions/string_extension.dart';

part 'network_exceptions.freezed.dart';

@freezed
class NetworkExceptions with _$NetworkExceptions {
  /// [INFO]
  /// This functions are some exceptions that might shows

  /// [TODO]
  /// if some exceptions need to be customize the error message, you can add
  /// parameter [String reason] of the function.
  /// don't forget to build with freezed

  const factory NetworkExceptions.requestCancelled() = RequestCancelled;

  const factory NetworkExceptions.unauthorizedRequest(String reason) =
      UnauthorizedRequest;

  const factory NetworkExceptions.badRequest() = BadRequest;

  const factory NetworkExceptions.notFound(String reason) = NotFound;

  const factory NetworkExceptions.methodNotAllowed() = MethodNotAllowed;

  const factory NetworkExceptions.notAcceptable() = NotAcceptable;

  const factory NetworkExceptions.requestTimeout() = RequestTimeout;

  const factory NetworkExceptions.sendTimeout() = SendTimeout;

  const factory NetworkExceptions.conflict() = Conflict;

  const factory NetworkExceptions.internalServerError() = InternalServerError;

  const factory NetworkExceptions.notImplemented() = NotImplemented;

  const factory NetworkExceptions.serviceUnavailable() = ServiceUnavailable;

  const factory NetworkExceptions.noInternetConnection() = NoInternetConnection;

  const factory NetworkExceptions.formatException() = FormatException;

  const factory NetworkExceptions.unableToProcess() = UnableToProcess;

  const factory NetworkExceptions.defaultError(String error) = DefaultError;

  const factory NetworkExceptions.unexpectedError() = UnexpectedError;

  const factory NetworkExceptions.unProcessableEntity(
    Map<String, dynamic> errors,
  ) = UnProcessableEntity;

  /// [INFO]
  /// This function called in the catch in try...catch, and then get the error
  /// and stacktrace, then in this function, will detect, what Exceptions will
  /// be, and then assign it to the function that we create above.
  static NetworkExceptions getDioException(error, stackTrace) {
    /// [INFO]
    /// use for logging the error, quite helpful in debugging
    log(
      error.toString(),
      stackTrace: stackTrace,
      error: error,
      name: 'NETWORK EXCEPTION',
    );

    if (error is Exception) {
      try {
        /// [INFO]
        /// if the error is DioError, usually comes from Dio Network
        if (error is DioError) {
          switch (error.type) {
            case DioErrorType.cancel:
              return const NetworkExceptions.requestCancelled();
            case DioErrorType.receiveTimeout:
              return const NetworkExceptions.sendTimeout();
            case DioErrorType.sendTimeout:
              return const NetworkExceptions.sendTimeout();
            case DioErrorType.connectTimeout:
              return const NetworkExceptions.requestTimeout();
            case DioErrorType.other:
              return const NetworkExceptions.unexpectedError();

            /// [INFO]
            /// for catch the error response status code
            case DioErrorType.response:
              switch (error.response?.statusCode) {
                case 400:
                case 401:
                case 403:
                  return NetworkExceptions.unauthorizedRequest(
                    '${error.response?.data['error']['message']}',
                  );
                case 404:
                  return NetworkExceptions.notFound(
                    "${error.response?.data['error']['message']}",
                  );
                case 408:
                  return const NetworkExceptions.requestTimeout();

                case 409:
                  return const NetworkExceptions.conflict();
                case 422:
                  return NetworkExceptions.unProcessableEntity(
                    error.response?.data['error']['errors'],
                  );
                case 500:
                  return const NetworkExceptions.internalServerError();
                case 503:
                  return const NetworkExceptions.serviceUnavailable();
                default:
                  return NetworkExceptions.defaultError(
                    "${error.response?.data['error']['message']}",
                  );
              }
          }
        } else if (error is SocketException) {
          /// [INFO]
          /// for catch the no internet connection exception
          return const NetworkExceptions.noInternetConnection();
        } else {
          return const NetworkExceptions.unexpectedError();
        }
      } on FormatException {
        return const NetworkExceptions.formatException();
      } catch (_) {
        return const NetworkExceptions.unexpectedError();
      }
    } else {
      if (error.toString().contains("is not a subtype of")) {
        return const NetworkExceptions.unableToProcess();
      } else {
        return const NetworkExceptions.unexpectedError();
      }
    }
  }

  /// [INFO]
  /// This function called in the catch in controller, to show readable message
  /// from server that user can read, and then get the error. after we know
  /// what type of [NetworkExceptions], then we show it.
  static String getErrorMessage(NetworkExceptions error) {
    return error.when(
      notImplemented: () {
        return "Not Implemented".hardcoded;
      },
      requestCancelled: () {
        return "Request Cancelled".hardcoded;
      },
      internalServerError: () {
        return "Internal Server Error".hardcoded;
      },
      notFound: (String reason) {
        return reason;
      },
      serviceUnavailable: () {
        return "Service unavailable".hardcoded;
      },
      methodNotAllowed: () {
        return "Method Not Allowed".hardcoded;
      },
      badRequest: () {
        return "Bad request".hardcoded;
      },
      unauthorizedRequest: (String reason) {
        /// [INFO] return message from API
        return reason;
      },
      unexpectedError: () {
        return "Unexpected error occurred".hardcoded;
      },
      requestTimeout: () {
        return "Connection request timeout".hardcoded;
      },
      noInternetConnection: () {
        return "No internet connection".hardcoded;
      },
      conflict: () {
        return "Error due to a conflict".hardcoded;
      },
      sendTimeout: () {
        return "Send timeout in connection with API server".hardcoded;
      },
      unableToProcess: () {
        return "Unable to process the data".hardcoded;
      },
      defaultError: (String error) {
        return error;
      },
      formatException: () {
        return "Unexpected error occurred".hardcoded;
      },
      notAcceptable: () {
        return "Not acceptable".hardcoded;
      },
      unProcessableEntity: (error) {
        return "Un Processable Entity".hardcoded;
      },
    );
  }

  static Map<String, dynamic> getErrors(NetworkExceptions exceptions) {
    return exceptions.maybeWhen(
      unProcessableEntity: (error) {
        return error;
      },
      orElse: () {
        return {};
      },
    );
  }

  /// [INFO]
  /// for get if its unauthorized or not, returning boolean.
  /// actually this is function that maybe we don't call, because of the simpan
  /// project, we have some difficult to detect if its unauthorized or not,
  /// because we are not using redirect in GoRouter.
  ///
  /// and maybe this function we can call it in the GoRouter redirection,
  /// if return true, then we redirect to login, if its not, redirect to home
  static bool? getIsUnauthorizedRequest(NetworkExceptions error) {
    return error.whenOrNull(
      unauthorizedRequest: (reason) {
        return true;
      },
    );
  }
}
