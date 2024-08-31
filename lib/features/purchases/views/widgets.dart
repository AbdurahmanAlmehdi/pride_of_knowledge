import 'package:flutter/material.dart';
import 'package:prideofknowledge/constants/colors.dart';
import 'package:prideofknowledge/utilities/theme/widget_themes/text_theme.dart';

class NoCourses extends StatelessWidget {
  final String image;
  final String text;
  const NoCourses({
    super.key,
    required this.image,
    this.text = 'You have not purchased any Course yet',
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            height: 250,
            width: 250,
          ),
          Text(
            text,
            style: ATextTheme.bigSubHeading.copyWith(color: AColors.secondary),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
