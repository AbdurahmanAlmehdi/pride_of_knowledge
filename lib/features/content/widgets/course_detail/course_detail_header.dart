import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prideofknowledge/constants/colors.dart';
import 'package:prideofknowledge/constants/navigation_consts.dart';
import 'package:prideofknowledge/data/models/course.dart';
import 'package:prideofknowledge/features/home/services/providers/nav_provider.dart';
import 'package:prideofknowledge/utilities/helper/helper_functions.dart';
import 'package:prideofknowledge/utilities/theme/widget_themes/text_theme.dart';

class CourseDetailHeader extends ConsumerWidget {
  const CourseDetailHeader({
    super.key,
    required this.course,
  });

  final Course course;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 280,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 40, 8, 0),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image(
                image: AssetImage(course.courseImage),
                fit: BoxFit.contain,
              ),
            ),
            Positioned(
              top: 15,
              left: 15,
              right: 15,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      color: AColors.white,
                      borderRadius: BorderRadius.circular(22.5),
                    ),
                    child: IconButton(
                      onPressed: () {
                        ref
                            .read(navigationProvider.notifier)
                            .setPageScreen(ANavigationIndex.homeViewIndex);
                      },
                      icon: const Icon(Icons.arrow_back_ios_outlined),
                      iconSize: 20,
                    ),
                  ),
                  Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      color: AColors.white,
                      borderRadius: BorderRadius.circular(22.5),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.favorite_border),
                      // color: Colors.red,
                      iconSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
                top: 210,
                left: 15,
                right: 15,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IntrinsicWidth(
                      child: Container(
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: AColors.primary),
                        child: Center(
                          child: Text(
                            'By: ${AHelperFunctions.getFirstWord(course.creatorId)}     ',
                            textAlign: TextAlign.center,
                            style: ATextTheme.smallSubHeading
                                .copyWith(color: AColors.white, fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                    IntrinsicWidth(
                      child: Container(
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: AColors.secondary),
                        child: Center(
                          child: Text(
                            '${course.price.toString()}${course.currency}      ',
                            textAlign: TextAlign.center,
                            style: ATextTheme.smallSubHeading
                                .copyWith(color: AColors.white, fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
