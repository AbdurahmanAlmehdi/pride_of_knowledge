import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prideofknowledge/data/cloud/cloud_constants.dart';
import 'package:prideofknowledge/data/models/creator.dart';
import 'package:prideofknowledge/utilities/exceptions/firestore_exceptions.dart';

class CreatorRepository {
  final _firebase = FirebaseFirestore.instance;
  final creators = creatorsCollection;

  Future<List<Creator>> getTopRatedCreators() async {
    try {
      final snapshot = await _firebase
          .collection(creators)
          .where(ratingFieldName, isGreaterThan: 4.5)
          .limit(15)
          .get();
      return snapshot.docs
          .map(
            (doc) => Creator.fromSnapshot(doc),
          )
          .toList();
    } on FirebaseException catch (e) {
      throw FirestoreException(
          'Failed to retreive creators - Error Code: ${e.code}');
    } catch (e) {
      throw FirestoreException('Failed to retreive creators - Error Code: $e');
    }
  }
}
