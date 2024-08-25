// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:prideofknowledge/data/models/course.dart';
// import 'package:prideofknowledge/features/home/services/controllers/course_controller.dart';
// import 'package:prideofknowledge/features/home/services/repositories/course_repository.dart';
// import 'package:prideofknowledge/features/home/services/repositories/firebase_course_repository.dart';
// import 'package:prideofknowledge/utilities/providers/general_provider.dart';

// final courseRepositoryProvider = Provider<CourseRepository>((ref) {
//   return FirebaseCourseRepository(ref.read(firestoreProvider));
// });

// final courseControllerProvider =
//     AsyncNotifierProvider<CourseController, List<Course>>(
//         CourseController(courseControllerProvider));
