import 'package:amit_course1/widgets/elevation_button.dart';
import 'package:amit_course1/widgets/validation_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../shared/resources/images.dart';
import '../widgets/profile_text.dart';

class ProfileScreen extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 35.w, right: 35.w, top: 35.h),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(),
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: const [
                          CircleAvatar(
                            backgroundColor: Colors.red,
                            radius: 80,
                            backgroundImage: AssetImage(Images.tiger),
                          ),
                          CircleAvatar(
                            backgroundColor: Colors.green,
                            radius: 20,
                            foregroundImage: AssetImage(Images.thumb),
                          ),
                        ],
                      ),
                      const IntrinsicWidth(
                        child: ListTile(
                          title: Text('mohamed abouassi', textAlign: TextAlign.center),
                          subtitle: Text('Tanta', textAlign: TextAlign.center),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            ProfileText(text: 'Restaurant name'),
            SizedBox(
              height: 10.h,
            ),
            ValidationRow(
              isShowLeadingWidget: false,
              isShowPasswordIcon: false,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              isShowLeadingIcon: false,
              obscureText: false,
              filled: false,
              maxLine: 1,
              labelText: 'mohamed abouassi',
            ),
            SizedBox(
              height: 10.h,
            ),
            ProfileText(text: 'Phone number'),
            SizedBox(
              height: 10.h,
            ),
            ValidationRow(
              isShowLeadingWidget: false,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              isShowPasswordIcon: false,
              isShowLeadingIcon: false,
              obscureText: false,
              filled: false,
              maxLine: 1,
              labelText: '+210207333848',
            ),
            SizedBox(
              height: 10.h,
            ),
            ProfileText(text: 'Address details'),
            SizedBox(
              height: 10.h,
            ),
            ValidationRow(
              isShowLeadingWidget: false,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              isShowPasswordIcon: false,
              isShowLeadingIcon: false,
              obscureText: false,
              filled: false,
              maxLine: 1,
              labelText: 'Tanta',
            ),
            SizedBox(
              height: 5.h,
            ),
            CustomElevatedButton(
              formKey: formKey,
              horizontal: 30.w,
              text: 'Confirm',
              onPressed: () {
                if (formKey.currentState!.validate()) {}
              },
            ),
          ],
        ),
      ),
    );
  }
}
