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
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text('Forgot password'),
      ),
      body: Center(
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
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Yalla Delivery Restaurant',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 28,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Column(
                  children: [
                    const Text(
                      'Please enter your phone number to send code',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 30),
                      child: ValidationRow(
                        width: 10,
                        maxLine: 1,
                        filled: false,
                        textLength: 11,
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
                          borderRadius: BorderRadius.circular(15),
                        ),
                        widget: CountryCodePicker(
                          onChanged: print,
                          // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                          initialSelection: 'IT',
                          countryFilter: Locales.filter,
                          // flag can be styled with BoxDecoration's `borderRadius` and `shape` fields
                          flagDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
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
    );
  }
}
