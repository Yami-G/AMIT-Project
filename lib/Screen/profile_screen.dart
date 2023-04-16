import '../widgets/profile_text.dart';
import 'package:flutter/material.dart';
import '../shared/resources/images.dart';
import 'package:amit_course1/widgets/validation_row.dart';
import 'package:amit_course1/widgets/elevation_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                Column(
                  children: [
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        CircleAvatar(
                          backgroundImage: const AssetImage(Images.tiger),
                          backgroundColor: Colors.red,
                          radius: 80.r,
                        ),
                        CircleAvatar(
                          foregroundImage: const AssetImage(Images.thumb),
                          backgroundColor: Colors.green,
                          radius: 20.r,
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
              ],
            ),
            ProfileText(text: 'Restaurant name'),
            SizedBox(
              height: 10.h,
            ),
            ValidationRow(
              labelText: 'mohamed abouassi',
              isShowLeadingWidget: false,
              isShowPasswordIcon: false,
              isShowLeadingIcon: false,
              obscureText: false,
              filled: false,
              maxLine: 1,
            ),
            SizedBox(
              height: 10.h,
            ),
            ProfileText(text: 'Phone number'),
            SizedBox(
              height: 10.h,
            ),
            ValidationRow(
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              labelText: '+210207333848',
              isShowLeadingWidget: false,
              isShowPasswordIcon: false,
              isShowLeadingIcon: false,
              obscureText: false,
              filled: false,
              maxLine: 1,
            ),
            SizedBox(
              height: 10.h,
            ),
            ProfileText(text: 'Address details'),
            SizedBox(
              height: 10.h,
            ),
            ValidationRow(
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              isShowLeadingWidget: false,
              isShowPasswordIcon: false,
              isShowLeadingIcon: false,
              obscureText: false,
              labelText: 'Tanta',
              filled: false,
              maxLine: 1,
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
