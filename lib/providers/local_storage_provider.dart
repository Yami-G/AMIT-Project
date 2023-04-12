import 'package:amit_course1/Service/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageProvider with ChangeNotifier {
  late SharedPreferences pref;
  void getLocalStorages() async {
    pref = await GetIt.I.get<SharedPrefsLocalStorage>().createOne();
    notifyListeners();
  }
}

final localStorageProviderRef = ChangeNotifierProvider<LocalStorageProvider>((ref) {
  return LocalStorageProvider();
});
