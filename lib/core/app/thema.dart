
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Thema {

  static ThemeData getThema(){

    return ThemeData(
      colorScheme: const ColorScheme(
        primary: Color(0xFF1565C0),
        secondary: Color(0xFF64B5F6),
        surface: Colors.white,
        background: Colors.white,
        error: Colors.red,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: Colors.white,
        onBackground: Colors.white,
        onError: Colors.red,
        brightness: Brightness.light,
      ),
      textTheme: GoogleFonts.mochiyPopOneTextTheme(),
      scaffoldBackgroundColor: Colors.black87
    );
  }
}