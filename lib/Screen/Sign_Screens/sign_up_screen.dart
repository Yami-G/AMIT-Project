import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../Service/validation_class.dart';
import '../../widgets/elevation_button.dart';
import '../../widgets/validation_row.dart';
import '../Navigat_Screens/navigation_bar_screen.dart';

final showPasswordUp = StateProvider((ref) => true);
final showRePasswordUp = StateProvider((ref) => true);

class SignUpScreen extends HookConsumerWidget {
  SignUpScreen({Key? key}) : super(key: key);

  late String? _password;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController emailController = useTextEditingController();
    final TextEditingController phoneController = useTextEditingController();
    final TextEditingController passwordController = useTextEditingController();
    final TextEditingController rePasswordController = useTextEditingController();
    final formKey = useMemoized(() => GlobalKey<FormState>());
    bool password = ref.watch(showPasswordUp);
    bool rePassword = ref.watch(showRePasswordUp);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.topLeft,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 65.h, left: 15.w, right: 15.w),
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
                          obscureText: password,
                          labelText: 'Password*',
                          isShowLeadingIcon: false,
                          isShowPasswordIcon: true,
                          isShowLeadingWidget: false,
                          textEditingController: passwordController,
                          showPasswordIcon: password ? Icons.visibility_off_sharp : Icons.visibility,
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
                            ref.watch(showPasswordUp.notifier).update((state) => !state);
                          },
                        ),
                        ValidationRow(
                          maxLine: 1,
                          filled: true,
                          textLength: 8,
                          obscureText: rePassword,
                          isShowLeadingIcon: false,
                          isShowPasswordIcon: true,
                          isShowLeadingWidget: false,
                          labelText: 'Re type password*',
                          textEditingController: rePasswordController,
                          showPasswordIcon: rePassword ? Icons.visibility_off_sharp : Icons.visibility,
                          validation: (v) {
                            if (v == _password) {
                              return null;
                            } else {
                              return 'Password not matched';
                            }
                          },
                          passwordIconOnTap: () {
                            ref.watch(showRePasswordUp.notifier).update((state) => !state);
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
          Positioned(
            top: 10,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_new_rounded),
            ),
          )
        ],
      ),
    );
  }
}
