import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;

  static Future init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> saveList(
      {required String key, required List<String> list}) async {
    return await sharedPreferences.setStringList(key, list);
  }

  static Future<List<String>?> getList({required String key}) async {
    return sharedPreferences.getStringList(key);
  }

  static Future<bool> saveData(
      {required String key, required dynamic value}) async {
    if (value is String) {
      return await sharedPreferences.setString(key, value);
    } else if (value is int) {
      return await sharedPreferences.setInt(key, value);
    } else if (value is bool) {
      return await sharedPreferences.setBool(key, value);
    } else if (value is double) {
      return await sharedPreferences.setDouble(key, value);
    } else {
      return await sharedPreferences.setString(key, value.toString());
    }
  }

  static dynamic getData({required String key}) {
    return sharedPreferences.get(key);
  }

  static String? getStringData({required String key}) {
    return sharedPreferences.getString(key);
  }

  static Future<bool> removeData({required key}) {
    return sharedPreferences.remove(key);
  }

  static Future<bool> removeAll() {
    return sharedPreferences.clear();
  }

  static bool containsKey(String key) {
    return sharedPreferences.get(key) == null ? false : true;
  }
}
