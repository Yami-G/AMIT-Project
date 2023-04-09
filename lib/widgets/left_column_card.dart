import 'package:flutter/material.dart';
import 'left_text_card.dart';

class LeftColumnCard extends StatelessWidget {
  const LeftColumnCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextCard(
          text: 'تتبع الكابتن',
        ),
        TextCard(
          text: 'الغاءالطلب',
        ),
        TextCard(
          text: 'التفاصيل',
        ),
      ],
    );
  }
}
