import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Service/validation_class.dart';
import '../widgets/validation_row.dart';
import 'home_screen.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? _phoneNumber;
  String? _email;
  String? _password;
  bool _status = true;

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
        backgroundColor: Colors.indigo,
        title: const Text('Text fields'),
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
                  textLength: 14,
                  textType: TextInputType.phone,
                  obscureText: false,
                  filled: true,
                  isShowWidget: true,
                  icon: Icons.phone,
                  color: Colors.black.withOpacity(0.5),
                  width: 10.w,
                  labelText: 'Phone number*',
                  hintText: '012345678910',
                  textEditingController: phoneController,
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
                  onSave: (v) => _phoneNumber = v!,
                  isShowPasswordIcon: false,
                ),
                ValidationRow(
                  maxLine: 1,
                  obscureText: false,
                  filled: true,
                  isShowWidget: true,
                  isShowPasswordIcon: false,
                  icon: Icons.email,
                  color: Colors.black.withOpacity(0.5),
                  width: 10.w,
                  labelText: 'Email',
                  hintText: 'ab123@gmail.com',
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
                      return 'Enter a valid email';
                    }
                  },
                  onSave: (v) => _email = v!,
                ),
                SizedBox(
                  height: 20.h,
                ),
                ValidationRow(
                  filled: false,
                  obscureText: false,
                  maxLine: 3,
                  isShowPasswordIcon: false,
                  isShowWidget: false,
                  hintText: 'Life Story',
                  border: const OutlineInputBorder(),
                  color: Colors.white,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.w, top: 5.h, bottom: 10.h),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Keep it short,This is a demo.',
                      style: TextStyle(color: Colors.black.withOpacity(0.4)),
                    ),
                  ),
                ),
                ValidationRow(
                  maxLine: 1,
                  obscureText: false,
                  isShowPasswordIcon: false,
                  hintText: 'Salary',
                  isShowWidget: false,
                  border: const OutlineInputBorder(),
                  filled: false,
                ),
                SizedBox(
                  height: 15.h,
                ),
                Column(
                  children: [
                    ValidationRow(
                      maxLine: 1,
                      textLength: 8,
                      obscureText: _status,
                      filled: true,
                      passwordIconOnTap: () {
                        setState(() {});
                      },
                      isShowWidget: false,
                      showPasswordIcon: _status ? Icons.visibility_off_sharp : Icons.visibility,
                      isShowPasswordIcon: true,
                      labelText: 'Password*',
                      textEditingController: passwordController,
                      validation: (v) {
                        if (ValidationTextForm.isValidPassword(v!) && v.isNotEmpty && v.length < 9) {
                          _password = v;
                          return null;
                        } else {
                          return 'Enter password not less than and more than 8 character and valid';
                        }
                      },
                      onSave: (v) => _password = v!,
                    ),
                    ValidationRow(
                      maxLine: 1,
                      textLength: 8,
                      obscureText: _status,
                      filled: true,
                      passwordIconOnTap: () {
                        setState(() {});
                      },
                      showPasswordIcon: _status ? Icons.visibility_off_sharp : Icons.visibility,
                      isShowWidget: false,
                      isShowPasswordIcon: true,
                      labelText: 'Re type password*',
                      textEditingController: rePasswordController,
                      validation: (v) {
                        if (v == _password) {
                          return null;
                        } else {
                          return 'Password not matched';
                        }
                      },
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => HomePage()),
                        (route) => false,
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo),
                  child: const Text('SUBMIT'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
