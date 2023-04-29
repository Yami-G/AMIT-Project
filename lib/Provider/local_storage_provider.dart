import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageProvider {
  late SharedPreferences sharedPreferences;

  Future<SharedPreferences> makeLocalStorage() async {
    sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences;
  }
}

final localStorageProvider = StateProvider<LocalStorageProvider>((ref) {
  return LocalStorageProvider();
});
