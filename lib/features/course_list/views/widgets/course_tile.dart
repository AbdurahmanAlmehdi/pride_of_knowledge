import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prideofknowledge/constants/colors.dart';
import 'package:prideofknowledge/data/models/course.dart';
import 'package:prideofknowledge/features/authentication/providers/user_provider.dart';
import 'package:prideofknowledge/features/authentication/services/auth/firebase_auth_provider.dart';
import 'package:prideofknowledge/features/cart/controllers/cart_controller.dart';
import 'package:prideofknowledge/features/course_detail/views/course_detail_view.dart';
import 'package:prideofknowledge/features/favorites/controllers/favorites_controller.dart';
import 'package:prideofknowledge/utilities/helper/helper_functions.dart';
import 'package:prideofknowledge/utilities/theme/widget_themes/text_theme.dart';
import 'package:prideofknowledge/utilities/widgets/global_widgets.dart';

class CourseTile extends StatelessWidget {
  const CourseTile({
    super.key,
    this.isCartItem = false,
    required this.course,
  });

  final Course course;
  final bool isCartItem;

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
                        child: CreatorInfo(
                          creatorId: course.creatorId,
                          infoType: CreatorInfoType.name,
                          maxLines: 1,
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
                          Text(
                            AHelperFunctions.toHours(course.courseMins),
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
                      Consumer(
                        builder: (context, ref, child) {
                          final favorites =
                              ref.watch(favoritesControllerProvider);
                          final isFavorite = favorites.contains(course);
                          return IconButton(
                            onPressed: () {
                              if (isCartItem) {
                                ref.read(removeCartItemControllerProvider(
                                    course.courseId));
                                ref
                                    .read(userProvider.notifier)
                                    .retrieveCurrentUserFirebase(
                                        FirebaseAuthProvider());
                              } else {
                                ref
                                    .read(favoritesControllerProvider.notifier)
                                    .toggleFavorite(course);
                              }
                            },
                            icon: isCartItem
                                ? const Icon(Icons.close)
                                : Icon(
                                    isFavorite
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    size: 20,
                                    color: Colors.red,
                                  ),
                          );
                        },
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
