import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prideofknowledge/data/models/course.dart';
import 'package:prideofknowledge/features/home/views/widgets/course_tile.dart';

class VerticalCoursesList extends ConsumerWidget {
  const VerticalCoursesList({
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
          final course = courses.elementAt(index);
          return CourseTile(course: course);
        },
      ),
    );
  }
}
