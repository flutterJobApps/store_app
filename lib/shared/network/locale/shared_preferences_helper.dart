import 'dart:ffi';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static SharedPreferences? pref;

  static init() async {
    pref = await SharedPreferences.getInstance();
  }

  static dynamic setDate(String key, dynamic value) async {
    if (value is String) return await pref!.setString(key, value);
    if (value is int) return await pref!.setInt(key, value);
    if (value is bool) return await pref!.setBool(key, value);
    return await pref!.setDouble(key, value);
  }

  static dynamic getData(String key) {
    return pref?.get(key);
  }
}