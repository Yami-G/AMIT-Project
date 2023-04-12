import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

enum DataType {
  string,
  int,
  double,
  bool,
  stringList,
}

class LocalStorage {
  static final SharedPreferences? _sharedPreferences = SharedPreferences.getInstance() as SharedPreferences?;

  static Future<SharedPreferences?> getInstance() async {
    return _sharedPreferences;
  }

  static getLocalData({required String key, required DataType dataType}) {
    if (dataType == DataType.int) {
      _sharedPreferences?.getInt(key);
    } else if (dataType == DataType.double) {
      _sharedPreferences?.getDouble(key);
    } else if (dataType == DataType.bool) {
      _sharedPreferences?.getBool(key);
    } else if (dataType == DataType.string) {
      _sharedPreferences?.getString(key);
    } else if (dataType == DataType.stringList) {
      _sharedPreferences?.getStringList(key);
    }
  }

  static Future<void> clear() async {
    _sharedPreferences?.clear();
  }

  static Future setLocalData({required String key, required dynamic value, required DataType dataType}) async {
    if (dataType == DataType.int) {
      _sharedPreferences?.setInt(key, value);
    } else if (dataType == DataType.double) {
      _sharedPreferences?.setDouble(key, value);
    } else if (dataType == DataType.bool) {
      _sharedPreferences?.setBool(key, value);
    } else if (dataType == DataType.string) {
      _sharedPreferences?.setString(key, value);
    } else if (dataType == DataType.stringList) {
      _sharedPreferences?.setStringList(key, value);
    }
  }
}
