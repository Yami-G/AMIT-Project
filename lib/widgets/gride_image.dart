import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GridImage extends StatelessWidget {
  String imagePath;
  GridImage({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.asset(
        width: double.infinity,
        height: 110.h,
        imagePath,
        fit: BoxFit.cover,
      ),
    );
  }
}
