import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prideofknowledge/constants/image_strings.dart';
import 'package:prideofknowledge/features/course_list/views/widgets/course_tile.dart';
import 'package:prideofknowledge/features/purchases/controllers/purchase_controller.dart';
import 'package:prideofknowledge/features/purchases/views/widgets.dart';

class PurchasedCoursesView extends ConsumerWidget {
  final List<String> courseIds;
  const PurchasedCoursesView({super.key, required this.courseIds});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final courses = ref.watch(purchasedCoursesControllerProvider(courseIds));
    if (courseIds.isEmpty) {
      return const NoCourses(
        image: AImages.noCourses,
      );
    } else {
      return courses.when(
        data: (courses) {
          return ListView.builder(
            itemCount: courses.length,
            itemBuilder: (context, index) {
              final course = courses[index];
              return CourseTile(course: course);
            },
          );
        },
        error: (error, stackTrace) => const NoCourses(
          image: AImages.error,
          text: 'Error Retrieving Courses',
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
  }
}
