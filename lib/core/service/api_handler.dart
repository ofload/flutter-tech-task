
import 'dart:io';

import 'package:dio/dio.dart';

class ApiHandler {
  Dio _dio;


  final baseUrl = "https://lb7u7svcm5.execute-api.ap-southeast-1.amazonaws.com/dev";

  ApiHandler() {


    final options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: 100000,
      receiveTimeout: 100000,
      sendTimeout: 100000,
    );

    if (_dio == null) _dio = Dio(options);

    Map<String, String> headers = {
      Headers.acceptHeader: '*/*',
      HttpHeaders.contentTypeHeader: 'application/json',

    };

    _dio.options.headers = headers;
  }

  Future<Response> get(String url) async {
    return await _dio.get(url);
  }
}

class DioExceptions implements Exception {
  String message;

  DioExceptions.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.cancel:
        message = "Request to server was cancelled.";
        break;
      case DioErrorType.connectTimeout:
      case DioErrorType.receiveTimeout:
      case DioErrorType.sendTimeout:
        message =
        "Connection to server failed. Please check your internet conenction.";
        break;
      case DioErrorType.response:
        switch (dioError.response.statusCode) {
          case 404:
            message = dioError.response.statusCode.toString();
            // dioError.response.data['message'].toString();
            break;
          case 500:
            message = 'An error occured, please try again.';
            break;
          case 400:
          case 409:
            message = dioError.response.data['message'];
            break;
          default:
            message = dioError.response.statusCode.toString();
            break;
        }
        break;
      default:
        message = "Something went wrong, try again.";
        break;
    }
  }

  @override
  String toString() => message;
}
