import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                ),
                CircleAvatar(
                  backgroundColor: Colors.green,
                  radius: 20.r,
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
                'Order Screen',
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
              ),
              iconColor: Colors.black,
              leading: const Icon(Icons.menu),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text(
                'Profile Screen',
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
              ),
              leading: const Icon(Icons.person),
              iconColor: Colors.black,
              onTap: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
