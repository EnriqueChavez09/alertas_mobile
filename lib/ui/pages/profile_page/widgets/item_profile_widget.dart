import 'package:alertas/theme/theme.dart';
import 'package:flutter/material.dart';

class ItemProfileWidget extends StatelessWidget {
  String text;
  void Function()? onTap;
  IconData icon;

  ItemProfileWidget({
    required this.text,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 16.0,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 5.0,
          horizontal: 10.0,
        ),
        decoration: BoxDecoration(
          color: AppTheme.primaryColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: ListTile(
          leading: Icon(
            icon,
            color: AppTheme.secondaryColor,
          ),
          title: Text(
            text,
            style: TextStyle(
              color: AppTheme.primaryColor,
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
