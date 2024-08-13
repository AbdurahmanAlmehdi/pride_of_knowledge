import 'package:flutter/material.dart';

class AHelperFunctions {
  static Size screenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  static double screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double screenWidth(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width;
  }

  static double getBottomNavigationBarHeight() {
    return kBottomNavigationBarHeight;
  }

  static double getAppBarHeight() {
    return kToolbarHeight;
  }

  static String toHours(int minutes) {
    final hours = minutes ~/ 60;
    final mins = minutes % 60;

    final time = '$hours:${mins > 9 ? mins : '0$mins'} hours';
    return time;
  }

  static String getFirstWord(String input) {
    List<String> words = input.split(' ');
    return words.isNotEmpty ? words[0] : '';
  }
}
