import 'package:dio/dio.dart';
import 'package:fsm_app/core/error/app_exception.dart';
import 'package:fsm_app/core/logger/logger.dart';

class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    AppLogger.info('REQUEST[${options.method}] => PATH: ${options.path}');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    AppLogger.info(
        'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    AppException appException;

    switch (err.type) {
      case DioErrorType.connectionTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        appException = FetchDataException('Connection timeout');
        break;
      case DioErrorType.badResponse:
        switch (err.response?.statusCode) {
          case 400:
            appException = BadRequestException(err.response?.statusMessage);
            break;
          case 401:
            appException = UnauthorizedException(err.response?.statusMessage);
            break;
          case 403:
            appException = ForbiddenException(err.response?.statusMessage);
            break;
          case 404:
            appException = NotFoundException(err.response?.statusMessage);
            break;
          case 409:
            appException = ConflictException(err.response?.statusMessage);
            break;
          case 500:
            appException = InternalServerException(err.response?.statusMessage);
            break;
          default:
            appException = FetchDataException(err.response?.statusMessage);
            break;
        }
        break;
      case DioErrorType.cancel:
        appException = AppException('Request to API server was cancelled');
        break;
      case DioErrorType.unknown:
        appException = AppException(
            'Connection to API server failed due to internet connection');
        break;
      default:
        appException = AppException('Unexpected error occurred');
    }
    AppLogger.error(
        'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    super.onError(err, handler);
  }
}
