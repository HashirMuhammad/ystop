import 'package:dio/dio.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:ystop_mystop/core/app/app_logs.dart';

import '../core/app/app_preferences.dart';


class AppInterceptors extends Interceptor {
  final Dio dio;
  Map<String, dynamic> environment;
  AppInterceptors(this.dio, this.environment);
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    // var accessToken = await TokenRepository().getAccessToken();
    final accessToken = AppPreferences.getApiToken;
    if (accessToken != null && accessToken.isNotEmpty) {
      AppLogger.log(accessToken);
      final DateTime expiryDateTime = JwtDecoder.getExpirationDate(accessToken);
      final DateTime currentDateTime = DateTime.now();
      if(currentDateTime.isAfter(expiryDateTime!)){
        AppLogger.log("expiryDate: $expiryDateTime");
        dio.interceptors.clear();
        await AppPreferences.removeAuthenticationData();
        await AppPreferences.removeApiToken();
       // Get.offAllNamedWhenTokenExpire();
      //  Navigation.offAllNamedWhenTokenExpire();
      }
      // var expiration = await TokenRepository().getAccessTokenRemainingTime();
      // if(expiration.inSeconds < 60) {
      //   dio.interceptors.requestLock.lock();
      //   // Call the refresh endpoint to get a new token
      //     await UserService().refresh().then((response) async {
      //     await TokenRepository().persistAccessToken(response.accessToken);
      //     accessToken = response.accessToken;
      //   }).catchError((error, stackTrace) {
      //     handler.reject(error, true);
      //   }).whenComplete(() => dio.interceptors.requestLock.unlock());
      // }
      options.headers['Authorization'] = 'Bearer $accessToken';
    }
    options.headers['ApiKey'] = environment['api_key'];
    // options.headers['Content-Type'] = "multipart/form-data";
    return handler.next(options);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    switch (err.type) {
      case DioErrorType.connectTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        throw DeadlineExceededException(err.requestOptions);
      case DioErrorType.response:
        switch (err.response?.statusCode) {
          case 400:
            throw BadRequestException(err.requestOptions);
          case 401:
            throw UnauthorizedException(err.requestOptions);
          case 404:
            throw NotFoundException(err.requestOptions);
          case 409:
            throw ConflictException(err.requestOptions);
          case 500:
            throw InternalServerErrorException(err.requestOptions);
        }
        break;
      case DioErrorType.cancel:
        break;
      case DioErrorType.other:
        if(err.message.contains("Connection closed")){
          throw ConnectionClosedException(err.requestOptions);
        } else {
          throw DeadlineExceededException(err.requestOptions);
        }

    }
    return handler.next(err);
  }
}

class BadRequestException extends DioError {
  BadRequestException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Invalid request';
  }
}

class InternalServerErrorException extends DioError {
  InternalServerErrorException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Unknown error occurred, please try again later.';
  }
}

class ConflictException extends DioError {
  ConflictException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Conflict occurred';
  }
}

class UnauthorizedException extends DioError {
  UnauthorizedException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Access denied';
  }
}

class NotFoundException extends DioError {
  NotFoundException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'The requested information could not be found';
  }
}

class NoInternetConnectionException extends DioError {
  NoInternetConnectionException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'No internet connection detected, please try again.';
  }
}

class DeadlineExceededException extends DioError {
  DeadlineExceededException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'The connection has timed out, please try again.';
  }
}
class ConnectionClosedException extends DioError {
  ConnectionClosedException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Connection Closed';
  }
}
