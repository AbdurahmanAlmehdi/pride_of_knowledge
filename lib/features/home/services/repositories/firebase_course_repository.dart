import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prideofknowledge/data/cloud/cloud_constants.dart';
import 'package:prideofknowledge/data/models/course.dart';
import 'package:prideofknowledge/features/home/services/repositories/course_repository.dart';
import 'package:prideofknowledge/utilities/exceptions/firestore_exceptions.dart';

class FirebaseCourseRepository implements CourseRepository {
  final FirebaseFirestore _firebase = FirebaseFirestore.instance;
  final courses = coursesCollection;

  @override
  Future<void> createCourse(Course course) async {
    try {
      await _firebase.collection(courses).add(course.toJson());
    } on FirebaseException catch (e) {
      throw FirestoreException(
          'Failed to create course - Error Code: ${e.code}');
    } catch (e) {
      throw FirestoreException('Failed to create course - Error Code: $e');
    }
  }

  @override
  Future<void> deleteCourse(String courseId) async {
    try {
      await _firebase.collection(courses).doc(courseId).delete();
    } on FirebaseException catch (e) {
      throw FirestoreException(
          'Failed to delete course - Error Code: ${e.code}');
    } catch (e) {
      throw FirestoreException('Failed to delete course - Error Code: $e');
    }
  }

  @override
  Future<List<Course>> getAllCourses() async {
    try {
      final querySnapshot = await _firebase.collection(courses).get();
      return querySnapshot.docs
          .where((doc) => !doc.metadata.hasPendingWrites)
          .map(
            (doc) => Course.fromSnapshot(doc),
          )
          .toList();
    } on FirebaseException catch (e) {
      throw FirestoreException(
          'Failed to retrieve all courses - Error Code: ${e.code}');
    } catch (e) {
      throw FirestoreException(
          'Failed to retrieve all courses - Error Code: $e');
    }
  }

  @override
  Future<Course> getCourse(String courseId) async {
    try {
      final snapshot = await _firebase.collection(courses).doc(courseId).get();
      final course = snapshot.data();
      if (course == null || course.isEmpty) {
        throw FirestoreException('Course doesnt exist or is empty');
      } else {
        return Course.fromJson(course);
      }
    } on FirebaseException catch (e) {
      throw FirestoreException(
          'Failed to retrieve course - Error Code: ${e.code}');
    } catch (e) {
      throw FirestoreException('Failed to retrieve course - Error Code: $e');
    }
  }

  @override
  Future<List<Course>> getFilteredCourses(AFilter filter) async {
    try {
      final query = _firebase.collection(courses);
      final filteredQuery = filter(query);
      final snapshot = await filteredQuery.get();
      return snapshot.docs
          .map(
            (doc) => Course.fromSnapshot(doc),
          )
          .toList();
    } on FirebaseException catch (e) {
      throw FirestoreException(
          'Failed to retrieve filtered courses - Error Code: ${e.code}');
    } catch (e) {
      throw FirestoreException(
          'Failed to retrieve filtered courses - Error Code: $e');
    }
  }

  @override
  Future<void> updateCourse(Course course) async {
    try {
      await _firebase
          .collection(courses)
          .doc(course.courseId)
          .update(course.toJson());
    } on FirebaseException catch (e) {
      throw FirestoreException(
          'Failed to update course - Error Code: ${e.code}');
    } catch (e) {
      throw FirestoreException('Failed to update course - Error Code: $e');
    }
  }
}
