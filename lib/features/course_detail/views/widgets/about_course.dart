import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:info_toast/info_toast.dart';
import 'package:info_toast/resources/arrays.dart';
import 'package:prideofknowledge/constants/colors.dart';
import 'package:prideofknowledge/data/models/course.dart';
import 'package:prideofknowledge/features/authentication/providers/user_provider.dart';
import 'package:prideofknowledge/features/authentication/services/auth/firebase_auth_provider.dart';
import 'package:prideofknowledge/features/authentication/views/generics/text_button.dart';
import 'package:prideofknowledge/features/cart/controllers/cart_controller.dart';
import 'package:prideofknowledge/utilities/helper/helper_functions.dart';
import 'package:prideofknowledge/utilities/theme/widget_themes/text_theme.dart';
import 'package:prideofknowledge/utilities/widgets/global_widgets.dart';

class AboutCourse extends StatelessWidget {
  const AboutCourse({super.key, required this.course});

  final Course course;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(0),
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            course.description,
            style: ATextTheme.bigBody
                .copyWith(color: AColors.textPrimary, fontSize: 13),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CourseIncludes(
              courseLength: AHelperFunctions.toHours(course.courseMins),
              numVids: course.numVideos.toString(),
              numSections: course.numSections.toString()),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Row(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: CreatorInfo(
                    creatorId: course.creatorId,
                    infoType: CreatorInfoType.image,
                    boxFit: BoxFit.cover,
                    height: 50,
                    width: 50,
                  )),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CreatorInfo(
                    style: ATextTheme.smallSubHeading
                        .copyWith(color: AColors.textPrimary),
                    creatorId: course.creatorId,
                    infoType: CreatorInfoType.name,
                  ),
                  CreatorInfo(
                    creatorId: course.creatorId,
                    infoType: CreatorInfoType.specialaty,
                    style: ATextTheme.bigBody,
                  ),
                ],
              )
            ],
          ),
        ),
        Consumer(
          builder: (context, ref, child) {
            final purchasedCourses = ref.watch(userProvider).purchasedCourses;
            final alreadyPurchased = purchasedCourses != null
                ? purchasedCourses.contains(course.courseId)
                : false;
            return !alreadyPurchased
                ? ElevatedTextButton(
                    buttonText: 'Add to cart',
                    onPressed: () {
                      final cartItems = ref.read(userProvider).cartItems;
                      if (cartItems != null &&
                          cartItems.contains(course.courseId)) {
                        InfoToast.info(
                                animationType: AnimationType.fromTop,
                                toastDuration:
                                    const Duration(milliseconds: 1500),
                                title: const Text('Course already in Cart'))
                            .show(context);
                      } else {
                        ref.watch(
                            updateCartControllerProvider(course.courseId));
                        InfoToast.success(
                                animationType: AnimationType.fromTop,
                                toastDuration:
                                    const Duration(milliseconds: 1500),
                                title: const Text(
                                    'Course added to cart Successfully'))
                            .show(context);
                        ref
                            .read(userProvider.notifier)
                            .retrieveCurrentUserFirebase(
                                FirebaseAuthProvider());
                      }
                    },
                  )
                : Container();
          },
        )
      ],
    );
  }
}

class CourseIncludes extends StatelessWidget {
  final String courseLength;
  final String numVids;
  final String numSections;
  const CourseIncludes(
      {super.key,
      required this.courseLength,
      required this.numVids,
      required this.numSections});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          'This Course Includes:',
          style: ATextTheme.bigSubHeading,
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            const Icon(
              Icons.video_collection_outlined,
              color: AColors.secondary,
            ),
            const SizedBox(
              width: 3,
            ),
            Text(
              '$numVids videos',
              style: ATextTheme.bigBody
                  .copyWith(color: AColors.textWhite, fontSize: 14),
            )
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          children: [
            const Icon(
              Icons.slow_motion_video_rounded,
              color: AColors.secondary,
            ),
            const SizedBox(
              width: 3,
            ),
            Text(
              '$courseLength of on-demand video',
              style: ATextTheme.bigBody
                  .copyWith(color: AColors.textWhite, fontSize: 14),
            )
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          children: [
            const Icon(
              Icons.video_collection_outlined,
              color: AColors.secondary,
            ),
            const SizedBox(
              width: 3,
            ),
            Text(
              '$numSections sections to master',
              style: ATextTheme.bigBody
                  .copyWith(color: AColors.textWhite, fontSize: 14),
            )
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          children: [
            const Icon(
              Icons.verified,
              color: AColors.secondary,
            ),
            const SizedBox(
              width: 3,
            ),
            Text(
              'Certificate of completion',
              style: ATextTheme.bigBody
                  .copyWith(color: AColors.textWhite, fontSize: 14),
            )
          ],
        )
      ],
    );
  }
}
