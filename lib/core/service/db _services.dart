// needs improvement will be improved

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dufuna/core/model/user.dart';

import '../model/property_model.dart';

class DatabaseServices {
  FirebaseFirestore database = FirebaseFirestore.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  CollectionReference properties =
      FirebaseFirestore.instance.collection('properties');

  Future<void> addProperty(PropertyModel property) async {
    print("Attermpting to add property");
    await properties.doc().set(property.toMap());
    print(" Added property");
  }

  Future<void> updateProperty(
    PropertyModel property,
  ) async {
    await properties
        .doc(property.id.toString())
        .update(
          property.toMap(),
        )
        .then((_) => print("Property Updated"));
  }

  // delete property
  Future<void> deleteProperty(String propertyId) async {
    await properties.doc(propertyId).delete();
  }

  Future<void> addUser(AppUser haUser) async {
    await users.doc(haUser.uid).set(haUser.userToMap());
  }

  Future<void> updateUser(
    AppUser haUser,
  ) async {
    await users
        .doc(haUser.uid)
        .update(
          haUser.userToMap(),
        )
        .then((_) => print("User Updated"));
  }

  getUserData(String userId) async {
    var data = await users.doc(userId).get();
    return data.data() as Map;
  }
}
