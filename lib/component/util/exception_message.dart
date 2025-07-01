import 'package:dio/dio.dart';

String normalizeException(e) {
  if (e is DioException && e.response != null && e.response?.data is Map) {
    var message = e.response?.data?['message'];
    {
      final title = e.response?.data?['title'];
      final traceId = e.response?.data?['traceId'];
      message ??= '$title (trace id $traceId)';
    }
    message ??= e.toString();
    return message;
  } else {
    return e.toString();
  }
}
