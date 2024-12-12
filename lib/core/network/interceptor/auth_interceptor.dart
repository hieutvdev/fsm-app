import 'package:dio/dio.dart';
import 'package:fsm_app/core/services/shared_preferences_service.dart';

class AuthInterceptor extends Interceptor {
  final SharedPreferencesService _sharedPreferencesService;
  final Dio _dio;

  AuthInterceptor(this._sharedPreferencesService, this._dio);
}
