import 'dart:io';

import 'package:dio/dio.dart';

import 'failure.dart';

class ErrorHandler implements Exception {
  late Failure failure;

  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      failure = _handleError(error);
    } else if (error is SocketException) {
      failure = const NoInternetConnectionFailure();
    } else {
      failure = const UnexpectedFailure();
    }
  }
}

Failure _handleError(DioException dioError) {
  switch (dioError.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
      return const ConnectTimeOutFailure();
    case DioExceptionType.badResponse:
      return _handleResponseError(dioError.response);
    case DioExceptionType.cancel:
      return const CancelRequestFailure();
    case DioExceptionType.unknown:
      return const NoInternetConnectionFailure();
    case DioExceptionType.badCertificate:
      return const BadCertificateFailure();
    case DioExceptionType.connectionError:
      return const ConnectionErrorFailure();
  }
}

Failure _handleResponseError(Response? response) {
  print('responseee : ${response?.data}');
  switch (response?.statusCode) {
    case 400:
      return const BadRequestFailure();
    case 403:
      return NotSubscribedFailure(message: response?.data['message']);
    case 429:
      return TooManyRequestsFailure(message: response?.data['message']);
    case 404:
      return const NotFoundFailure();
    case 500:
      return const ServerFailure();
    default:
      return const UnexpectedFailure();
  }
}
