import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Screen/Navigat_Screens/navigation_bar_screen.dart';

class CustomElevatedButton extends StatelessWidget {
  String text;
  double? horizontal;
  double? vertical;
  void Function()? onPressed;
  CustomElevatedButton({
    super.key,
    required this.formKey,
    this.onPressed,
    this.horizontal,
    this.vertical,
    required this.text,
  });

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(backgroundColor: Colors.amber.shade700),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontal ?? 0, vertical: vertical ?? 0),
        child: Text(text),
      ),
    );
  }
}
