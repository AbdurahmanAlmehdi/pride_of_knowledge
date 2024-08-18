import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:prideofknowledge/data/cloud/cloud_constants.dart';

class Category {
  final String categoryId;
  final String name;
  final String icon;
  final String image;
  final bool isMain;
  final String parentId;

  Category({
    required this.categoryId,
    this.parentId = '',
    required this.isMain,
    required this.name,
    required this.icon,
    required this.image,
  });

  static Category empty() {
    return Category(
        categoryId: '', isMain: false, name: '', icon: '', image: '');
  }

  factory Category.fromSnapshot(
      QueryDocumentSnapshot<Map<String, dynamic>> snapshot) {
    if (snapshot.data().isNotEmpty) {
      final doc = snapshot.data();
      return Category(
        categoryId: snapshot.id,
        isMain: doc[isMainFieldName] ?? false,
        name: doc[nameFieldName] ?? 'Unknown',
        icon: doc[iconFieldName] ?? '',
        image: doc[imageFieldName] ?? '',
      );
    } else {
      return Category.empty();
    }
  }
}
