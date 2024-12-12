import 'package:dio/dio.dart';
import 'package:fsm_app/core/logger/logger.dart';
import 'package:fsm_app/core/network/dio_config.dart';

class ApiClient {
  final Dio _dio = DioConfig.createDio();

  Future<Response<T>> get<T>(String path,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final response =
          await _dio.get<T>(path, queryParameters: queryParameters);
      return response;
    } on DioError catch (e) {
      AppLogger.error(e.message ?? "Error");
      rethrow;
    }
  }

  Future<Response<T>> post<T>(String path,
      {dynamic data, Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.post<T>(path,
          data: data, queryParameters: queryParameters);
      return response;
    } on DioError catch (e) {
      AppLogger.error(e.message ?? "Error");
      rethrow;
    }
  }

  Future<Response<T>> delete<T>(String path,
      {dynamic data, Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.delete<T>(path,
          data: data, queryParameters: queryParameters);
      return response;
    } on DioError catch (e) {
      AppLogger.error(e.message ?? "Error");
      rethrow;
    }
  }

  Future<Response<T>> put<T>(String path,
      {dynamic data, Map<String, dynamic>? queryParameters}) async {
    try {
      final response =
          await _dio.put<T>(path, data: data, queryParameters: queryParameters);
      return response;
    } on DioError catch (e) {
      AppLogger.error(e.message ?? "Error");
      rethrow;
    }
  }
}
