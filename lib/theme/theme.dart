import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static Color primaryColor = const Color(0xFFFFFFFF);
  static Color secondaryColor = const Color(0xFFFE6902);
  static Color tertiaryColor = const Color(0xFF000000);
  static Color quaternaryColor = const Color(0xFF201F37);
  static Color quintonaryColor = const Color(0xFF2D2C42);
  static Color sextonaryColor = const Color.fromARGB(255, 255, 1, 1);
  static Color backgroundColor = const Color(0xFF29283E);
  static Color fieldColor = const Color(0xFF111111);

  static final ThemeData lightTheme = ThemeData(
    textTheme: GoogleFonts.manropeTextTheme(),
    scaffoldBackgroundColor: backgroundColor,
    appBarTheme: AppBarTheme(
      backgroundColor: backgroundColor,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: quaternaryColor,
    ),
    fontFamily: "Manrope",
  );
}
