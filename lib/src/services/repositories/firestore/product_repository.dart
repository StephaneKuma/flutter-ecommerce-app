import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/src/exceptions/firestore_exception.dart';
import 'package:ecommerce/src/models/product.dart';
import 'package:flutter/services.dart';

import 'firestore_api.dart';

class ProductRepository implements FirestoreApi<Product> {
  final CollectionReference<Product> _productsCollectionReference =
      FirebaseFirestore.instance.collection('products').withConverter<Product>(
            fromFirestore: (snapshot, _) => Product.fromMap(
              map: snapshot.data()!,
            ),
            toFirestore: (product, _) => product.toMap(),
          );

  final StreamController<List<Product>?> _productsController =
      StreamController<List<Product>?>.broadcast();

  @override
  Stream<List<Product>?> listenToEntities() {
    // Register the handler for when the products data changes
    _productsCollectionReference.snapshots().listen((snapshot) {
      if (snapshot.docs.isEmpty) {
        // Add null onto the controller
        _productsController.add(null);
      } else {
        var products =
            snapshot.docs.map<Product>((snapshot) => snapshot.data()).toList();

        // Add the products onto the controller
        _productsController.add(products);
      }
    });

    return _productsController.stream;
  }

  @override
  Future<List<Product>?> readEntitiesOnceOff() async {
    try {
      var snapshot = await _productsCollectionReference.get();

      if (snapshot.docs.isEmpty) {
        return null;
      }

      return snapshot.docs.map<Product>((snapshot) => snapshot.data()).toList();
    } catch (error) {
      if (error is PlatformException) {
        throw FirestoreException(
          message: 'Something bad happened on Firebase platform',
          devDetails: '$error',
        );
      }

      throw FirestoreException(
        message: 'Something went wrong',
        devDetails: '$error',
      );
    }
  }
}
