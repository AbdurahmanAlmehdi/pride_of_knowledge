import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prideofknowledge/data/cloud/cloud_constants.dart';
import 'package:prideofknowledge/data/models/course.dart';

final allCoursesProvider = StreamProvider.autoDispose<Iterable<Course>>(
  (ref) {
    final stream = FirebaseFirestore.instance
        .collection(coursesCollection)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .where((doc) => !doc.metadata.hasPendingWrites)
              .map((doc) => Course.fromSnapshot(doc)),
        );

    return stream;
  },
);
