import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prideofknowledge/data/cloud/cloud_constants.dart';

class Section {
  final String sectionId;
  final String courseId;
  final int sectionOrder;
  final String title;

  Section({
    required this.sectionId,
    required this.courseId,
    required this.sectionOrder,
    required this.title,
  });

  Section.fromSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> snapshot)
      : sectionId = snapshot.id,
        courseId = snapshot.data()[courseIdFieldName],
        sectionOrder = snapshot.data()[sectionOrderFieldName] as int,
        title = snapshot.data()[titleFieldName] as String;
}
