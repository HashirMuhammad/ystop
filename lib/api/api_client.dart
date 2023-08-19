import 'dart:convert';
import 'package:dio/dio.dart';
import '../core/app/app_logs.dart';
import '../core/app/app_preferences.dart';
import '../views/login/model/login_model.dart';
import 'api_interceptor.dart';

 

class ApiClient {
  late String _baseUrl;
  late Dio httpClient;
  Map<String, dynamic> environment;
  ApiClient({
    required this.environment,
  }) {
    _baseUrl = environment['base_url'];
    httpClient = Dio(BaseOptions(baseUrl: _baseUrl,connectTimeout: 60 * 1000,receiveTimeout: 90 * 1000,followRedirects: true));
    // httpClient = Dio(BaseOptions(baseUrl: _baseUrl));
    
    httpClient.interceptors.addAll({
      AppInterceptors(httpClient, environment),
    });

  }

  Future<dynamic> apiClientRequest2({  required String endPoint, required String method,String? body }) async {
    try{
         LoginModel? storedLoginModel = AppPreferences.getAuthenticationData();
          

        final options = Options(headers: {
        'Authorization': 'Bearer ${storedLoginModel?.result?.accessToken}', // Add the authToken to the request headers
      },
      followRedirects: true);


      AppLogger.log('$endPoint baseUrl[$method]: ${_baseUrl + endPoint}');
      // ignore: always_specify_types
      Response? response;
      if (method == 'POST') {
        AppLogger.log('$endPoint body[$method]: ${jsonEncode(body)}');
        response = await httpClient.post(
          _baseUrl + endPoint,
          data: body,
          options: options
        );
      } else {
        AppLogger.log('$endPoint params[$method]: ${_baseUrl + endPoint}');
          response = await httpClient.get(
          _baseUrl + endPoint,
          options: options, // Pass the headers in the options
        );
      }
      if (response.statusCode == 200) {
        AppLogger.log('$endPoint response[$method]: ${jsonEncode(response.data)}');
       // if (response.data['success']) {
          return response.data;
      //  } else {
      //    throw Exception(response.data['errorMessage']);
      //  }
      } else {
        throw Exception(response.statusMessage);
      }
    }catch(e){
      throw Exception(e);
    }
  }

  Future<dynamic> apiClientRequest({  required String endPoint, required String method, Map<String, dynamic>? body }) async {
    try{
      //    LoginModel? storedLoginModel = AppPreferences.getAuthenticationData();
          

      //   final options = Options(headers: {
      //   'Authorization': 'Bearer ${storedLoginModel?.result?.accessToken}', // Add the authToken to the request headers
      // });


      AppLogger.log('$endPoint baseUrl[$method]: ${_baseUrl + endPoint}');
      // ignore: always_specify_types
      Response? response;
      if (method == 'POST') {
        AppLogger.log('$endPoint body[$method]: ${jsonEncode(body)}');
        response = await httpClient.post(
          _baseUrl + endPoint,
          data: body,
        //  options: options
        );
      } else {
        AppLogger.log('$endPoint params[$method]: ${_baseUrl + endPoint}');
          response = await httpClient.get(
          _baseUrl + endPoint,
    //      options: options, // Pass the headers in the options
        );
      }
      if (response.statusCode == 200) {
        AppLogger.log('$endPoint response[$method]: ${jsonEncode(response.data)}');
       // if (response.data['success']) {
          return response.data;
      //  } else {
      //    throw Exception(response.data['errorMessage']);
      //  }
      } else {
        throw Exception(response.statusMessage);
      }
    }catch(e){
      throw Exception(e);
    }
  }

  Future<dynamic> apiClientRequestWithFile({
    required String endPoint,
    required Map<String, dynamic> body,
    Function(int, int)? onSendProgress,
  }) async {
    try{
      AppLogger.log('$endPoint baseUrl[POST{form_data}]: ${_baseUrl + endPoint}');
      AppLogger.log('$endPoint body[POST{form_data}]: $body');
      final FormData formData = FormData.fromMap(body);
      // ignore: always_specify_types
      Response? response = await httpClient.post(
        _baseUrl + endPoint,
        data: formData,
        onSendProgress: onSendProgress
      );
      if (response.statusCode == 200) {
        AppLogger.log('$endPoint response[POST{form_data}]: ${response.data}');
        if (response.data['success']) {
          return response.data;
        } else {
          throw Exception(response.data['errorMessage']);
        }
      } else {
        throw Exception(response.statusMessage);
      }
    }catch(e){
      throw Exception(e);
    }
  }

  void close(){
    httpClient.close(force: true);
    AppLogger.log('Http Closed');
    // httpClient.close();
  }

}
