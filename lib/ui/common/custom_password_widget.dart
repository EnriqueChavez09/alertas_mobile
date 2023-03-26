import 'package:alertas/theme/theme.dart';
import 'package:flutter/material.dart';

class CustomPasswordWidget extends StatefulWidget {
  TextEditingController controller;
  CustomPasswordWidget({
    required this.controller,
  });
  @override
  State<CustomPasswordWidget> createState() => _CustomPasswordWidgetState();
}

class _CustomPasswordWidgetState extends State<CustomPasswordWidget> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.0,
      child: TextFormField(
        controller: widget.controller,
        style: TextStyle(
          fontSize: 16.0,
          color: AppTheme.primaryColor,
        ),
        obscureText: _obscureText,
        decoration: InputDecoration(
          labelText: "Contraseña",
          labelStyle: TextStyle(
            fontSize: 16.0,
            color: AppTheme.primaryColor,
          ),
          hintText: "Ingresa tu contraseña",
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
          suffix: IconButton(
            splashRadius: 25.0,
            onPressed: () {
              _obscureText = !_obscureText;
              setState(() {});
            },
            icon: Icon(
              Icons.remove_red_eye,
              color: AppTheme.primaryColor,
            ),
          ),
        ),
        validator: (String? value) {
          if (value != null && value.isEmpty) {
            return "Campo obligatorio";
          }
          return null;
        },
      ),
    );
  }
}
