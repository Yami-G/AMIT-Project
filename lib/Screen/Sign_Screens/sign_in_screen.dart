import 'package:amit_course1/Screen/Sign_Screens/forgot_screen.dart';
import 'package:amit_course1/Screen/Sign_Screens/sign_up_screen.dart';
import 'package:amit_course1/Service/local_storage.dart';
import 'package:amit_course1/widgets/elevation_button.dart';
import 'package:amit_course1/widgets/validation_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../Service/validation_class.dart';
import '../../shared/resources/images.dart';
import '../Navigat_Screens/navigation_bar_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool _status = true;
  late SharedPrefsLocalStorage localStorageData;
  statusValue() {
    _status = !_status;
  }

  @override
  void setState(VoidCallback fn) {
    statusValue();
    super.setState(fn);
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                    obscureText: _status,
                    isShowLeadingIcon: false,
                    isShowPasswordIcon: true,
                    border: const OutlineInputBorder(),
                    isShowLeadingWidget: false,
                    textEditingController: passwordController,
                    showPasswordIcon: _status ? Icons.visibility_off_sharp : Icons.visibility,
                    validation: (v) {
                      if (ValidationTextForm.isValidPassword(v!) && v.isNotEmpty) {
                        return null;
                      } else {
                        return 'not a valid  password ';
                      }
                    },
                    passwordIconOnTap: () {
                      setState(() {});
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
                              builder: (context) => const SignUpScreen(),
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
