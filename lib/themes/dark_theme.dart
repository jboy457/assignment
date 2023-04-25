import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Colors.black,
  backgroundColor: Colors.black,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.black,
    unselectedItemColor: Colors.white,
    selectedItemColor: Colors.redAccent,
    elevation: 0,
  ),
  textTheme: TextTheme(
    headlineLarge: GoogleFonts.lato(
      fontSize: 24,
      fontWeight: FontWeight.w900,
    ),
    headlineMedium: GoogleFonts.lato(
      fontSize: 20,
      color: Colors.white,
      fontWeight: FontWeight.w900,
    ),
    bodySmall: GoogleFonts.lato(
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
  ),
  highlightColor: Colors.transparent,
  splashColor: Colors.transparent,
  appBarTheme: const AppBarTheme(
    color: Colors.black,
    elevation: 0,
  ),
);
