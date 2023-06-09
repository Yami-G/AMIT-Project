import 'package:amit_course1/Provider/local_storage_provider.dart';
import 'package:amit_course1/Service/abstract.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../Service/local_storage.dart';
import '../../shared/resources/images.dart';
import '../Navigat_Screens/navigation_bar_screen.dart';
import '../Sign_Screens/sign_in_screen.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  @override
  void didChangeDependencies() async {
    Future.delayed(const Duration(seconds: 1), () async {
      {
        SharedPrefsLocalStorage(sharedPreferences: ref.read(localStorageProvider).sharedPreferences)
            .restoreData(key: 'user', dataType: DataType.string)
            .then((v) {
          debugPrint('user = $v');
          if (v != null) {
            Navigator.of(context)
                .pushAndRemoveUntil(MaterialPageRoute(builder: (context) => NavigatorScreen()), (route) => false);
          } else {
            Navigator.of(context)
                .pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const SignInScreen()), (route) => false);
          }
        });
      }
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment(0.8, 1),
            colors: [
              Color(0xffca485c),
              Color(0xffe16b5c),
              Color(0xfff39060),
              Color(0xffffb56b),
            ],
          ),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(
              bottom: 100.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IntrinsicHeight(
                  child: Image.asset(
                    fit: BoxFit.fitWidth,
                    Images.talabat,
                    width: 240.w,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
