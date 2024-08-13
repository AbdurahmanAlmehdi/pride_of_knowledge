import 'package:flutter/material.dart';
import 'package:prideofknowledge/constants/colors.dart';
import 'package:prideofknowledge/constants/image_strings.dart';
import 'package:prideofknowledge/utilities/theme/widget_themes/text_theme.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteCourses = [];
    if (favoriteCourses.isNotEmpty) {}
    return Center(
      child: Column(
        children: [
          Image.asset(AImages.noFavorites),
          Text(
            'You have no Favorites',
            style: ATextTheme.smallHeading.copyWith(color: AColors.secondary),
          ),
        ],
      ),
    );
  }
}
