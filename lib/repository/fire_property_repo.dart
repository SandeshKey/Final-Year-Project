import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:olivehomes/core/model/property_model.dart';

class DatabaseServices {
  FirebaseFirestore database = FirebaseFirestore.instance;

  CollectionReference properties =
      FirebaseFirestore.instance.collection('properties');

  Future<void> addProperty(PropertyModel property) async {
    await properties.doc(property.id!.toString()).set(property.toMap());
  }

// get Property

  // Update Property
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

  getPropertyData(String propertyId) async {
    var data = await properties.doc(propertyId).get();
    return data.data() as Map;
  }

  // get property
  Future<List<PropertyModel>> getProperties(String propertyId) async {
    List<PropertyModel> property = [];
    QuerySnapshot propertyQuerySnap =
        await properties.doc(propertyId).collection("Property property").get();

    for (var properties in propertyQuerySnap.docs) {
      Map<String, dynamic> recordData =
          properties.data() as Map<String, dynamic>;
      property.add(PropertyModel.fromMap(recordData));
    }

    return property;
  }
}

  // Future<void> addRecord(String propertyId, Record record) async {
  //   await properties
  //       .doc(propertyId)
  //       .collection("Property property")
  //       .add(record.recordToMap())
  //       .then((value) => print("Record Added"));
  // }

  // Future<void> editRecord(String docId, String propertyId, Record record) async {
  //   await properties
  //       .doc(propertyId)
  //       .collection("Property property")
  //       .doc(docId)
  //       .update(record.recordToMap())
  //       .then((value) => print("Record updated"));
  // }

  // Future<void> deleteRecord(String docId, String propertyId) async {
  //   await properties
  //       .doc(propertyId)
  //       .collection("Property property")
  //       .doc(docId)
  //       .delete()
  //       .then((value) => print("Record deleted"));
  // }
