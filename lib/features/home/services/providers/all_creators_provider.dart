import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prideofknowledge/data/cloud/cloud_constants.dart';
import 'package:prideofknowledge/data/models/creator.dart';

final allCreatorsProvider = FutureProvider<List<Creator>>(
  (ref) async {
    try {
      final snapshot =
          await FirebaseFirestore.instance.collection(creatorsCollection).get();

      final data = snapshot.docs
          .map(
            (document) => Creator.fromSnapshot(document),
          )
          .toList();
      return data;
    } on FirebaseException catch (e) {
      throw e.code;
    }
  },
);
