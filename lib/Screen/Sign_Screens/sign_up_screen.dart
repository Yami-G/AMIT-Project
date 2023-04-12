import 'package:amit_course1/widgets/elevation_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../Service/validation_class.dart';
import '../../widgets/validation_row.dart';
import '../Navigat_Screens/navigation_bar_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController rePasswordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? _password;
  bool _status = true;

  statusValue() {
    _status = !_status;
  }

  @override
  void initState() {
    // LocalStorage();
    super.initState();
  }

  @override
  void setState(VoidCallback fn) {
    statusValue();
    super.setState(fn);
  }

  @override
  void dispose() {
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    passwordController.dispose();
    rePasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text('Sign Up'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                ValidationRow(
                  maxLine: 1,
                  width: 10.w,
                  filled: true,
                  textLength: 14,
                  icon: Icons.phone,
                  obscureText: false,
                  isShowLeadingIcon: true,
                  hintText: '012345678910',
                  isShowPasswordIcon: false,
                  labelText: 'Phone number*',
                  isShowLeadingWidget: false,
                  textType: TextInputType.phone,
                  color: Colors.black.withOpacity(0.5),
                  textEditingController: phoneController,
                  onSave: (v) {},
                  validation: (v) {
                    if ((ValidationTextForm.validatePhoneNumber(v!) == true && v.isNotEmpty) &&
                        (v.startsWith(
                              '010',
                              0,
                            ) ||
                            v.startsWith(
                              '011',
                              0,
                            ) ||
                            v.startsWith(
                              '012',
                              0,
                            ) ||
                            v.startsWith(
                              '015',
                              0,
                            ))) {
                      return null;
                    } else {
                      return 'Enter a valid Number of 14';
                    }
                  },
                ),
                ValidationRow(
                  maxLine: 1,
                  width: 10.w,
                  filled: true,
                  icon: Icons.email,
                  labelText: 'Email',
                  obscureText: false,
                  isShowLeadingIcon: true,
                  isShowPasswordIcon: false,
                  isShowLeadingWidget: false,
                  hintText: 'ab123@gmail.com',
                  color: Colors.black.withOpacity(0.5),
                  textEditingController: emailController,
                  onSave: (v) {},
                  validation: (v) {
                    if ((v!.contains('@gmail.com') ||
                            v.contains('@hotmail.com') ||
                            v.contains('@yahoo.com') ||
                            v.contains('@outlook.com')) &&
                        ValidationTextForm.isValidEmail(v) &&
                        v.isNotEmpty) {
                      return null;
                    } else {
                      return 'Enter a valid email';
                    }
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
                ValidationRow(
                  maxLine: 3,
                  filled: false,
                  obscureText: false,
                  color: Colors.white,
                  hintText: 'Life Story',
                  isShowLeadingIcon: false,
                  isShowPasswordIcon: false,
                  isShowLeadingWidget: false,
                  border: const OutlineInputBorder(),
                  helperText: 'Keep it sh`ort,This is a demo.',
                ),
                SizedBox(
                  height: 5.h,
                ),
                ValidationRow(
                  maxLine: 1,
                  filled: false,
                  hintText: 'Salary',
                  obscureText: false,
                  isShowLeadingIcon: false,
                  isShowPasswordIcon: false,
                  isShowLeadingWidget: false,
                  border: const OutlineInputBorder(),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Column(
                  children: [
                    ValidationRow(
                      maxLine: 1,
                      filled: true,
                      textLength: 8,
                      obscureText: _status,
                      labelText: 'Password*',
                      isShowLeadingIcon: false,
                      isShowPasswordIcon: true,
                      isShowLeadingWidget: false,
                      textEditingController: passwordController,
                      showPasswordIcon: _status ? Icons.visibility_off_sharp : Icons.visibility,
                      onSave: (v) {},
                      validation: (v) {
                        if (ValidationTextForm.isValidPassword(v!) && v.isNotEmpty && v.length < 9) {
                          _password = v;
                          return null;
                        } else {
                          return 'Enter password not less than 8 character and valid';
                        }
                      },
                      passwordIconOnTap: () {
                        setState(() {});
                      },
                    ),
                    ValidationRow(
                      maxLine: 1,
                      filled: true,
                      textLength: 8,
                      obscureText: _status,
                      isShowLeadingIcon: false,
                      isShowPasswordIcon: true,
                      isShowLeadingWidget: false,
                      labelText: 'Re type password*',
                      textEditingController: rePasswordController,
                      showPasswordIcon: _status ? Icons.visibility_off_sharp : Icons.visibility,
                      validation: (v) {
                        if (v == _password) {
                          return null;
                        } else {
                          return 'Password not matched';
                        }
                      },
                      passwordIconOnTap: () {
                        setState(() {});
                      },
                    ),
                  ],
                ),
                CustomElevatedButton(
                  formKey: formKey,
                  text: 'SUBMIT',
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => NavigatorScreen()),
                        (route) => false,
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
