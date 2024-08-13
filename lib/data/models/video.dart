import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prideofknowledge/data/cloud/cloud_constants.dart';

class Video {
  final String title;
  final String videoUrl;
  final int videoOrder;
  final double videoLength;
  final String sectionId;

  Video({
    required this.videoOrder,
    required this.videoLength,
    required this.sectionId,
    required this.title,
    required this.videoUrl,
  });

  Video.fromSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> snapshot)
      : sectionId = snapshot.data()[sectionIdFieldName],
        title = snapshot.data()[titleFieldName] as String,
        videoUrl = snapshot.data()[videoUrlFieldName] as String,
        videoOrder = snapshot.data()[videoOrderFieldName] as int,
        videoLength = snapshot.data()[videoLenghtFieldName] as double;
}
