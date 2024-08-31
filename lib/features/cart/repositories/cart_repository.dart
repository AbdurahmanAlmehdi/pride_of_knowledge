import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prideofknowledge/data/cloud/cloud_constants.dart';
import 'package:prideofknowledge/data/models/course.dart';
import 'package:prideofknowledge/utilities/exceptions/firestore_exceptions.dart';
import 'package:prideofknowledge/utilities/providers/general_provider.dart';

class CartRepository {
  final courses = coursesCollection;
  final users = usersCollection;
  final FirebaseFirestore _firestore;
  CartRepository({
    required firestore,
  }) : _firestore = firestore;

  Future<List<Course>> retrieveCartItems(List<String> itemIds) async {
    try {
      final snapshot = await _firestore
          .collection(courses)
          .where(FieldPath.documentId, whereIn: itemIds)
          .get();

      return snapshot.docs
          .where(
            (doc) => !doc.metadata.hasPendingWrites,
          )
          .map(
            (doc) => Course.fromSnapshot(doc),
          )
          .toList();
    } on FirebaseException catch (e) {
      throw FirestoreException(
          'Failed to retrieve cart items - Error Code: ${e.code}');
    } catch (e) {
      throw FirestoreException(
          'Failed to retrieve cart items - Error Code: $e');
    }
  }

  Future<bool> updateCart(
      {required List<String> cartItems,
      required String courseId,
      required String userId}) async {
    try {
      if (cartItems.contains(courseId)) {
        return false;
      } else {
        final updatedList = [...cartItems, courseId];
        await _firestore
            .collection(users)
            .doc(userId)
            .update({cartItemsFieldName: updatedList});
        return true;
      }
    } on FirebaseException catch (e) {
      throw FirestoreException('Failed to update cart - Error Code: ${e.code}');
    } catch (e) {
      throw FirestoreException('Failed to update cart - Error Code: $e');
    }
  }

  Future<bool> removeCartItem(
      {required List<String> cartItems,
      required String courseId,
      required String userId}) async {
    try {
      cartItems.remove(courseId);
      final updatedList = cartItems;
      await _firestore
          .collection(users)
          .doc(userId)
          .update({cartItemsFieldName: updatedList});
      return true;
    } on FirebaseException catch (e) {
      throw FirestoreException(
          'Failed to remove cart item - Error Code: ${e.code}');
    } catch (e) {
      throw FirestoreException('Failed to remove cart item - Error Code: $e');
    }
  }
}

final cartRepositoryProvider = Provider<CartRepository>((ref) {
  return CartRepository(firestore: ref.read(firestoreProvider));
});
