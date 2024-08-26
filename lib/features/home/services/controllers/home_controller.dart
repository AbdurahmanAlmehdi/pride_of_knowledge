import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prideofknowledge/data/cloud/cloud_constants.dart';
import 'package:prideofknowledge/data/models/category.dart';
import 'package:prideofknowledge/data/models/course.dart';
import 'package:prideofknowledge/data/models/creator.dart';
import 'package:prideofknowledge/features/home/services/repositories/category_repository.dart';
import 'package:prideofknowledge/features/home/services/repositories/creator_repository.dart';
import 'package:prideofknowledge/features/home/services/repositories/firebase_course_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_controller.g.dart';

@Riverpod(keepAlive: true)
Future<List<Course>> featuredCoursesController(
    FeaturedCoursesControllerRef ref) async {
  try {
    final courses = await FirebaseCourseRepository().getFilteredCourses(
      (query) => query.where(isLikedFieldName, isEqualTo: true).limit(20)
          as Query<Map<String, dynamic>>,
    );
    return courses;
  } catch (e) {
    rethrow;
  }
}

@Riverpod(keepAlive: true)
Future<List<Course>> topRatedCoursesController(
    TopRatedCoursesControllerRef ref) async {
  try {
    final courses = await FirebaseCourseRepository().getFilteredCourses(
      (query) => query.where(ratingFieldName, isGreaterThan: 4.5).limit(15)
          as Query<Map<String, dynamic>>,
    );
    return courses;
  } catch (e) {
    rethrow;
  }
}

@Riverpod(keepAlive: true)
Future<List<Category>> mainCategoriesController(
    MainCategoriesControllerRef ref) async {
  try {
    final categories = await CategoryRepository().getMainCategories();
    return categories;
  } catch (e) {
    rethrow;
  }
}

@Riverpod(keepAlive: true)
Future<List<Creator>> topRatedCreatorsController(
    TopRatedCreatorsControllerRef ref) async {
  try {
    final creators = await CreatorRepository().getTopRatedCreators();
    return creators;
  } catch (e) {
    rethrow;
  }
}
