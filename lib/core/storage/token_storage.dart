import 'package:fsm_app/core/classbases/user_info_response.dart';

abstract class TokenStorage {
  Future<void> saveToken(String token);
  Future<String> getToken();
  Future<void> deleteToken();
  Future<void> saveRefreshToken(String token);
  Future<String> getRefreshToken();
  Future<void> deleteRefreshToken();
  Future<UserInfoResponse> getUserInfo();
  Future<Map<String, dynamic>> decodeToken(String token);
}
