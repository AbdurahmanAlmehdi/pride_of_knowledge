import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prideofknowledge/data/models/course.dart';

import 'package:prideofknowledge/features/course_detail/views/widgets/about_course.dart';
import 'package:prideofknowledge/features/course_detail/views/widgets/course_detail_header.dart';
import 'package:prideofknowledge/features/course_detail/views/widgets/course_sections.dart';
import 'package:prideofknowledge/features/course_detail/views/widgets/course_info.dart';
import 'package:prideofknowledge/features/course_detail/views/widgets/segmented_slider.dart';

class CourseDetailView extends StatelessWidget {
  const CourseDetailView({super.key, required this.course});

  final Course course;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 11,
            child: Column(
              children: [
                CourseDetailHeader(course: course),
                CourseInfo(course: course),
                const Padding(
                  padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                  child: SegmentedSlider(),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 9,
            child: Consumer(
              builder: (context, ref, child) {
                final isLessonsSelected = ref.watch(sliderProvider);
                if (!isLessonsSelected) {
                  return Padding(
                    padding: const EdgeInsets.all(8),
                    child: AboutCourse(
                      course: course,
                    ),
                  );
                } else {
                  return CourseSections(
                    course: course,
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
