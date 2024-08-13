import 'package:flutter/material.dart';

class AColors {
  // App theme colors
  static const Color primary = Color(0xFF464e73);
  static const Color secondary = Color(0xFFf5a437);
  static const Color accent = Color(0xFFf4624d);

  // Text colors
  static const Color textPrimary = Color(0xFF0f172a);
  static const Color textSecondary = Color(0xFFf5a437);
  static const Color textWhite = Color(0xFF64748b);

  // Background colors
  static const Color light = Color(0xFFF6F6F6);
  static const Color dark = Color(0xFF0f172a);
  static const Color primaryBackground = Color(0xFFF3F5FF);
  static const Color greyedOutBackround = Color(0xFFeff0fe);

  // Background Container colors
  static const Color lightContainer = Color(0xFFF6F6F6);
  static Color darkContainer = AColors.white.withOpacity(0.1);

  // Button colors
  static const Color buttonPrimary = Color(0xFF464e73);
  static const Color buttonSecondary = Color(0xFFf5a437);
  static const Color buttonDisabled = Color(0xFFC4C4C4);

  // Border colors
  static const Color borderPrimary = Color(0xFFD9D9D9);
  static const Color borderSecondary = Color(0xFFe2e8f0);

  // Error and validation colors
  static const Color error = Color(0xFFD32F2F);
  static const Color success = Color(0xFF388E3C);
  static const Color warning = Color(0xFFF57C00);
  static const Color info = Color(0xFF1976D2);

  // Neutral Shades
  static const Color black = Color(0xFF232323);
  static const Color darkerGrey = Color(0xFF4F4F4F);
  static const Color darkGrey = Color(0xFF939393);
  static const Color grey = Color(0xFFE0E0E0);
  static const Color softGrey = Color(0xFFF4F4F4);
  static const Color lightGrey = Color(0xFFF9F9F9);
  static const Color white = Color(0xFFFFFFFF);
}
