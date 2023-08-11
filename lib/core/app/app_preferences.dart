import 'package:get_storage/get_storage.dart';
import 'package:ystop_mystop/views/login/model/login_model.dart';

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
 static Future<void> setApiToken(String apiToken) {
    return _preferences.write(apiTokenKey,apiToken);
  }
  static String get getApiToken {
    return _preferences.read(apiTokenKey) ?? '';
  }

  static Future<void> saveAuthenticationData(LoginModel loginModel) async{
    final Map<String, dynamic> jsonData = loginModel.toJson();
    await _preferences.write(authenticationDataKey, jsonData);

  }

static LoginModel? getAuthenticationData() {
  dynamic jsonData = _preferences.read<Map<String, dynamic>>(authenticationDataKey);
  if (jsonData != null) {
    return LoginModel.fromJson(jsonData);
  }
  return null;
}


}
