class FirestoreException implements Exception {
  final String message;
  final String? devDetails;
  final String? prettyDetails;

  FirestoreException({
    required this.message,
    this.devDetails,
    this.prettyDetails,
  });

  @override
  String toString() {
    return 'FirestoreException: $message ${devDetails != null ? '- $devDetails' : ''}';
  }
}
