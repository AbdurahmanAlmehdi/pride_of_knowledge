import 'package:flutter/material.dart';
import 'package:prideofknowledge/constants/colors.dart';

class ATheme {
  ATheme._();

  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      disabledColor: AColors.grey,
      brightness: Brightness.light,
      primaryColor: AColors.primary,
      scaffoldBackgroundColor: AColors.white,
      canvasColor: AColors.white);
}
