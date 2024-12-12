import 'package:fsm_app/core/classbases/user_info_response.dart';
import 'package:fsm_app/core/services/shared_preferences_service.dart';
import 'package:fsm_app/core/storage/token_storage.dart';
import 'package:fsm_app/core/utils/jwt_decoder.dart';

class TokenStorageImpl implements TokenStorage {
  static const String _tokenKey = 'access_token';
  static const String _refreshToken = 'refresh_token';
  late final SharedPreferencesService _sharedPreferencesService;

  TokenStorageImpl(this._sharedPreferencesService);

  @override
  Future<Map<String, dynamic>> decodeToken(String token) async {
    return JwtDecoder.decodeToken(token);
  }

  @override
  Future<void> deleteRefreshToken() async {
    await _sharedPreferencesService.remove(_refreshToken);
  }

  @override
  Future<void> deleteToken() async {
    await _sharedPreferencesService.remove(_tokenKey);
  }

  @override
  Future<String> getRefreshToken() async {
    return await _sharedPreferencesService.getString(_refreshToken) ?? '';
  }

  @override
  Future<String> getToken() async {
    return await _sharedPreferencesService.getString(_tokenKey) ?? '';
  }

  @override
  Future<UserInfoResponse> getUserInfo() async {
    final token = await getToken();
    if (token.isEmpty) {
      throw Exception('Token not found');
    }
    return JwtDecoder.getUserDataFromToken(token);
  }

  @override
  Future<void> saveRefreshToken(String token) async {
    await _sharedPreferencesService.saveString(_refreshToken, token);
  }

  @override
  Future<void> saveToken(String token) async {
    await _sharedPreferencesService.saveString(_tokenKey, token);
  }
}
