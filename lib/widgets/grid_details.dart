import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GridDetails extends StatelessWidget {
  String mealName;
  String mealPrice;
  String mealRate;
  String mealTime;
  GridDetails({
    super.key,
    required this.mealName,
    required this.mealPrice,
    required this.mealRate,
    required this.mealTime,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 5.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(mealName),
          SizedBox(
            height: 5.h,
          ),
          Text('\$$mealPrice'),
          SizedBox(
            height: 5.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(mealRate),
                  const Icon(
                    Icons.star,
                    color: Colors.yellow,
                    size: 16,
                  ),
                ],
              ),
              const Text('|'),
              Row(
                children: [
                  const Icon(
                    Icons.watch_later_outlined,
                    size: 16,
                  ),
                  Text(mealTime),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
