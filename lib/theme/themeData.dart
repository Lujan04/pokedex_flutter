import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
      primary: Colors.white, secondary: Colors.black, tertiary: Colors.black45),
  textTheme: TextTheme(
    headlineLarge: GoogleFonts.orbitron(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    headlineMedium: GoogleFonts.orbitron(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    bodyLarge: GoogleFonts.orbitron(
      fontSize: 15,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    bodyMedium: GoogleFonts.orbitron(
      fontSize: 12,
      color: Colors.white,
    ),
    bodySmall: GoogleFonts.orbitron(
      fontSize: 12,
      color: Colors.black,
    ),
    labelMedium: GoogleFonts.orbitron(
      fontSize: 12,
      color: Colors.redAccent,
    ),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
  ),
  iconTheme: const IconThemeData(
    color: Colors.black,
  ),
);

ThemeData darkmode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
      primary: Colors.black, secondary: Colors.white, tertiary: Colors.black45),
  textTheme: TextTheme(
    headlineLarge: GoogleFonts.orbitron(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headlineMedium: GoogleFonts.orbitron(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    bodyLarge: GoogleFonts.orbitron(
      fontSize: 15,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    bodyMedium: GoogleFonts.orbitron(
      fontSize: 12,
      color: Colors.black,
    ),
    bodySmall: GoogleFonts.orbitron(
      fontSize: 12,
      color: Colors.white,
    ),
    labelMedium: GoogleFonts.orbitron(
      fontSize: 12,
      color: Colors.redAccent,
    ),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.black,
  ),
  iconTheme: const IconThemeData(
    color: Colors.white,
  ),
);
