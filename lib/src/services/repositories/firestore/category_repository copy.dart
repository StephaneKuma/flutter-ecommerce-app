// ignore_for_file: file_names

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/src/exceptions/firestore_exception.dart';
import 'package:ecommerce/src/models/category.dart';
import 'package:flutter/services.dart';

import 'firestore_api.dart';

class CategoryRepository implements FirestoreApi<Category> {
  final CollectionReference<Category> _categoriesCollectionReference =
      FirebaseFirestore.instance
          .collection('categories')
          .withConverter<Category>(
            fromFirestore: (snapshot, _) =>
                Category.fromMap(map: snapshot.data()!),
            toFirestore: (category, _) => category.toMap(),
          );

  final StreamController<List<Category>?> _categoriesController =
      StreamController<List<Category>?>.broadcast();

  @override
  Stream<List<Category>?> listenToEntities() {
    // Register the handler for when the categories data changes
    _categoriesCollectionReference.snapshots().listen((snapshot) {
      if (snapshot.docs.isEmpty) {
        // Add null onto the controller
        _categoriesController.add(null);
      } else {
        var categories =
            snapshot.docs.map<Category>((snapshot) => snapshot.data()).toList();

        // Add the categories onto the controller
        _categoriesController.add(categories);
      }
    });

    return _categoriesController.stream;
  }

  @override
  Future<List<Category>?> readEntitiesOnceOff() async {
    try {
      var snapshot = await _categoriesCollectionReference.get();

      if (snapshot.docs.isEmpty) {
        return null;
      }

      return snapshot.docs.map<Category>((snapshot) => snapshot.data()).toList();
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
