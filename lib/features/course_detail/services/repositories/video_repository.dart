import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prideofknowledge/data/cloud/cloud_constants.dart';
import 'package:prideofknowledge/data/models/video.dart';
import 'package:prideofknowledge/utilities/exceptions/firestore_exceptions.dart';

class VideoRepository {
  final FirebaseFirestore _firebase;
  VideoRepository({
    required firebase,
  }) : _firebase = firebase;
  final videos = videosCollection;

  Future<List<Video>> retreiveVideos(String sectionId) async {
    try {
      final snapshot = await _firebase
          .collection(videos)
          .orderBy(videoOrderFieldName, descending: false)
          .get();

      final data = snapshot.docs
          .where(
            (doc) => doc[sectionIdFieldName] == sectionId,
          )
          .map(
            (document) => Video.fromSnapshot(document),
          )
          .toList();
      return data;
    } on FirebaseException catch (e) {
      throw FirestoreException(
          'Failed to retrieve videos - Error Code: ${e.code}');
    } catch (e) {
      throw FirestoreException('Failed to retrieve videos - Error Code: $e');
    }
  }
}
