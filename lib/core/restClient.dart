import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

class RestClient {
  final Dio dio;

  RestClient(String baseUrl, bool enableCache)
      : dio = Dio(
    BaseOptions(
        connectTimeout: 5000, receiveTimeout: 60000, baseUrl: baseUrl),
  ) {
    if (enableCache)
      dio.interceptors.add(
        DioCacheManager(
          CacheConfig(baseUrl: baseUrl),
        ).interceptor,
      );
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
      options.headers['Authorization'] = GetIt.instance.get(instanceName:'token');
      return options;
    }, onResponse: (Response response) async {
      // Do something with response src.data
      return response; // continue
    }, onError: (DioError e) async {
      // Do something with response error
      return e; //continue
    }));
  }

  Future<T> request<T>(Future<Response> request,
      [T Function(dynamic) convert]) async {
    try {
      final response = await request;
      print("-=-=-=-=-=-##########################################");
      if (convert == null) return response.data;
      return convert(response.data);
    } catch (e) {
      return Future.error(_handleError(e));
    }
  }

  String _handleError(error) {
    String errorDescription = "";
    if (error is DioError) {
      return error.message;

      switch (error.type) {
        case DioErrorType.CANCEL:
          errorDescription = "Request to API server was cancelled";
          break;
        case DioErrorType.CONNECT_TIMEOUT:
          errorDescription = "Connection timeout with API server";
          break;
        case DioErrorType.DEFAULT:
          errorDescription =
          "Connection to server failed due to internet connection";
          break;
        case DioErrorType.RECEIVE_TIMEOUT:
          errorDescription = "Receive timeout in connection with API server";
          break;
        case DioErrorType.RESPONSE:
          try {
            errorDescription = error.response.data['error']['message'];
            print(errorDescription);
          } catch (e) {
            errorDescription =
            "Received invalid status code: ${error.response.statusCode}";
          }
          break;
        case DioErrorType.SEND_TIMEOUT:
          errorDescription = "Send timeout with API server";
          break;
      }
    } else {
      if (error is Error) {
        debugPrintStack(stackTrace: error.stackTrace);
      }
      errorDescription = error.toString();
    }
    return errorDescription;
  }
}
