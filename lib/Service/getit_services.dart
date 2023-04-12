import 'package:get_it/get_it.dart';

import 'local_storage.dart';

class GetItServices {
  static configureServices() {
    final i = GetIt.I;
    i.registerSingleton(SharedPrefsLocalStorage());
  }
}
