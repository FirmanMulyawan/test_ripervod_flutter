import 'dart:io';

import 'package:dio/dio.dart';

import '../api/models/error_response.dart';
import '../config/app_const.dart';
import 'network.dart';

class NetworkResponseInterceptor extends Interceptor {
  var isShowDialog = false;

  BaseOptions options = BaseOptions(
    // receiveDataWhenStatusError: true,
    connectTimeout: const Duration(minutes: 1), // 30
    receiveTimeout: const Duration(seconds: 120), // 30
    sendTimeout: const Duration(seconds: 120), // 30
    baseUrl: AppConst.appUrl,
  );

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.error == DioExceptionType.receiveTimeout) {
      return handler.next(
        AppDioException(
          errorResponse: ErrorResponse(
            message: 'Unable to connect to server, please try again later',
          ),
          requestOptions: err.requestOptions,
        ),
      );
    }

    if (err.error == DioExceptionType.connectionTimeout) {
      return handler.next(
        AppDioException(
          errorResponse: ErrorResponse(
            message: 'The Request take too long process, please try again',
          ),
          requestOptions: err.requestOptions,
        ),
      );
    }

    if (err.error is SocketException) {
      return handler.next(
        AppDioException(
          errorResponse: ErrorResponse(
            message:
                'There is no internet connection. Please check your internet connection',
          ),
          requestOptions: err.requestOptions,
        ),
      );
    }

    if (err.response?.statusCode == 401) {
      // final Dio dio = Dio(options);
    }

    final errorResponse = Network.parseErrorResponse(err.response?.data);

    return handler.next(
      errorResponse != null
          ? AppDioException(
              errorResponse: errorResponse, requestOptions: err.requestOptions)
          : err,
    );
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final responseData = response.data;
    if (responseData is Map<String, dynamic>) {
      final alerts = responseData['alerts'];
      if (alerts is Map<String, dynamic>) {
        final statusCode = int.tryParse(alerts['code']) ?? -1;
        final hasError = responseData['error'] == true ||
            (statusCode < 200 && statusCode > 300);
        if (hasError) {
          final errorResponse = Network.parseErrorResponse(responseData);
          if (errorResponse != null) {
            return handler.reject(
              AppDioException(
                errorResponse: errorResponse,
                requestOptions: response.requestOptions,
              ),
            );
          }
        }
      }
    }

    return handler.next(response);
  }
}
