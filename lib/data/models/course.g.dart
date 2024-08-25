// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$courseImpl _$$courseImplFromJson(Map<String, dynamic> json) => _$courseImpl(
      courseId: json['courseId'] as String,
      categoryId: json['categoryId'] as String,
      createdAt: json['createdAt'] as String,
      creatorId: json['creatorId'] as String,
      title: json['title'] as String,
      price: (json['price'] as num).toInt(),
      currency: json['currency'] as String,
      rating: (json['rating'] as num).toDouble(),
      description: json['description'] as String,
      isLiked: json['isLiked'] as bool? ?? false,
      timesBought: (json['timesBought'] as num).toInt(),
      courseImage: json['courseImage'] as String,
    );

Map<String, dynamic> _$$courseImplToJson(_$courseImpl instance) =>
    <String, dynamic>{
      'courseId': instance.courseId,
      'categoryId': instance.categoryId,
      'createdAt': instance.createdAt,
      'creatorId': instance.creatorId,
      'title': instance.title,
      'price': instance.price,
      'currency': instance.currency,
      'rating': instance.rating,
      'description': instance.description,
      'isLiked': instance.isLiked,
      'timesBought': instance.timesBought,
      'courseImage': instance.courseImage,
    };
