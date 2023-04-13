import 'package:amit_course1/widgets/validation_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Navigat_Screens/navigation_bar_screen.dart';

class ForgotScreen extends StatelessWidget {
  ForgotScreen({Key? key}) : super(key: key);
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
                  child: Image.network(
                    'https://upload.wikimedia.org/wikipedia/commons/1/17/Google-flutter-logo.png',
                    width: 235.w,
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
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        widget: Card(
                          child: SizedBox(width: 50, height: 50, child: Text('hi')),
                        ),
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => NavigatorScreen()),
                        (route) => false,
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.amber.shade700),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 45.w),
                    child: const Text('Send'),
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
