import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.white,
  backgroundColor: Colors.white,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    unselectedItemColor: Colors.black,
    selectedItemColor: Colors.redAccent,
    elevation: 0,
  ),
  errorColor: Colors.red,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    onPrimary: const Color(0xFFF8F6F4),
    secondary: const Color(0xFF002F49),
    onSecondary: const Color(0xFFF8F6F4),
    tertiary: const Color(0xFF000000),
    onTertiary: const Color(0xFF979491),
  ),
  textTheme: TextTheme(
    headlineLarge: GoogleFonts.openSans(
      fontSize: 24,
      fontWeight: FontWeight.w900,
    ),
    bodySmall: GoogleFonts.quicksand(
      fontSize: 14,
      fontWeight: FontWeight.w700,
    ),
    headlineMedium: GoogleFonts.openSans(
      fontSize: 20,
      color: Colors.black,
      fontWeight: FontWeight.w900,
    ),
  ),
  highlightColor: Colors.transparent,
  splashColor: Colors.transparent,
  appBarTheme: const AppBarTheme(
    color: Colors.white,
    elevation: 0,
  ),
);
