import 'package:alertas/theme/theme.dart';
import 'package:alertas/utils/types.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFieldWidget extends StatelessWidget {
  String labelText;
  String hintText;
  InputType type;
  TextEditingController controller;
  CustomTextFieldWidget({
    required this.hintText,
    required this.labelText,
    required this.type,
    required this.controller,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType:
          type != InputType.text ? TextInputType.number : TextInputType.text,
      maxLength: type == InputType.text
          ? 100
          : type == InputType.dni
              ? 8
              : 9,
      inputFormatters: type != InputType.text
          ? [
              FilteringTextInputFormatter.allow(
                RegExp(r"[0-9]"),
              ),
            ]
          : [],
      style: TextStyle(
        fontSize: 16.0,
        color: AppTheme.primaryColor,
      ),
      decoration: InputDecoration(
        counterText: "",
        labelText: labelText,
        labelStyle: TextStyle(
          fontSize: 16.0,
          color: AppTheme.primaryColor,
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 14.0,
          color: AppTheme.primaryColor,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12.0,
          vertical: 14.0,
        ),
        filled: true,
        fillColor: AppTheme.primaryColor.withOpacity(0.2),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.0),
          borderSide: BorderSide.none,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.0),
          borderSide: BorderSide.none,
        ),
      ),
      validator: (String? value) {
        if (value != null && value.isEmpty) {
          return "Campo obligatorio";
        }
        return null;
      },
    );
  }
}
