import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prideofknowledge/data/cloud/cloud_constants.dart';
import 'package:prideofknowledge/data/models/category.dart';
import 'package:prideofknowledge/utilities/exceptions/firestore_exceptions.dart';

class CategoryRepository {
  final _firebase = FirebaseFirestore.instance;
  final categories = categoriesCollection;

  Future<List<Category>> getMainCategories() async {
    try {
      final snapshot = await _firebase
          .collection(categories)
          .where(isMainFieldName, isEqualTo: true)
          .get();
      return snapshot.docs
          .map(
            (doc) => Category.fromSnapshot(doc),
          )
          .toList();
    } on FirebaseException catch (e) {
      throw FirestoreException(
          'Failed to retreive Categories - Error Code: ${e.code}');
    } catch (e) {
      throw FirestoreException(
          'Failed to retreive Categories - Error Code: $e');
    }
  }
}
