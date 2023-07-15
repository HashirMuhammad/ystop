import 'package:get_storage/get_storage.dart';

class AppPreferences {
  static const String authenticationDataKey = 'authentication_data';
  static const String apiTokenKey = 'api_token';

  static final GetStorage _preferences = GetStorage();

  static Future<void> removeAuthenticationData() async {
    await _preferences.remove(authenticationDataKey);
  }

  static Future<void> removeApiToken() async {
    await _preferences.remove(apiTokenKey);
  }

  static String get getApiToken {
    return _preferences.read(apiTokenKey) ?? '';
  }
}
