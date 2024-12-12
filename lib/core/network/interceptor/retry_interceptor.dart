import 'dart:async';

import 'package:dio/dio.dart';
import 'package:fsm_app/core/logger/logger.dart';

class RetryInterceptor extends Interceptor {
  final Dio dio;
  final int maxRetries;
  final int retryDelay;

  RetryInterceptor(this.dio, {this.maxRetries = 3, this.retryDelay = 1000});

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    var retries = err.requestOptions.extra['retries'] ?? 0;

    if (retries < maxRetries) {
      retries++;
      err.requestOptions.extra['retries'] = retries;

      AppLogger.info(
          'Retry attempt $retries for request ${err.requestOptions.uri}');

      await Future.delayed(
          Duration(milliseconds: (retryDelay * retries).toInt()));
      try {
        final response = await dio.fetch(err.requestOptions);
        return handler.resolve(response);
      } on DioError catch (e) {
        return handler.next(e);
      }
    }

    AppLogger.error(
        'Max retries reached for request ${err.requestOptions.uri}');
    return super.onError(err, handler);
  }
}
