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
  final String createdAt;

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

  static Course empty() => Course(
        courseId: '',
        categoryId: '',
        createdAt: '',
        creatorId: '',
        title: '',
        price: 0,
        currency: '',
        rating: 0.0,
        description: '',
        isLiked: false,
        timesBought: 0,
        courseImage: '',
      );

//Review to make improvements
  Course.fromSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> snapshot)
      : courseId = snapshot.id,
        createdAt = snapshot.data()[createdAtFieldName] ?? '',
        categoryId = snapshot.data()[categoryIdFieldName] ?? '',
        creatorId = snapshot.data()[creatorIdFieldName] ?? '',
        title = snapshot.data()[titleFieldName] ?? '',
        currency = snapshot.data()[currencyFieldName] ?? '',
        description = snapshot.data()[descriptionFieldName] ?? '',
        courseImage = snapshot.data()[courseImageFieldName] ?? '',
        rating = (snapshot.data()[ratingFieldName] as num).toDouble(),
        price = (snapshot.data()[priceFieldName] as num).toInt(),
        timesBought = snapshot.data()[timesBoughtFieldName] ?? 0,
        isLiked = snapshot.data()[isLikedFieldName] ?? false;
}
