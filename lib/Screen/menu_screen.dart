import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../shared/resources/images.dart';
import '../widgets/grid_details.dart';
import '../widgets/gride_image.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        itemCount: 7,
        padding: EdgeInsets.only(top: 30.h, left: 15.w, right: 15.w),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 5.w,
          crossAxisSpacing: 5.h,
        ),
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 3,
                ),
              ],
            ),
            child: Stack(
              children: [
                Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GridImage(imagePath: Images.tiger),
                        GridDetails(
                          mealName: 'Shrimps Arugula',
                          mealPrice: '22.50',
                          mealRate: '4.9',
                          mealTime: '30-35min',
                        ),
                      ],
                    ),
                  ],
                ),
                Positioned(
                  top: 10.h,
                  right: 10.w,
                  child: const CircleAvatar(
                    radius: 18,
                    backgroundColor: Colors.white,
                    child: FaIcon(
                      FontAwesomeIcons.solidHeart,
                      size: 18,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
