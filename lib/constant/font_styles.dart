import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WriteStyles {
  static TextStyle headerLarge(BuildContext context) {
    return GoogleFonts.poppins(
      color: Theme.of(context).colorScheme.primary,
      fontSize: 32,
      fontWeight: FontWeight.w800,
    );
  }

  static TextStyle headerMedium(BuildContext context) {
    return GoogleFonts.poppins(
      color: Theme.of(context).colorScheme.primary,
      fontSize: 24,
      fontWeight: FontWeight.w800,
    );
  }

  static TextStyle headerSmall(BuildContext context) {
    return GoogleFonts.poppins(
      color: Theme.of(context).colorScheme.primary,
      fontSize: 16,
      fontWeight: FontWeight.w800,
    );
  }

  static TextStyle cardHeader(BuildContext context) {
    return GoogleFonts.poppins(
      color: Theme.of(context).colorScheme.primary,
      fontSize: 20,
      fontWeight: FontWeight.w800,
    );
  }

  static TextStyle cardSubtitle(BuildContext context) {
    return GoogleFonts.poppins(
      color: Theme.of(context).colorScheme.primary,
      fontSize: 14,
      fontWeight: FontWeight.normal,
    );
  }

  static TextStyle hintText(BuildContext context) {
    return GoogleFonts.poppins(
      color: Theme.of(context).colorScheme.primary,
      fontSize: 17,
      fontWeight: FontWeight.normal,
    );
  }

  static TextStyle bodyMedium(BuildContext context) {
    return GoogleFonts.poppins(
      color: Color(0xFF8C8E99),
      fontSize: 14,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle bodySmall(BuildContext context) {
    return GoogleFonts.poppins(
      color: Color(0xFF8C8E99),
      fontSize: 12,
      fontWeight: FontWeight.w400,
    );
  }
}
