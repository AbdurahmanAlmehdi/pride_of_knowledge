import 'package:flutter/material.dart';
import 'package:prideofknowledge/constants/colors.dart';
import 'package:prideofknowledge/constants/image_strings.dart';
import 'package:prideofknowledge/data/models/course.dart';
import 'package:prideofknowledge/features/course_list/views/widgets/course_tile.dart';
import 'package:prideofknowledge/utilities/theme/widget_themes/text_theme.dart';

class NoFavorites extends StatelessWidget {
  const NoFavorites({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AImages.noFavorites,
            height: 250,
            width: 250,
          ),
          Text(
            'You have no Favorites',
            style: ATextTheme.bigSubHeading.copyWith(color: AColors.secondary),
          ),
        ],
      ),
    );
  }
}

class FavoriteCourses extends StatelessWidget {
  const FavoriteCourses({
    super.key,
    required this.favoriteCourses,
  });

  final List<Course> favoriteCourses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: favoriteCourses.length,
      itemBuilder: (context, index) {
        final course = favoriteCourses[index];
        return CourseTile(course: course);
      },
    );
  }
}
