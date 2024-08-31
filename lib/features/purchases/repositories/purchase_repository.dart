// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:prideofknowledge/data/cloud/cloud_constants.dart';
import 'package:prideofknowledge/data/models/course.dart';
import 'package:prideofknowledge/utilities/exceptions/firestore_exceptions.dart';
import 'package:prideofknowledge/utilities/providers/general_provider.dart';

class PurchaseRepository {
  final courses = coursesCollection;
  final users = usersCollection;
  final FirebaseFirestore _firestore;
  PurchaseRepository({
    required firestore,
  }) : _firestore = firestore;

  Future<List<Course>> retrievePurchasedCourses(List<String> courseIds) async {
    try {
      final snapshot = await _firestore
          .collection(courses)
          .where(FieldPath.documentId, whereIn: courseIds)
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
          'Failed to retrieve all courses - Error Code: ${e.code}');
    } catch (e) {
      throw FirestoreException(
          'Failed to retrieve all courses - Error Code: $e');
    }
  }

  Future<bool> updatePurchasedCourse(
      List<String> purchasedCourses, String courseId, String userId) async {
    try {
      final updatedList = [...purchasedCourses, courseId];
      await _firestore
          .collection(users)
          .doc(userId)
          .update({purchasedCoursesFieldName: updatedList});
      return true;
    } on FirebaseException catch (e) {
      throw FirestoreException(
          'Failed to update puchased courses - Error Code: ${e.code}');
    } catch (e) {
      throw FirestoreException(
          'Failed to update puchased courses - Error Code: $e');
    }
  }

  Future<void> updateBalance(
      {required int newBalance, required String userId}) async {
    try {
      await _firestore
          .collection(users)
          .doc(userId)
          .update({balanceFieldName: newBalance});
    } on FirebaseException catch (e) {
      throw FirestoreException(
          'Failed to update balance - Error Code: ${e.code}');
    } catch (e) {
      throw FirestoreException('Failed to update balance - Error Code: $e');
    }
  }
}

final purchaseRepositoryProvider = Provider<PurchaseRepository>((ref) {
  return PurchaseRepository(firestore: ref.read(firestoreProvider));
});
