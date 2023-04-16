import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/left_column_card.dart';
import '../widgets/right_column_card.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) => IntrinsicWidth(
          child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.r)),
            margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 30.w),
            child: Container(
              height: 200.h,
              padding: EdgeInsets.only(top: 30.h, bottom: 30.h, left: 20.w, right: 10.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  LeftColumnCard(),
                  RightColumnCard(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
