import 'package:prideofknowledge/data/models/course.dart';

final testCourse = Course(
  courseId: 'course10',
  title: 'AWS Certified Solutions Architect',
  price: 230,
  currency: 'USD',
  creatorId: 'creator7',
  rating: 4.8,
  description:
      'Prepare for the AWS Certified Solutions Architect exam and master AWS cloud services.',
  isLiked: false,
  timesBought: 290,
  courseImage: 'https://example.com/aws.jpg',
  categoryId: 'category6',
  createdAt: DateTime.now().subtract(const Duration(days: 110)),
);
