import 'package:flutter/material.dart';
import 'package:prideofknowledge/constants/colors.dart';
import 'package:prideofknowledge/data/models/course.dart';
import 'package:prideofknowledge/utilities/helper/helper_functions.dart';
import 'package:prideofknowledge/utilities/theme/widget_themes/text_theme.dart';

class CourseInfo extends StatelessWidget {
  const CourseInfo({
    super.key,
    required this.course,
  });

  final Course course;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            course.title,
            style: ATextTheme.mediumHeading,
          ),
          Row(
            children: [
              Text(
                //TODO Get course mins
                AHelperFunctions.toHours(50),
                style: ATextTheme.mediumSubHeading
                    .copyWith(color: AColors.textWhite),
              ),
              const SizedBox(
                width: 5,
              ),
              const Icon(
                Icons.access_time,
                size: 18,
                color: AColors.textWhite,
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                course.rating.toString(),
                style: ATextTheme.mediumSubHeading
                    .copyWith(color: AColors.textWhite),
              ),
              const SizedBox(
                width: 5,
              ),
              const Icon(
                Icons.star_border,
                size: 19,
                color: AColors.textWhite,
              )
            ],
          ),
          const SizedBox(height: 3),
          Text(
            "${course.timesBought.toString()} Students",
            style: ATextTheme.smallSubHeading,
          )
        ],
      ),
    );
  }
}
