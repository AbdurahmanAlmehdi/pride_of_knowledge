import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:prideofknowledge/data/cloud/cloud_constants.dart';
import 'package:prideofknowledge/data/models/section.dart';
import 'package:prideofknowledge/utilities/exceptions/firestore_exceptions.dart';

class SectionRepository {
  final FirebaseFirestore _firebase;
  SectionRepository({
    required firebase,
  }) : _firebase = firebase;
  final sections = sectionsCollection;

  Future<List<Section>> retreiveSections(String courseId) async {
    try {
      final snapshot = await _firebase
          .collection(sections)
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
      throw FirestoreException(
          'Failed to retrieve sections - Error Code: ${e.code}');
    } catch (e) {
      throw FirestoreException('Failed to retrieve sections - Error Code: $e');
    }
  }
}
