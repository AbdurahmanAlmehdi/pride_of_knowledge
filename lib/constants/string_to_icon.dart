import 'package:flutter/material.dart';

class StringToIcon {
  static const mapOfIcons = {
    'high school': Icons.school,
  };

  static IconData toIcon(String iconString) {
    final icon = mapOfIcons[iconString] ?? Icons.question_mark;
    return icon;
  }
}
