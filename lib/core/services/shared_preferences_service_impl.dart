import 'package:fsm_app/core/services/shared_preferences_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesServiceImpl implements SharedPreferencesService {
  final SharedPreferences _preferences;

  SharedPreferencesServiceImpl(this._preferences);

  @override
  Future<void> saveString(String key, String value) async {
    await _preferences.setString(key, value);
  }

  @override
  Future<String?> getString(String key) async {
    return _preferences.getString(key);
  }

  @override
  Future<void> saveInt(String key, int value) async {
    await _preferences.setInt(key, value);
  }

  @override
  Future<int?> getInt(String key) async {
    return _preferences.getInt(key);
  }

  @override
  Future<void> saveBool(String key, bool value) async {
    await _preferences.setBool(key, value);
  }

  @override
  Future<bool> getBool(String key) async {
    return _preferences.getBool(key) ?? false;
  }

  @override
  Future<void> remove(String key) async {
    await _preferences.remove(key);
  }
}
