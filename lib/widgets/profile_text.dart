import 'package:flutter/material.dart';

class ProfileText extends StatelessWidget {
  String text;
  ProfileText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
      ),
    );
  }
}
