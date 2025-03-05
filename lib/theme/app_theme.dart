import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      textTheme: GoogleFonts.poppinsTextTheme(
        ThemeData.light().textTheme.apply(),
      ),
      scaffoldBackgroundColor: Colors.white,
      primaryTextTheme: GoogleFonts.poppinsTextTheme(),
      appBarTheme: AppBarTheme(
        color: Colors.white,
        titleTextStyle: GoogleFonts.poppins(
            fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: GoogleFonts.poppins(color: Colors.grey),
        focusedBorder: const OutlineInputBorder(
          borderSide:
              BorderSide(color: Colors.grey), // Make focus border transparent
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
              color: Colors.grey), // Optional: set a default border color
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          textStyle: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
