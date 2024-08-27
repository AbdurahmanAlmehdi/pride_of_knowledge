import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prideofknowledge/data/cloud/cloud_constants.dart';

class Section {
  final String sectionId;
  final String courseId;
  final int sectionOrder;
  final String title;
  final int sectionMins;

  Section({
    required this.sectionId,
    required this.courseId,
    required this.sectionOrder,
    required this.title,
    required this.sectionMins,
  });

  static Section empty() => Section(
      sectionId: '', courseId: '', sectionOrder: 0, title: '', sectionMins: 0);

  factory Section.fromSnapshot(
      QueryDocumentSnapshot<Map<String, dynamic>> snapshot) {
    if (snapshot.data().isNotEmpty) {
      final data = snapshot.data();
      return Section(
        sectionId: snapshot.id,
        courseId: data[courseIdFieldName] ?? '',
        sectionOrder: (data[sectionOrderFieldName] as num).toInt(),
        sectionMins: (data[sectionMinsFieldName] as num).toInt(),
        title: data[titleFieldName] ?? '',
      );
    } else {
      return Section.empty();
    }
  }
}
