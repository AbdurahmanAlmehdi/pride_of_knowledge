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

  static Section empty() =>
      Section(sectionId: '', courseId: '', sectionOrder: 0, title: '');

  factory Section.fromSnapshot(
      QueryDocumentSnapshot<Map<String, dynamic>> snapshot) {
    if (snapshot.data().isNotEmpty) {
      final data = snapshot.data();
      return Section(
        sectionId: snapshot.id,
        courseId: data[courseIdFieldName] ?? '',
        sectionOrder: data[sectionOrderFieldName] ?? 0,
        title: data[titleFieldName] ?? '',
      );
    } else {
      return Section.empty();
    }
  }
}
