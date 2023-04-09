import 'package:flutter/material.dart';

class RightTextCard extends StatelessWidget {
  String test;
  RightTextCard({
    super.key,
    required this.test,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      test,
      style: TextStyle(
        color: Colors.black.withOpacity(0.5),
        fontWeight: FontWeight.w700,
        fontSize: 14,
      ),
    );
  }
}
