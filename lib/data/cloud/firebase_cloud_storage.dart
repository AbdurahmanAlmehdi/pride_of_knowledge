import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prideofknowledge/data/models/course.dart';
import 'package:prideofknowledge/features/authentication/services/auth/auth_user.dart';
import 'package:prideofknowledge/data/cloud/cloud_constants.dart';
import 'package:prideofknowledge/data/cloud/cloud_exceptions.dart';

class FirebaseCloudStorage {
  final users = FirebaseFirestore.instance.collection(usersCollection);
  final courses = FirebaseFirestore.instance.collection(coursesCollection);
  final creators = FirebaseFirestore.instance.collection(creatorsCollection);
  final sections = FirebaseFirestore.instance.collection(sectionsCollection);
  final videos = FirebaseFirestore.instance.collection(videosCollection);

  void createUser(AuthUser user) async {
    try {
      await users.doc(user.uid).set({
        emailFieldName: user.email,
        phoneNumFieldName: user.phoneNum,
        fullnameFieldName: user.fullName,
        usernameFieldName: user.username,
      });
    } on Exception {
      throw CouldNotCreateDocCloudException();
    }
  }

  void createCourse(Course course) async {
    try {
      await courses.doc().set({
        categoryIdFieldName: course.categoryId,
        creatorIdFieldName: course.creatorId,
        titleFieldName: course.title,
        priceFieldName: course.price,
        currencyFieldName: course.currency,
        ratingFieldName: course.rating,
        descriptionFieldName: course.description,
        isLikedFieldName: course.isLiked,
        timesBoughtFieldName: course.timesBought,
        courseImageFieldName: course.courseImage,
        createdAtFieldName: course.createdAt,
      });
    } on Exception {
      throw CouldNotCreateDocCloudException();
    }
  }

  void createCourses(List<Course> courses) {
    try {
      for (var course in courses) {
        createCourse(course);
      }
    } on Exception {
      throw CouldNotCreateDocCloudException();
    }
  }

  // Retreives All Courses
  // Stream<Iterable<Course>> allCourses() {
  //   final allCourses = courses.snapshots().map(
  //         (event) => event.docs.map((doc) => Course.fromSnapshot(doc)),
  //       );
  //   return allCourses;
  // }

  // // Retreives All Courses created by a specific creator
  // Stream<Iterable<Course>> creatorCourses(String creatorId) {
  //   final creatorCourses =
  //       courses.where(creatorIdFieldName, isEqualTo: creatorId).snapshots().map(
  //             (event) => event.docs.map((doc) => Course.fromSnapshot(doc)),
  //           );
  //   return creatorCourses;
  // }

  // // Retreives All Creators
  // Stream<Iterable<Creator>> allCreators() {
  //   final allCreators = creators.snapshots().map(
  //         (event) => event.docs.map((doc) => Creator.fromSnapshot(doc)),
  //       );
  //   return allCreators;
  // }

  // // Retreives All Sections of a Course
  // Stream<Iterable<Section>> courseSections(String courseId) {
  //   final allSections =
  //       sections.where(courseIdFieldName, isEqualTo: courseId).snapshots().map(
  //             (event) => event.docs.map((doc) => Section.fromSnapshot(doc)),
  //           );
  //   return allSections;
  // }

  // // Retreives All Videos of a Sections
  // Stream<Iterable<Video>> sectionVideos(String sectionId) {
  //   final allVideos =
  //       videos.where(sectionIdFieldName, isEqualTo: sectionId).snapshots().map(
  //             (event) => event.docs.map((doc) => Video.fromSnapshot(doc)),
  //           );
  //   return allVideos;
  // }

  FirebaseCloudStorage._sharedInstance();
  static final FirebaseCloudStorage _shared =
      FirebaseCloudStorage._sharedInstance();
  factory FirebaseCloudStorage() => _shared;
}
