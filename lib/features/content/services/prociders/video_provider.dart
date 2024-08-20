import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prideofknowledge/data/cloud/cloud_constants.dart';
import 'package:prideofknowledge/data/models/video.dart';

final videoProvider =
    FutureProvider.family<List<Video>, String>((ref, sectionId) async {
  try {
    final snapshot = await FirebaseFirestore.instance
        .collection(videosCollection)
        .orderBy(videoOrderFieldName, descending: false)
        .get();

    final data = snapshot.docs
        .where(
          (doc) => doc[sectionIdFieldName] == sectionId,
        )
        .map(
          (doc) => Video.fromSnapshot(doc),
        )
        .toList();
    return data;
  } on FirebaseException catch (e) {
    throw e.code;
  } catch (_) {
    throw 'Error Occured';
  }
});
