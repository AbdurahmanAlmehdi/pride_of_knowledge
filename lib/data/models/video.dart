import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prideofknowledge/data/cloud/cloud_constants.dart';

class Video {
  final String videoId;
  final String sectionId;
  final String title;
  final String videoUrl;
  final int videoOrder;
  final int videoLength;

  Video({
    required this.videoId,
    required this.sectionId,
    required this.title,
    required this.videoUrl,
    required this.videoOrder,
    required this.videoLength,
  });

  static Video empty() => Video(
      videoId: '',
      videoOrder: 0,
      videoLength: 0,
      sectionId: '',
      title: '',
      videoUrl: '');

  factory Video.fromSnapshot(
      QueryDocumentSnapshot<Map<String, dynamic>> snapshot) {
    if (snapshot.data().isNotEmpty) {
      final data = snapshot.data();
      return Video(
        videoId: snapshot.id,
        sectionId: data[sectionIdFieldName] ?? '',
        title: data[titleFieldName] ?? '',
        videoUrl: data[videoUrlFieldName] ?? '',
        videoOrder: (data[videoOrderFieldName] as num).toInt(),
        videoLength: (data[videoLenghtFieldName] as num).toInt(),
      );
    } else {
      return Video.empty();
    }
  }
}
