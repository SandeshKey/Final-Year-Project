import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../core/model/property_model.dart';
import '../repository/favourite_property_repository.dart';

class FavoritePropertiesViewModel extends ChangeNotifier {
  String userId = FirebaseAuth.instance.currentUser!.uid;

  final FavoritePropertiesRepository _repository;

  FavoritePropertiesViewModel() : _repository = FavoritePropertiesRepository();

  //getter and setter for favourite property that work with toggle favouritw property



  // check either the property is favourite or not and toogle
  Future<void> toggleFavoriteProperty(PropertyModel property) async {
    if (await isFavoriteProperty(property)) {
      await removeFavoriteProperty(property);
    } else {
      await addFavoriteProperty(property);
    }
  }

  // write isFavouriteProperty 
  Future<bool> isFavoriteProperty(PropertyModel property) async {
    final List<PropertyModel> favoriteProperties = await getFavoriteProperties();
    return favoriteProperties.contains(property);
  }




  Future<void> addFavoriteProperty(PropertyModel property) async {
    print("add to favourite called");
    await _repository.addFavoriteProperty(
        userId, property );
  }

  Future<void> removeFavoriteProperty(PropertyModel property) async {
    await _repository.removeFavoriteProperty(userId, property);
  }

  Future<List<PropertyModel>> getFavoriteProperties() {
    return _repository.getFavoriteProperties(userId);
  }
}
