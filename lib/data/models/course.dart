import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'course.freezed.dart';
part 'course.g.dart';

@freezed
class Course with _$Course {
  const factory Course(
      {required String courseId,
      required String categoryId,
      required String createdAt,
      required String creatorId,
      required String title,
      required int price,
      required String currency,
      required double rating,
      required String description,
      @Default(false) bool isLiked,
      required int timesBought,
      required String courseImage}) = _course;

  factory Course.fromJson(Map<String, Object?> json) => _$CourseFromJson(json);

  factory Course.fromSnapshot(
      QueryDocumentSnapshot<Map<String, dynamic>> snapshot) {
    final docs = snapshot.data();
    return Course.fromJson(docs);
  }
}
