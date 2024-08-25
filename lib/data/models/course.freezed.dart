// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'course.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Course _$CourseFromJson(Map<String, dynamic> json) {
  return _course.fromJson(json);
}

/// @nodoc
mixin _$Course {
  String get courseId => throw _privateConstructorUsedError;
  String get categoryId => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get creatorId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  bool get isLiked => throw _privateConstructorUsedError;
  int get timesBought => throw _privateConstructorUsedError;
  String get courseImage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CourseCopyWith<Course> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CourseCopyWith<$Res> {
  factory $CourseCopyWith(Course value, $Res Function(Course) then) =
      _$CourseCopyWithImpl<$Res, Course>;
  @useResult
  $Res call(
      {String courseId,
      String categoryId,
      String createdAt,
      String creatorId,
      String title,
      int price,
      String currency,
      double rating,
      String description,
      bool isLiked,
      int timesBought,
      String courseImage});
}

/// @nodoc
class _$CourseCopyWithImpl<$Res, $Val extends Course>
    implements $CourseCopyWith<$Res> {
  _$CourseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? courseId = null,
    Object? categoryId = null,
    Object? createdAt = null,
    Object? creatorId = null,
    Object? title = null,
    Object? price = null,
    Object? currency = null,
    Object? rating = null,
    Object? description = null,
    Object? isLiked = null,
    Object? timesBought = null,
    Object? courseImage = null,
  }) {
    return _then(_value.copyWith(
      courseId: null == courseId
          ? _value.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      creatorId: null == creatorId
          ? _value.creatorId
          : creatorId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      isLiked: null == isLiked
          ? _value.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool,
      timesBought: null == timesBought
          ? _value.timesBought
          : timesBought // ignore: cast_nullable_to_non_nullable
              as int,
      courseImage: null == courseImage
          ? _value.courseImage
          : courseImage // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$courseImplCopyWith<$Res> implements $CourseCopyWith<$Res> {
  factory _$$courseImplCopyWith(
          _$courseImpl value, $Res Function(_$courseImpl) then) =
      __$$courseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String courseId,
      String categoryId,
      String createdAt,
      String creatorId,
      String title,
      int price,
      String currency,
      double rating,
      String description,
      bool isLiked,
      int timesBought,
      String courseImage});
}

/// @nodoc
class __$$courseImplCopyWithImpl<$Res>
    extends _$CourseCopyWithImpl<$Res, _$courseImpl>
    implements _$$courseImplCopyWith<$Res> {
  __$$courseImplCopyWithImpl(
      _$courseImpl _value, $Res Function(_$courseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? courseId = null,
    Object? categoryId = null,
    Object? createdAt = null,
    Object? creatorId = null,
    Object? title = null,
    Object? price = null,
    Object? currency = null,
    Object? rating = null,
    Object? description = null,
    Object? isLiked = null,
    Object? timesBought = null,
    Object? courseImage = null,
  }) {
    return _then(_$courseImpl(
      courseId: null == courseId
          ? _value.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      creatorId: null == creatorId
          ? _value.creatorId
          : creatorId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      isLiked: null == isLiked
          ? _value.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool,
      timesBought: null == timesBought
          ? _value.timesBought
          : timesBought // ignore: cast_nullable_to_non_nullable
              as int,
      courseImage: null == courseImage
          ? _value.courseImage
          : courseImage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$courseImpl implements _course {
  const _$courseImpl(
      {required this.courseId,
      required this.categoryId,
      required this.createdAt,
      required this.creatorId,
      required this.title,
      required this.price,
      required this.currency,
      required this.rating,
      required this.description,
      this.isLiked = false,
      required this.timesBought,
      required this.courseImage});

  factory _$courseImpl.fromJson(Map<String, dynamic> json) =>
      _$$courseImplFromJson(json);

  @override
  final String courseId;
  @override
  final String categoryId;
  @override
  final String createdAt;
  @override
  final String creatorId;
  @override
  final String title;
  @override
  final int price;
  @override
  final String currency;
  @override
  final double rating;
  @override
  final String description;
  @override
  @JsonKey()
  final bool isLiked;
  @override
  final int timesBought;
  @override
  final String courseImage;

  @override
  String toString() {
    return 'Course(courseId: $courseId, categoryId: $categoryId, createdAt: $createdAt, creatorId: $creatorId, title: $title, price: $price, currency: $currency, rating: $rating, description: $description, isLiked: $isLiked, timesBought: $timesBought, courseImage: $courseImage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$courseImpl &&
            (identical(other.courseId, courseId) ||
                other.courseId == courseId) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.creatorId, creatorId) ||
                other.creatorId == creatorId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.isLiked, isLiked) || other.isLiked == isLiked) &&
            (identical(other.timesBought, timesBought) ||
                other.timesBought == timesBought) &&
            (identical(other.courseImage, courseImage) ||
                other.courseImage == courseImage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      courseId,
      categoryId,
      createdAt,
      creatorId,
      title,
      price,
      currency,
      rating,
      description,
      isLiked,
      timesBought,
      courseImage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$courseImplCopyWith<_$courseImpl> get copyWith =>
      __$$courseImplCopyWithImpl<_$courseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$courseImplToJson(
      this,
    );
  }
}

abstract class _course implements Course {
  const factory _course(
      {required final String courseId,
      required final String categoryId,
      required final String createdAt,
      required final String creatorId,
      required final String title,
      required final int price,
      required final String currency,
      required final double rating,
      required final String description,
      final bool isLiked,
      required final int timesBought,
      required final String courseImage}) = _$courseImpl;

  factory _course.fromJson(Map<String, dynamic> json) = _$courseImpl.fromJson;

  @override
  String get courseId;
  @override
  String get categoryId;
  @override
  String get createdAt;
  @override
  String get creatorId;
  @override
  String get title;
  @override
  int get price;
  @override
  String get currency;
  @override
  double get rating;
  @override
  String get description;
  @override
  bool get isLiked;
  @override
  int get timesBought;
  @override
  String get courseImage;
  @override
  @JsonKey(ignore: true)
  _$$courseImplCopyWith<_$courseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
