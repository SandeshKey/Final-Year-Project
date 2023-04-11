import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../core/model/property_model.dart';
import '../repository/favourite_property_repository.dart';

class FavoritePropertiesViewModel extends ChangeNotifier {
  String userId = FirebaseAuth.instance.currentUser!.uid;

  final FavoritePropertiesRepository _repository;

  FavoritePropertiesViewModel() : _repository = FavoritePropertiesRepository();

  Future<void> addFavoriteProperty(PropertyModel property) async {
    print("add to favourite called");
    await _repository.addFavoriteProperty(
        userId, property );
  }

  Future<List<PropertyModel>> getFavoriteProperties() {
    return _repository.getFavoriteProperties(userId);
  }
}
