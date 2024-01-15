import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String AUTH_TOKEN = "auth_token";
const String USER_ID = "user_id";
const String BAL_KEY = "balance_key";

class SessionManager {
  static final SessionManager _instance = SessionManager._internal();

  static SessionManager get instance => _instance;

  SharedPreferences? sharedPreferences;

  // Named private constructor
  SessionManager._internal();

  factory SessionManager() {
    return _instance;
  }

  String get authToken => (sharedPreferences?.getString(AUTH_TOKEN) ?? "");

  set authToken(String value) {
    sharedPreferences?.setString(AUTH_TOKEN, value);
    // Logger().e("Token saved");
    // Logger().e(authToken);
  }

  int? get userId => (sharedPreferences?.getInt(USER_ID) ?? 0);

  set userId(int? value) {
    sharedPreferences?.setInt(USER_ID, value??0);
  }

  double get balance => (sharedPreferences?.getDouble(BAL_KEY) ?? 0.0);

  set balance(double value) {
    sharedPreferences?.setDouble(BAL_KEY, value);
  }

  setString(String value, String key) {
    sharedPreferences?.setString(key, value);
  }

  setInt(int value, String key) {
    sharedPreferences?.setInt(key, value);
  }

  int getInt(String key) {
    return sharedPreferences?.getInt(key) ?? 0;
  }

  String getString(String key) {
    return sharedPreferences?.getString(key) ?? "";
  }

  setBoolean(bool value, String key) {
    sharedPreferences?.setBool(key, value);
  }

  bool getBoolean(String key) {
    return sharedPreferences?.getBool(key) ?? false;
  }

  Future<bool> removeString(String key) async {
    bool response = await sharedPreferences?.remove(key) ?? false;
    return response;
  }

  Future<bool> clearData() async {
    bool response = await sharedPreferences?.clear() ?? false;
    return response;
  }

  clearAllExcept() async {
    List<String> exceptions = [''];
    for (String key in sharedPreferences?.getKeys() ?? []) {
      print("Key::$key");
      if (!exceptions.fold(false,
          (previousValue, element) => previousValue || key.contains(element))) {
        print("Key to delete::$key");
        await sharedPreferences?.remove(key);
      }
    }
  }
}
