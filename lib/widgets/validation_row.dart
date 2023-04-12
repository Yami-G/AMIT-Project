import 'package:flutter/material.dart';

class ValidationRow extends StatelessWidget {
  bool filled;
  int maxLine;
  Color? color;
  double? width;
  IconData? icon;
  int? textLength;
  String? hintText;
  String? labelText;
  String? helperText;
  InputBorder? border;
  TextInputType? textType;
  bool obscureText = false;
  bool isShowLeadingWidget;
  Function(String?)? onSave;
  IconData? showPasswordIcon;
  Function()? passwordIconOnTap;
  bool isShowLeadingIcon = false;
  bool isShowPasswordIcon = false;
  Widget? widget = const SizedBox();
  String? Function(String?)? validation;
  TextEditingController? textEditingController;

  ValidationRow({
    super.key,
    this.icon,
    this.color,
    this.width,
    this.widget,
    this.onSave,
    this.border,
    this.textType,
    this.hintText,
    this.labelText,
    this.textLength,
    this.helperText,
    this.validation,
    this.showPasswordIcon,
    this.passwordIconOnTap,
    this.textEditingController,
    required this.isShowLeadingWidget,
    required this.isShowPasswordIcon,
    required this.isShowLeadingIcon,
    required this.obscureText,
    required this.filled,
    required this.maxLine,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        isShowLeadingWidget ? widget! : const SizedBox(),
        SizedBox(
          width: width,
        ),
        Expanded(
          child: IntrinsicHeight(
            child: TextFormField(
              onSaved: onSave,
              maxLines: maxLine,
              validator: validation,
              maxLength: textLength,
              keyboardType: textType,
              obscureText: obscureText,
              controller: textEditingController,
              decoration: InputDecoration(
                border: border,
                filled: filled,
                iconColor: color,
                hintText: hintText,
                labelText: labelText,
                helperText: helperText,
                fillColor: Colors.grey.withOpacity(0.1),
                labelStyle: const TextStyle(color: Colors.black),
                icon: isShowLeadingIcon ? Icon(icon) : null,
                suffixIcon: isShowPasswordIcon
                    ? InkWell(onTap: passwordIconOnTap, child: Icon(showPasswordIcon))
                    : const SizedBox(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
