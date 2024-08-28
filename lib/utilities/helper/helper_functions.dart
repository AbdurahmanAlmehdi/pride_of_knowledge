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

    final time = minutes < 60
        ? '$minutes Mins'
        : '${hours != 0 ? '$hours' : ''}${mins >= 30 ? '.5' : '.0'} Hours';

    return time;
  }

  static String getFirstWord(String input) {
    List<String> words = input.split(' ');
    String firstLetter = words[0].split('').first.toUpperCase();
    String restLetters =
        words[0].split('').getRange(1, words[0].length).join('');
    String word = [firstLetter, restLetters].join();
    return word;
  }
}
