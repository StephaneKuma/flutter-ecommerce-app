/// Cloud Firestore API
///
/// Defines some basics crud methods
///
/// Must be implemented by any class wich commnicate with firestore
/// Replace your [entity] eg. [Category] with the [T] entity
abstract class FirestoreApi<T> {
  /// Retrieve all entities from the database
  Future<List<T>?> readEntitiesOnceOff();

  /// Retrieve all entities from the database
  /// If any changes occurs it'll fetch automatically the new records from the database
  Stream<List<T>?> listenToEntities();
}
