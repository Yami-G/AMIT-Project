import 'package:amit_course1/Screen/Sign_Screens/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../Service/validation_class.dart';
import '../../shared/resources/images.dart';
import '../../widgets/elevation_button.dart';
import '../../widgets/validation_row.dart';
import '../Navigat_Screens/navigation_bar_screen.dart';
import 'forgot_screen.dart';

final showPasswordIn = StateProvider((ref) => true);

class SignInScreen extends HookConsumerWidget {
  const SignInScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController emailController = useTextEditingController();
    final TextEditingController passwordController = useTextEditingController();
    final formKey = useMemoized(() => GlobalKey<FormState>());
    bool status = ref.watch(showPasswordIn);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 25.w,
        ),
        child: Form(
          key: formKey,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IntrinsicHeight(
                    child: Image.asset(
                      fit: BoxFit.fitWidth,
                      Images.talabat,
                      width: 235.w,
                    ),
                  ),
                  SizedBox(
                    height: 35.h,
                  ),
                  ValidationRow(
                    maxLine: 1,
                    filled: true,
                    hintText: 'Email',
                    obscureText: false,
                    isShowLeadingIcon: false,
                    isShowPasswordIcon: false,
                    isShowLeadingWidget: false,
                    border: const OutlineInputBorder(),
                    textEditingController: emailController,
                    validation: (v) {
                      if ((v!.contains('@gmail.com') ||
                              v.contains('@hotmail.com') ||
                              v.contains('@yahoo.com') ||
                              v.contains('@outlook.com')) &&
                          ValidationTextForm.isValidEmail(v) &&
                          v.isNotEmpty) {
                        return null;
                      } else {
                        return 'not a valid email';
                      }
                    },
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  ValidationRow(
                    maxLine: 1,
                    filled: true,
                    hintText: 'Password',
                    obscureText: status,
                    isShowLeadingIcon: false,
                    isShowPasswordIcon: true,
                    border: const OutlineInputBorder(),
                    isShowLeadingWidget: false,
                    textEditingController: passwordController,
                    showPasswordIcon: status ? Icons.visibility_off_sharp : Icons.visibility,
                    validation: (v) {
                      if (ValidationTextForm.isValidPassword(v!) && v.isNotEmpty) {
                        return null;
                      } else {
                        return 'not a valid  password ';
                      }
                    },
                    passwordIconOnTap: () {
                      ref.watch(showPasswordIn.notifier).update((state) => !state);
                    },
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomElevatedButton(
                    formKey: formKey,
                    text: 'Login',
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) => NavigatorScreen()),
                          (route) => false,
                        );
                      }
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => SignUpScreen(),
                            ),
                          );
                        },
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Colors.amber.shade700,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ForgotScreen(),
                            ),
                          );
                        },
                        child: Text(
                          'Forgot Password',
                          style: TextStyle(
                            color: Colors.amber.shade700,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
