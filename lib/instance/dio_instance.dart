// import 'dart:io';

import 'dart:io';

import 'package:ayoo/config/config.dart';
import 'package:dio/adapter.dart';
// import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:ayoo/model/auth_model.dart';
import 'package:flutter/material.dart';

class DioInstance {
  Dio dio;

  DioInstance({
    int connectTimeout = 30000,
    int receiveTimeout = 30000,
    String url = baseUrl,
  }) {
    //dio default configuration
    var option = BaseOptions(
      baseUrl: url,
      connectTimeout: connectTimeout,
      receiveTimeout: receiveTimeout,
      responseType: ResponseType.plain,
      headers: {"Accept": "application/json"},
    );

    //apply configuration to dio instance
    dio = Dio(option);

    // interceptor for logging (development only)
    // dio.interceptors.add(LogInterceptor(responseBody: false));

    //proxy all connection to local sever for request/response logging (development only)
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.findProxy = (uri) {
        return "PROXY 192.168.3.211:8000";
      };
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
    };
  }

  Dio withAuth({@required AuthModel auth}) {
    dio.options.headers = {
      "Accept": "application/json",
      "Authorization": "Bearer ${auth.token}",
      "User-Id": "${auth.userId}",
      "Content-Type": "application/json"
    };

    return dio;
  }
}
