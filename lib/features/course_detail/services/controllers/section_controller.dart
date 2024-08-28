import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prideofknowledge/data/cloud/cloud_constants.dart';

import 'package:prideofknowledge/data/models/section.dart';

final sectionProvider =
    FutureProvider.family<List<Section>, String>((ref, courseId) async {
  try {
    final snapshot = await FirebaseFirestore.instance
        .collection(sectionsCollection)
        .orderBy(sectionOrderFieldName, descending: false)
        .get();

    final data = snapshot.docs
        .where(
          (doc) => doc[courseIdFieldName] == courseId,
        )
        .map(
          (document) => Section.fromSnapshot(document),
        )
        .toList();
    return data;
  } on FirebaseException catch (e) {
    throw e.code;
  } catch (_) {
    throw 'Error Occured';
  }
});
