import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prideofknowledge/constants/colors.dart';

class OldTextTheme {
  OldTextTheme._();

  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
        fontSize: 36.0,
        fontWeight: FontWeight.bold,
        color: AColors.textPrimary),
    headlineMedium: const TextStyle().copyWith(
        fontSize: 30.0,
        fontWeight: FontWeight.w600,
        color: AColors.textPrimary),
    headlineSmall: const TextStyle().copyWith(
        fontSize: 24.0,
        fontWeight: FontWeight.w600,
        color: AColors.textPrimary),
    titleLarge: const TextStyle().copyWith(
        fontSize: 20.0, fontWeight: FontWeight.w600, color: AColors.dark),
    titleMedium: const TextStyle().copyWith(
        fontSize: 16.0, fontWeight: FontWeight.w500, color: AColors.dark),
    titleSmall: const TextStyle().copyWith(
        fontSize: 16.0, fontWeight: FontWeight.w400, color: AColors.dark),
    bodyLarge: const TextStyle().copyWith(
        fontSize: 14.0, fontWeight: FontWeight.w500, color: AColors.dark),
    bodyMedium: const TextStyle().copyWith(
        fontSize: 13.0, fontWeight: FontWeight.normal, color: AColors.dark),
    bodySmall: const TextStyle().copyWith(
        fontSize: 12.0,
        fontWeight: FontWeight.w500,
        color: AColors.dark.withOpacity(0.5)),
    labelLarge: const TextStyle().copyWith(
        fontSize: 12.0, fontWeight: FontWeight.normal, color: AColors.dark),
    labelMedium: const TextStyle().copyWith(
        fontSize: 12.0,
        fontWeight: FontWeight.normal,
        color: AColors.dark.withOpacity(0.5)),
  );
}

class ATextTheme {
  ATextTheme._();

  // Heading Text

  static TextStyle bigHeading = GoogleFonts.readexPro(
      fontSize: 36, fontWeight: FontWeight.bold, color: AColors.textPrimary);

  static TextStyle mediumHeading = GoogleFonts.readexPro(
      fontSize: 25, fontWeight: FontWeight.bold, color: AColors.textPrimary);

  static TextStyle smallHeading = GoogleFonts.readexPro(
      fontSize: 20, fontWeight: FontWeight.w600, color: AColors.textWhite);

// Subheading Text

  static TextStyle bigSubHeading = GoogleFonts.readexPro(
      fontSize: 18, fontWeight: FontWeight.w600, color: AColors.textPrimary);

// TODO MB change medium color to white

  static TextStyle mediumSubHeading = GoogleFonts.cairo(
      fontSize: 16, fontWeight: FontWeight.w600, color: AColors.textSecondary);

  static TextStyle smallSubHeading = GoogleFonts.readexPro(
      fontSize: 14, fontWeight: FontWeight.w600, color: AColors.textWhite);

// Body Text

  static TextStyle bigBody = GoogleFonts.readexPro(
      fontSize: 12, fontWeight: FontWeight.w500, color: AColors.textWhite);

  static TextStyle smallBody = GoogleFonts.readexPro(
      fontSize: 10, fontWeight: FontWeight.w500, color: AColors.textSecondary);

// Button Text

  static TextStyle buttonText = GoogleFonts.cairo(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );
}
