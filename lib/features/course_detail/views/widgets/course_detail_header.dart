import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prideofknowledge/constants/colors.dart';
import 'package:prideofknowledge/data/models/course.dart';
import 'package:prideofknowledge/features/favorites/controllers/favorites_controller.dart';
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
                image: NetworkImage(course.courseImage),
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
                      // border: Border.all(color: AColors.black),
                      color: AColors.white,
                      borderRadius: BorderRadius.circular(22.5),
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.arrow_back_ios_outlined),
                      color: AColors.primary,
                      iconSize: 20,
                    ),
                  ),
                  Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        // border: Border.all(color: AColors.black),
                        color: AColors.white,
                        borderRadius: BorderRadius.circular(22.5),
                      ),
                      child: Consumer(
                        builder: (_, ref, ___) {
                          final isFavorite = ref
                              .watch(favoritesControllerProvider.notifier)
                              .isFavorite(course);
                          return IconButton(
                            onPressed: () {
                              ref
                                  .refresh(favoritesControllerProvider.notifier)
                                  .toggleFavorite(course);
                            },
                            icon: Icon(isFavorite
                                ? Icons.favorite
                                : Icons.favorite_outline),
                            color: Colors.red,
                            // color: Colors.red,
                            iconSize: 20,
                          );
                        },
                      )),
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
                  Flexible(
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
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 50,
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
