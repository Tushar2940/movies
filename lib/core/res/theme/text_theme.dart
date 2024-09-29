import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MTextTheme{
  MTextTheme._();

  static TextTheme lightTextTheme = TextTheme (
    headlineLarge: GoogleFonts.quicksand(fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.black),
    headlineMedium: GoogleFonts.quicksand(fontSize: 24.0, fontWeight: FontWeight.w600, color: Colors.black),
    headlineSmall: GoogleFonts.quicksand(fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.black),
    titleLarge: GoogleFonts.quicksand(fontSize: 16.0, fontWeight: FontWeight.w600, color: Colors.black),
    titleMedium: GoogleFonts.quicksand(fontSize: 16.0, fontWeight: FontWeight.w500, color: Colors.black),
    titleSmall: GoogleFonts.quicksand(fontSize: 16.0, fontWeight: FontWeight.w400, color: Colors.black),
    bodyLarge: GoogleFonts.quicksand(fontSize: 14.0, fontWeight: FontWeight.w500, color: Colors.black),
    bodyMedium: GoogleFonts.quicksand(fontSize: 14.0, fontWeight: FontWeight.normal, color: Colors.black),
    bodySmall: GoogleFonts.quicksand(fontSize: 14.0, fontWeight: FontWeight.w500, color: Colors.black.withOpacity (0.5)),
    labelLarge: GoogleFonts.quicksand(fontSize: 12.0, fontWeight: FontWeight.normal, color: Colors.black),
    labelMedium : GoogleFonts.quicksand(fontSize: 12.0, fontWeight: FontWeight.normal, color: Colors.black.withOpacity(0.5)),
  );

  static TextTheme darkTextTheme = TextTheme (
    headlineLarge: GoogleFonts.quicksand(fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.white),
    headlineMedium: GoogleFonts.quicksand(fontSize: 24.0, fontWeight: FontWeight.w600, color: Colors.white),
    headlineSmall: GoogleFonts.quicksand(fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.white),
    titleLarge: GoogleFonts.quicksand(fontSize: 16.0, fontWeight: FontWeight.w600, color: Colors.white),
    titleMedium: GoogleFonts.quicksand(fontSize: 16.0, fontWeight: FontWeight.w500, color: Colors.white),
    titleSmall: GoogleFonts.quicksand(fontSize: 16.0, fontWeight: FontWeight.w400, color: Colors.white),
    bodyLarge: GoogleFonts.quicksand(fontSize: 14.0, fontWeight: FontWeight.w500, color: Colors.white),
    bodyMedium: GoogleFonts.quicksand(fontSize: 14.0, fontWeight: FontWeight.normal, color: Colors.white),
    bodySmall: GoogleFonts.quicksand(fontSize: 14.0, fontWeight: FontWeight.w500, color: Colors.white.withOpacity (0.5)),
    labelLarge: GoogleFonts.quicksand(fontSize: 12.0, fontWeight: FontWeight.normal, color: Colors.white),
    labelMedium: GoogleFonts.quicksand(fontSize: 12.0, fontWeight: FontWeight.normal, color: Colors. white.withOpacity (0.5)),
  ); // TextTheme
}