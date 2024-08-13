import 'package:flutter/material.dart';
import 'package:prideofknowledge/constants/colors.dart';
import 'package:prideofknowledge/constants/image_strings.dart';
import 'package:prideofknowledge/utilities/theme/widget_themes/text_theme.dart';

class CoursesView extends StatelessWidget {
  const CoursesView({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteCourses = [];
    if (favoriteCourses.isNotEmpty) {}
    return Center(
      child: Column(
        children: [
          Image.asset(AImages.noFavorites),
          Text(
            'You have no Courses',
            style: ATextTheme.smallHeading.copyWith(color: AColors.secondary),
          ),
        ],
      ),
    );
  }
}
