import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prideofknowledge/data/models/course.dart';

typedef AFilter = Query<Map<String, dynamic>> Function(Query query);

abstract class CourseRepository {
  Future<List<Course>> getAllCourses();
  Future<List<Course>> getFilteredCourses(AFilter filter);
  Future<Course> getCourse(String courseId);
  Future<void> deleteCourse(String courseId);
  Future<void> updateCourse(Course course);
  Future<void> createCourse(Course course);
}
