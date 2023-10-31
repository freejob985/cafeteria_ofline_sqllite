import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {
  static Future<void> setSession(String key, String username) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, username);
  }

  static Future<String?> getSession(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  static Future<void> clearSession(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }
}
