// needs improvement will be improved

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import '../model/property_model.dart';
import '../model/user.dart';

class DatabaseServices {
  FirebaseFirestore database = FirebaseFirestore.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  CollectionReference properties =
      FirebaseFirestore.instance.collection('properties');

  Future<AppUser> getUserData(String userId) async {
    var data = await users.doc(userId).get();

    final appuser = AppUser.fromMap(data.data() as Map<String, dynamic>);

    return appuser;
  }

  Future<void> addProperty(PropertyModel property) async {
    print("Attermpting to add property");
    await properties.doc().set(property.toMap());
    if (kDebugMode) {
      print(" Added property");
    }
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
    print("hauser id is ${haUser.uid}");
    await users
        .doc(haUser.uid)
        .update(
          haUser.userToMap(),
        )
        .then((_) => print("User Updated"));
  }

  Future<List<PropertyModel>> getProperties() async {
    List<PropertyModel> propertiesList = [];
    // QuerySnapshot propertyQuerySnap =
    //   await properties.get();

    await properties.get().then((value) {
      print(value.docs.length);

      for (int i = 0; i < value.docs.length; i++) {
        PropertyModel property =
            PropertyModel.fromMap(value.docs[i].data() as Map);
        property.id = value.docs[i].id;
        print(property.id);
        try {
          propertiesList.add(property);
          print("Property added successfully");
        } catch (e) {}
      }
    });

    print(propertiesList.toString());

    print("Length of properties from services ${propertiesList.length} ");
    return propertiesList;
  }
}
