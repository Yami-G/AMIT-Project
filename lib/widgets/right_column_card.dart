import 'package:amit_course1/widgets/right_text_card.dart';
import 'package:flutter/material.dart';

class RightColumnCard extends StatelessWidget {
  const RightColumnCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        RightTextCard(
          test: ' : رقم الفاتوره',
        ),
        RightTextCard(
          test: ': عدد الطلبات',
        ),
        RightTextCard(
          test: ': السعر',
        ),
        RightTextCard(
          test: ': العموله',
        ),
        RightTextCard(
          test: ': اجمالي المبلغ',
        ),
      ],
    );
  }
}
