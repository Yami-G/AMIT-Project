import 'package:amit_course1/widgets/validation_row.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Service/validation_class.dart';
import '../../shared/resources/images.dart';
import '../../shared/resources/locales.dart';
import '../../widgets/elevation_button.dart';
import '../Navigat_Screens/navigation_bar_screen.dart';

class ForgotScreen extends StatelessWidget {
  ForgotScreen({Key? key}) : super(key: key);
  final TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IntrinsicHeight(
                      child: Image.asset(
                        Images.talabat,
                        width: 235.w,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    const Text(
                      'Yalla Delivery Restaurant',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 28,
                      ),
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    Column(
                      children: [
                        const Text(
                          'Please enter your phone number to send code',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 30.h),
                          child: ValidationRow(
                            width: 10,
                            maxLine: 1,
                            filled: false,
                            textLength: 11,
                            enabled: true,
                            obscureText: false,
                            isShowLeadingIcon: false,
                            isShowPasswordIcon: false,
                            isShowLeadingWidget: true,
                            textType: TextInputType.phone,
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
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.r),
                            ),
                            widget: CountryCodePicker(
                              onChanged: print,
                              // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                              initialSelection: 'IT',
                              countryFilter: Locales.filter,
                              // flag can be styled with BoxDecoration's `borderRadius` and `shape` fields
                              flagDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.r),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    CustomElevatedButton(
                      formKey: formKey,
                      text: 'Send',
                      horizontal: 45.w,
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
            top: 20.h,
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
