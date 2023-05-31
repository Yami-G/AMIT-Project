// import 'package:shared_preferences/shared_preferences.dart';
// import 'dart:async';
//
// enum DataType {
//   string,
//   int,
//   double,
//   bool,
//   stringList,
// }
//
// class LocalStorage {
//   static final Future<SharedPreferences> _sharedPreferences = SharedPreferences.getInstance();
//
//   static Future<SharedPreferences?> getInstance() async {
//     return _sharedPreferences;
//   }
//
//   Future<bool> saveData({
//     required String key,
//     required dynamic value,
//     required DataType dataType,
//   }) async {
//     return await _tryCatchWrapper(
//       () async {
//         return await setLocalData(key: key, dataType: dataType, value: value);
//       },
//     );
//   }
//
//   static getLocalData({required String key, required DataType dataType}) async {
//     switch (dataType) {
//       case DataType.int:
//         return _sharedPreferences.getInt(key);
//       case DataType.double:
//         return _sharedPreferences.getDouble(key);
//       case DataType.bool:
//         return _sharedPreferences.getBool(key);
//       case DataType.string:
//         return _sharedPreferences.getString(key);
//       case DataType.stringList:
//         return _sharedPreferences.getStringList(key);
//     }
//   }
//
//   Future<bool> clearAll() async {
//     return await _tryCatchWrapper(
//           () async {
//         return await sharedPreferences.clear();
//       },
//     );
//   }
//   static Future<void> clear() async {
//     _sharedPreferences.clear();
//   }
//
//   static Future setLocalData({required String key, required dynamic value, required DataType dataType}) async {
//     switch (dataType) {
//       case DataType.int:
//         return _sharedPreferences.setInt(key, value);
//       case DataType.double:
//         return _sharedPreferences.setDouble(key, value);
//       case DataType.bool:
//         return _sharedPreferences.setBool(key, value);
//       case DataType.string:
//         return _sharedPreferences.setString(key, value);
//       case DataType.stringList:
//         return _sharedPreferences.setStringList(key, value);
//     }
//   }
//
//   Future<T> _tryCatchWrapper<T>(Function body) async {
//     try {
//       return await body();
//     } on Exception catch (e) {
//       throw e.toString();
//     }
//   }
// }
import 'dart:convert';

import 'package:amit_course1/Model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'abstract.dart';

class SharedPrefsLocalStorage implements AbstractLocalStorage {
  late SharedPreferences sharedPreferences;
  SharedPrefsLocalStorage({required this.sharedPreferences});

  @override
  Future<bool> saveData({
    required String key,
    required dynamic value,
    required DataType dataType,
  }) async {
    return await _tryCatchWrapper(
      () async {
        return await setMethod(dataType: dataType, key: key, value: value);
      },
    );
  }

  @override
  Future<dynamic> restoreData({
    required String key,
    required DataType dataType,
  }) async {
    return await _tryCatchWrapper(
      () async {
        return await getMethod(dataType: dataType, key: key);
      },
    );
  }

  @override
  Future<bool> clearData() async {
    return await _tryCatchWrapper(
      () async {
        return await sharedPreferences.clear();
      },
    );
  }

  @override
  Future<bool> clearKey({required key}) async {
    return await _tryCatchWrapper(
      () async {
        return await sharedPreferences.remove(key);
      },
    );
  }

  @override
  setMethod({
    required DataType dataType,
    required String key,
    required dynamic value,
  }) {
    switch (dataType) {
      case DataType.string:
        return sharedPreferences.setString(key, value);
      case DataType.int:
        return sharedPreferences.setInt(key, value);
      case DataType.double:
        return sharedPreferences.setDouble(key, value);
      case DataType.bool:
        return sharedPreferences.setBool(key, value);
      case DataType.stringList:
        return sharedPreferences.setStringList(key, value);
    }
  }

  @override
  getMethod({
    required DataType dataType,
    required String key,
  }) {
    switch (dataType) {
      case DataType.string:
        return sharedPreferences.getString(key);
      case DataType.int:
        return sharedPreferences.getInt(key);
      case DataType.double:
        return sharedPreferences.getDouble(key);
      case DataType.bool:
        return sharedPreferences.getBool(key);
      case DataType.stringList:
        return sharedPreferences.getStringList(key);
    }
  }

  Future<T> _tryCatchWrapper<T>(Function body) async {
    try {
      return await body();
    } on Exception catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<LoginData?> restoreUserData({required String key}) async {
    return await _tryCatchWrapper(
      () async {
        final String? user = await getMethod(dataType: DataType.string, key: key);
        if (user != null) {
          final Map<String, dynamic>? json = jsonDecode(user);
          return LoginData.fromJson(json!);
        } else {
          return null;
        }
      },
    );
  }
}
