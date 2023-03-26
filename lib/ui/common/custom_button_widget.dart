import 'package:alertas/theme/theme.dart';
import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  String title;
  void Function()? onPressed;
  CustomButtonWidget({
    required this.title,
    this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: AppTheme.secondaryColor,
          minimumSize: const Size(
            double.infinity,
            50.0,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.0),
          )),
      onPressed: onPressed,
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18.0,
          color: AppTheme.primaryColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
