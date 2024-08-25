import 'package:flutter/material.dart';
import 'package:prideofknowledge/constants/colors.dart';
import 'package:prideofknowledge/data/models/course.dart';
import 'package:prideofknowledge/features/content/course_detail_view.dart';
import 'package:prideofknowledge/utilities/helper/helper_functions.dart';
import 'package:prideofknowledge/utilities/theme/widget_themes/text_theme.dart';

class CourseTile extends StatelessWidget {
  const CourseTile({
    super.key,
    required this.course,
  });

  final Course course;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return CourseDetailView(course: course);
            },
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
        child: Material(
          elevation: 2.5,
          borderRadius: BorderRadius.circular(20),
          child: Container(
            padding: const EdgeInsets.all(10),
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image(
                    image: NetworkImage(course.courseImage),
                    fit: BoxFit.cover,
                    height: 110,
                    width: 110,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 180,
                        child: Text(
                          course.title,
                          softWrap: true,
                          maxLines: 1,
                          overflow: TextOverflow.visible,
                          style: ATextTheme.smallSubHeading.copyWith(
                            color: AColors.textPrimary,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 180,
                        child: Text(
                          // TODO Change to creator name
                          "Created By: ${course.creatorId}",
                          softWrap: true,
                          maxLines: 2,
                          overflow: TextOverflow.visible,
                          style: ATextTheme.bigBody.copyWith(
                            color: AColors.textPrimary,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          // TODO Change to real minutes
                          Text(
                            AHelperFunctions.toHours(30),
                            style: ATextTheme.bigBody,
                          ),
                          const Icon(
                            Icons.access_time,
                            size: 14,
                            color: AColors.textWhite,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            course.rating.toString(),
                            style: ATextTheme.bigBody,
                          ),
                          const Icon(
                            Icons.star_border,
                            size: 15,
                            color: AColors.textWhite,
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.favorite_border,
                          size: 20,
                        ),
                      ),
                      Text(
                        '${course.price.toString()}${course.currency}',
                        style: ATextTheme.bigBody,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
