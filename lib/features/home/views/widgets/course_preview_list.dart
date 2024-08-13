import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prideofknowledge/constants/colors.dart';
import 'package:prideofknowledge/constants/navigation_consts.dart';

import 'package:prideofknowledge/data/models/course.dart';
import 'package:prideofknowledge/features/home/services/providers/current_course_provider.dart';
import 'package:prideofknowledge/features/home/services/providers/nav_provider.dart';
import 'package:prideofknowledge/utilities/helper/helper_functions.dart';
import 'package:prideofknowledge/utilities/theme/widget_themes/text_theme.dart';

class CoursePreviewList extends ConsumerWidget {
  const CoursePreviewList({
    super.key,
    required this.screenWidth,
    required this.courses,
  });

  final double screenWidth;
  final Iterable<Course> courses;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      itemCount: courses.length > 4 ? 4 : courses.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            ref
                .read(currentCourseProvider.notifier)
                .currentCourse(courses.elementAt(index));
            ref
                .read(navigationProvider.notifier)
                .setPageScreen(ANavigationIndex.courseDetailsViewIndex);
          },
          child: SizedBox(
            width: screenWidth * 0.5,
            height: 300,
            child: Stack(
              children: [
                Positioned(
                  right: 15,
                  left: 15,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image(
                      image: NetworkImage(courses.elementAt(index).courseImage),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Positioned(
                    top: 88,
                    left: 20,
                    right: 20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 60,
                          height: 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: AColors.primary),
                          child: Text(
                            //TODO get creator data
                            courses.elementAt(index).creatorId,
                            textAlign: TextAlign.center,
                            style: ATextTheme.bigBody
                                .copyWith(color: AColors.white),
                          ),
                        ),
                        Container(
                          width: 60,
                          height: 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: AColors.secondary),
                          child: Text(
                            '${courses.elementAt(index).price.toString()}${courses.elementAt(index).currency}',
                            textAlign: TextAlign.center,
                            style: ATextTheme.bigBody
                                .copyWith(color: AColors.white),
                          ),
                        ),
                      ],
                    )),
                Positioned(
                  right: 15,
                  left: 15,
                  top: 120,
                  child: Column(
                    children: [
                      Text(
                        courses.elementAt(index).title,
                        softWrap: true,
                        overflow: TextOverflow.visible,
                        style: ATextTheme.smallSubHeading.copyWith(
                          color: AColors.textPrimary,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            // TODO Change the constant value of 40 to total mins of course
                            AHelperFunctions.toHours(40),
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
                            courses.elementAt(index).rating.toString(),
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
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
