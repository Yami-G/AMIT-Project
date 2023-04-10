import 'package:flutter/material.dart';

class ValidationRow extends StatelessWidget {
  bool isShowWidget = false;
  bool obscureText = false;
  bool isShowPasswordIcon = false;
  bool filled;
  int maxLine;
  TextInputType? textType;
  int? textLength;
  IconData? icon;
  InputBorder? border;
  IconData? showPasswordIcon;
  Color? color;
  double? width;
  Function()? passwordIconOnTap;
  TextEditingController? textEditingController;
  String? Function(String?)? validation;
  Function(String?)? onSave;
  String? hintText;
  String? labelText;
  String? helperText;

  ValidationRow({
    super.key,
    this.showPasswordIcon,
    this.textLength,
    this.textType,
    required this.obscureText,
    required this.filled,
    required this.maxLine,
    this.passwordIconOnTap,
    this.border,
    required this.isShowPasswordIcon,
    required this.isShowWidget,
    this.icon,
    this.color,
    this.width,
    this.validation,
    this.textEditingController,
    this.onSave,
    this.hintText,
    this.labelText,
    this.helperText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        isShowWidget ? Icon(icon, color: color) : const SizedBox(),
        SizedBox(
          width: width,
        ),
        Expanded(
          child: IntrinsicHeight(
            child: TextFormField(
              maxLines: maxLine,
              keyboardType: textType,
              maxLength: textLength,
              obscureText: obscureText,
              controller: textEditingController,
              validator: validation,
              onSaved: onSave,
              decoration: InputDecoration(
                suffixIcon: isShowPasswordIcon
                    ? InkWell(onTap: passwordIconOnTap, child: Icon(showPasswordIcon))
                    : const SizedBox(),
                border: border,
                filled: filled,
                fillColor: Colors.grey.withOpacity(0.1),
                hintText: hintText,
                labelText: labelText,
                helperText: helperText,
                labelStyle: const TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
