import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prideofknowledge/constants/colors.dart';
import 'package:prideofknowledge/constants/navigation_consts.dart';

import 'package:prideofknowledge/data/models/course.dart';
import 'package:prideofknowledge/features/home/services/providers/current_course_provider.dart';
import 'package:prideofknowledge/features/home/services/providers/nav_provider.dart';
import 'package:prideofknowledge/utilities/helper/helper_functions.dart';
import 'package:prideofknowledge/utilities/theme/widget_themes/text_theme.dart';

class FeaturedCourses extends ConsumerWidget {
  const FeaturedCourses({
    super.key,
    required this.courses,
  });

  final Iterable<Course> courses;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: courses.length > 5 ? 5 : courses.length,
        (context, index) {
          return InkWell(
            onTap: () {
              ref
                  .read(currentCourseProvider.notifier)
                  .currentCourse(courses.elementAt(index));
              ref
                  .read(navigationProvider.notifier)
                  .setPageScreen(ANavigationIndex.courseDetailsViewIndex);
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
                          image: NetworkImage(
                              courses.elementAt(index).courseImage),
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
                                courses.elementAt(index).title,
                                softWrap: true,
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
                                "Created By: ${courses.elementAt(index).creatorId}",
                                softWrap: true,
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
                              '${courses.elementAt(index).price.toString()}${courses.elementAt(index).currency}',
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
        },
      ),
    );
  }
}
