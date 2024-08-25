import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prideofknowledge/data/cloud/cloud_constants.dart';
import 'package:prideofknowledge/data/models/course.dart';
import 'package:prideofknowledge/features/home/services/repositories/course_repository.dart';
import 'package:prideofknowledge/features/home/services/repositories/firebase_course_repository.dart';
import 'package:prideofknowledge/utilities/exceptions/firestore_exceptions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'course_controller.g.dart';

@riverpod
class CourseController extends _$CourseController {
  final CourseRepository _courseRepository = FirebaseCourseRepository();

  @override
  FutureOr<List<Course>> build() {
    return [];
  }

  Future<void> retrieveFeaturedCourses() async {
    state = const AsyncLoading();
    try {
      final courses = await _courseRepository.getFilteredCourses(
        (query) => query.where(isLikedFieldName, isEqualTo: true)
            as Query<Map<String, dynamic>>,
      );
      state = AsyncData(courses);
    } on FirestoreException catch (e) {
      AsyncError(e.message, StackTrace.current);
    } catch (e) {
      AsyncError(e, StackTrace.current);
    }
  }

  Future<void> retrieveTopRatedCourses() async {
    state = const AsyncLoading();
    try {
      final courses = await _courseRepository.getFilteredCourses(
        (query) => query.where(ratingFieldName, isGreaterThan: 4.5).limit(10)
            as Query<Map<String, dynamic>>,
      );
      state = AsyncData(courses);
    } on FirestoreException catch (e) {
      AsyncError(e.message, StackTrace.current);
    } catch (e) {
      AsyncError(e, StackTrace.current);
    }
  }

  Future<void> retrieveSearchedCourses(String search) async {
    state = const AsyncLoading();
    try {
      final courses = await _courseRepository.getFilteredCourses(
        (query) => query.orderBy(titleFieldName).startAt([search]).limit(20)
            as Query<Map<String, dynamic>>,
      );
      state = AsyncData(courses);
    } on FirestoreException catch (e) {
      AsyncError(e.message, StackTrace.current);
    } catch (e) {
      AsyncError(e, StackTrace.current);
    }
  }

  Future<void> retrieveAllCourses() async {
    state = const AsyncLoading();
    try {
      final courses = await _courseRepository.getAllCourses();
      state = AsyncData(courses);
    } on FirestoreException catch (e) {
      AsyncError(e.message, StackTrace.current);
    } catch (e) {
      AsyncError(e, StackTrace.current);
    }
  }

  Future<void> retrieveCourse(String courseId) async {
    state = const AsyncLoading();
    try {
      final course = await _courseRepository.getCourse(courseId);
      state = AsyncData([course]);
    } on FirestoreException catch (e) {
      AsyncError(e.message, StackTrace.current);
    } catch (e) {
      AsyncError(e, StackTrace.current);
    }
  }
}
