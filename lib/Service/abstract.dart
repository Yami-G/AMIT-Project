import '../Model/user_model.dart';

enum DataType {
  string,
  int,
  double,
  bool,
  stringList,
}

abstract class AbstractLocalStorage {
  Future<bool> saveData({
    required String key,
    required dynamic value,
    required DataType dataType,
  });

  Future<dynamic> restoreData({
    required String key,
    required DataType dataType,
  });
  Future<LoginData?> restoreUserData({
    required String key,
  });

  Future<bool> clearData();

  Future<bool> clearKey({required key});

  setMethod({
    required DataType dataType,
    required String key,
    required dynamic value,
  });

  getMethod({
    required DataType dataType,
    required String key,
  });
}
