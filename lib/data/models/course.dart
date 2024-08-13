import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:prideofknowledge/data/cloud/cloud_constants.dart';

class Course {
  final String courseId;
  final String title;
  final int price;
  final String currency;
  final String creatorId;
  final double rating;
  final String description;
  final bool isLiked;
  final int timesBought;
  final String courseImage;
  final String categoryId;
  final DateTime createdAt;

  Course(
      {required this.courseId,
      required this.categoryId,
      required this.createdAt,
      required this.creatorId,
      required this.title,
      required this.price,
      required this.currency,
      required this.rating,
      required this.description,
      required this.isLiked,
      required this.timesBought,
      required this.courseImage});

  Course.fromSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> snapshot)
      : courseId = snapshot.id,
        createdAt = snapshot.data()[createdAtFieldName],
        categoryId = snapshot.data()[categoryIdFieldName],
        creatorId = snapshot.data()[creatorIdFieldName],
        title = snapshot.data()[titleFieldName] as String,
        currency = snapshot.data()[currencyFieldName] as String,
        description = snapshot.data()[descriptionFieldName] as String,
        courseImage = snapshot.data()[courseImageFieldName] as String,
        rating = snapshot.data()[ratingFieldName] as double,
        price = snapshot.data()[priceFieldName] as int,
        timesBought = snapshot.data()[timesBoughtFieldName] as int,
        isLiked = snapshot.data()[isLikedFieldName];
}
