import 'package:alertas/theme/theme.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.primaryColor.withOpacity(0.15),
      child: Center(
        child: SizedBox(
          height: 20.0,
          width: 20.0,
          child: CircularProgressIndicator(
            strokeWidth: 2.4,
            color: AppTheme.secondaryColor,
          ),
        ),
      ),
    );
  }
}
