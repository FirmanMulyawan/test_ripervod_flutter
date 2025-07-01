import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:flutter/foundation.dart';

import '../api/models/error_response.dart';
import '../config/app_const.dart';
import 'network_response_interceptor.dart';

class Network {
  static Dio dioClient([String? url]) {
    BaseOptions options = BaseOptions(
      // receiveDataWhenStatusError: true,
      connectTimeout: const Duration(minutes: 1), // 30
      receiveTimeout: const Duration(seconds: 120), // 30
      sendTimeout: const Duration(seconds: 120), // 30
      baseUrl: url ?? AppConst.appUrl,
    );
    final Dio dio = Dio(options);
    if (kDebugMode) {
      dio.interceptors.add(LogInterceptor(
          responseBody: true, requestBody: true, requestHeader: true));
    }
    dio.interceptors.add(NetworkResponseInterceptor());
    // dio.interceptors.add(GenerateCInterceptor());

    // AuthorizationInterceptor
    dio.interceptors.add(AuthorizationInterceptor());

    return dio;
  }

  static ErrorResponse? parseErrorResponse(dynamic responseData) {
    ErrorResponse? errorResponse;
    if (responseData is String) {
      if (responseData.isNotEmpty) {
        final String errorString = responseData;
        try {
          errorResponse = ErrorResponse.fromJson(jsonDecode(errorString));
        } catch (_) {
          final Map<String, dynamic> dataMap = {
            'innerMessage': "Server return error status",
            'message': "Server Error",
            'code': 405,
            'payload': null
          };
          errorResponse = ErrorResponse.fromJson(dataMap);
        }
      } else {
        final Map<String, dynamic> dataMap = {
          'innerMessage': "error",
          'message': "undefined error ",
          'code': 405,
          'payload': null
        };
        errorResponse = ErrorResponse.fromJson(dataMap);
      }
    }
    if (responseData is Map<String, dynamic>) {
      final Map<String, dynamic> dataMap = responseData;
      errorResponse = ErrorResponse.fromJson(dataMap);
    }

    return errorResponse;
  }
}

class AuthorizationInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers["Content-Type"] = "application/json";

    handler.next(options); // continue with the request
  }
}

class UnauthorizedException implements Exception {}

class AppDioException extends DioException {
  final ErrorResponse errorResponse;

  AppDioException({
    required this.errorResponse,
    required super.requestOptions,
  });

  @override
  String toString() {
    return errorResponse.message ?? super.toString();
  }
}
