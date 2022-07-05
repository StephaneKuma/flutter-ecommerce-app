import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/src/exceptions/firestore_exception.dart';
import 'package:ecommerce/src/models/checkout.dart';

class CheckoutRepository {
  final CollectionReference _checkoutCollectionReference =
      FirebaseFirestore.instance.collection('checkouts');

  Future<void> createOrSync({required Checkout entity}) async {
    try {
      await _checkoutCollectionReference.add(entity.toMap());
    } catch (error) {
      throw FirestoreException(
        message: 'Failed to checkout (new) user',
        devDetails: '$error',
      );
    }
  }
}
