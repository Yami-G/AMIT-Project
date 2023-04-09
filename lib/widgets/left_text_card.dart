import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextCard extends StatelessWidget {
  String text;
  TextCard({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.orangeAccent,
        fontWeight: FontWeight.w700,
        fontSize: 18,
      ),
    );
  }
}
