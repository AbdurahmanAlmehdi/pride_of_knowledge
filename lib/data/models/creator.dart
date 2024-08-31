import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prideofknowledge/data/cloud/cloud_constants.dart';

class Creator {
  final String creatorId;
  final String name;
  final String specialty;
  final String facebookLink;
  final String image;
  final double rating;
  final int coursesCreated;

  Creator(
      {required this.rating,
      required this.creatorId,
      required this.coursesCreated,
      required this.image,
      required this.name,
      required this.specialty,
      required this.facebookLink});

  static Creator empty() {
    return Creator(
      rating: 0,
      creatorId: '',
      coursesCreated: 0,
      image: '',
      name: '',
      specialty: '',
      facebookLink: '',
    );
  }

  factory Creator.fromQuerySnapshot(
      QueryDocumentSnapshot<Map<String, dynamic>> snapshot) {
    final doc = snapshot.data();
    if (doc.isNotEmpty) {
      return Creator(
        creatorId: snapshot.id,
        rating: (doc[ratingFieldName] as num).toDouble(),
        coursesCreated: doc[coursesCreatedFieldName] ?? 0,
        image: doc[imageFieldName] ?? '',
        name: doc[nameFieldName] ?? 'Unknown',
        specialty: doc[specialtyFieldName] ?? 'none',
        facebookLink: doc[facebookLinkFieldName] ?? 'null',
      );
    } else {
      return Creator.empty();
    }
  }
  factory Creator.fromDocSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final doc = snapshot.data();
    if (doc != null) {
      return Creator(
        creatorId: snapshot.id,
        rating: (doc[ratingFieldName] as num).toDouble(),
        coursesCreated: doc[coursesCreatedFieldName] ?? 0,
        image: doc[imageFieldName] ?? '',
        name: doc[nameFieldName] ?? 'Unknown',
        specialty: doc[specialtyFieldName] ?? 'none',
        facebookLink: doc[facebookLinkFieldName] ?? 'null',
      );
    } else {
      return Creator.empty();
    }
  }
}
