import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../shared/resources/images.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Padding(
        padding: EdgeInsets.only(top: 25.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              fit: StackFit.loose,
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.red,
                  radius: 80.r,
                  backgroundImage: const AssetImage(Images.tiger),
                ),
                CircleAvatar(
                  backgroundColor: Colors.green,
                  radius: 20.r,
                  backgroundImage: const AssetImage(Images.thumb),
                ),
              ],
            ),
            ListTile(
              title: Text(
                'mohamed abouassi',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
              ),
              subtitle: Text(
                'Tanta',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
              ),
            ),
            ListTile(
              title: Text(
                'Logout',
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
              ),
              iconColor: Colors.black,
              leading: const Icon(Icons.logout),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
