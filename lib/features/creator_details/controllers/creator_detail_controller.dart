import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prideofknowledge/data/cloud/cloud_constants.dart';
import 'package:prideofknowledge/data/models/course.dart';
import 'package:prideofknowledge/features/home/services/repositories/firebase_course_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'creator_detail_controller.g.dart';

@riverpod
Future<List<Course>> creatorCoursesController(
    CreatorCoursesControllerRef ref, String creatorId) async {
  try {
    final courses = await FirebaseCourseRepository().getFilteredCourses(
      (query) => query.where(creatorIdFieldName, isEqualTo: creatorId)
          as Query<Map<String, dynamic>>,
    );
    return courses;
  } catch (e) {
    rethrow;
  }
}
