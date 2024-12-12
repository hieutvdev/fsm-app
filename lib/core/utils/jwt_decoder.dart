import 'dart:convert';

import 'package:fsm_app/core/classbases/user_info_response.dart';

import '../classbases/token_response.dart';

class JwtDecoder {
  static Map<String, dynamic> decodeToken(String token) {
    final parts = token.split('.');
    if (parts.length != 3) {
      throw Exception('Invalid token');
    }

    final payload = _decodeBase64(parts[1]);
    final payloadMap = json.decode(payload);
    if (payloadMap is! Map<String, dynamic>) {
      throw Exception('Invalid payload');
    }

    return payloadMap;
  }

  static String _decodeBase64(String str) {
    String output = str.replaceAll('-', '+').replaceAll('_', '/');
    switch (output.length % 4) {
      case 0:
        break;
      case 2:
        output += '==';
        break;
      case 3:
        output += '=';
        break;
      default:
        throw Exception('Illegal base64url string!');
    }
    return utf8.decode(base64Url.decode(output));
  }

  static UserInfoResponse getUserDataFromToken(String token) {
    final decodedToken = decodeToken(token);
    return UserInfoResponse(
      id: decodedToken['id'],
      userName: decodedToken['userName'],
      fullName: decodedToken['fullName'],
      avatarUrl: decodedToken['avatarUrl'],
      birthDay: decodedToken['birthDay'],
    );
  }

  static TokenResponse getTokenResponseFromJson(Map<String, dynamic> json) {
    return TokenResponse(
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken'],
    );
  }
}
