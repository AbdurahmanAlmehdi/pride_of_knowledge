import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prideofknowledge/data/cloud/cloud_constants.dart';
import 'package:prideofknowledge/data/models/course.dart';

final allCoursesProvider = StreamProvider.autoDispose<Iterable<Course>>(
  (ref) async* {
    final controller = StreamController<Iterable<Course>>();

    controller.onListen = () {
      controller.sink.add([]);
    };

    final sub = FirebaseFirestore.instance
        .collection(coursesCollection)
        .orderBy(
          createdAtFieldName,
          descending: true,
        )
        .snapshots()
        .listen(
      (snapshot) {
        final documents = snapshot.docs;
        final posts = documents
            .where(
              (doc) => !doc.metadata.hasPendingWrites,
            )
            .map(
              (doc) => Course.fromSnapshot(doc),
            );
        controller.sink.add(posts);
      },
    );

    ref.onDispose(
      () {
        sub.cancel();
        controller.close();
      },
    );
  },
);
