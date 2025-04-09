import 'package:dio/dio.dart';

abstract class Failure {
  String errorMessage;
  Failure(this.errorMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errorMessage);

  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout. Please try again.');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Request took too long to send.');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Server response took too long.');
      case DioExceptionType.badCertificate:
        return ServerFailure('Security certificate validation failed.');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(dioError.response!.statusCode!, dioError.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure('Request was cancelled.');
      case DioExceptionType.connectionError:
        return ServerFailure('No internet connection.');
      case DioExceptionType.unknown:
        print(dioError.error);
        return ServerFailure('An unexpected error occurred. Please try again.');
      default:
        return ServerFailure('Something went wrong. Please try again later.');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 403) {
      return ServerFailure('Request denied or unauthorized.');
    } else if (statusCode == 404) {
      return ServerFailure('Requested resource not found.');
    } else if (statusCode == 500) {
      return ServerFailure('Internal server error.');
    } else {
      return ServerFailure('Unexpected error. Please try again later.');
    }
  }
}
