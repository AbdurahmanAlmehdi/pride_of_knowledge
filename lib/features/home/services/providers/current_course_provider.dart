import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prideofknowledge/constants/test_course.dart';
import 'package:prideofknowledge/data/models/course.dart';

class CurrentCourseNotifier extends StateNotifier<Course> {
  CurrentCourseNotifier() : super(testCourse);

  void currentCourse(Course course) {
    state = course;
  }
}

final currentCourseProvider =
    StateNotifierProvider<CurrentCourseNotifier, Course>((ref) {
  return CurrentCourseNotifier();
});

final sliderProvider = StateProvider<bool>(
  (ref) {
    return false;
  },
);
