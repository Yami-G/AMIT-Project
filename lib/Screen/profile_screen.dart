import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 25.h),
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: const [
                      CircleAvatar(
                        backgroundColor: Colors.red,
                        radius: 80,
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.green,
                        radius: 20,
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
      ],
    );
  }
}
