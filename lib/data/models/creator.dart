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

  Creator.fromSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> snapshot)
      : creatorId = snapshot.id,
        name = snapshot.data()[nameFieldName] as String,
        specialty = snapshot.data()[specialtyFieldName] as String,
        facebookLink = snapshot.data()[facebookLinkFieldName] as String,
        image = snapshot.data()[imageFieldName] as String,
        rating = snapshot.data()[ratingFieldName] as double,
        coursesCreated = snapshot.data()[coursesCreatedFieldName] as int;
}
