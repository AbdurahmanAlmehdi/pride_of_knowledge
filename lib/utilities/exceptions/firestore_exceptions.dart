class FirestoreException implements Exception {
  final String message;
  FirestoreException(this.message);

  @override
  String toString() => message;
}
