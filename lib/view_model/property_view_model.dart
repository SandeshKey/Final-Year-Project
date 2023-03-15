import 'package:dufuna/core/model/property.dart';
import 'package:dufuna/core/model/property_model.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

enum PropertyType {
  house,
  land,
}

enum VerificationStatus {
  verified,
  unverified,
}

class PropertyViewModel extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<Map<String, dynamic>> _properties = [];
  List<Map<String, dynamic>> _filteredProperties = [];
  PropertyType? _selectedType;
  VerificationStatus? _selectedVerificationStatus;
  List<PropertyModel> _unverifiedProperties = [];
  List<PropertyModel> get unverifiedProperties => _unverifiedProperties;


  Future<List<PropertyModel>> getUnverifiedProperties ()async{
    return await  _firestore.collection('properties').where('status', isEqualTo: "unverified").get().then((value) => value.docs.map((e) => PropertyModel.fromMap(e.data())).toList());
  }

  Future<List<PropertyModel>> getVerifiedProperties ()async{
    return await  _firestore.collection('properties').where('status', isEqualTo: "verified").get().then((value) => value.docs.map((e) => PropertyModel.fromMap(e.data())).toList());
  }

  Future<List<PropertyModel>> getUrgentProperties()async {
    return await  _firestore.collection('properties').where('priority', isEqualTo: "urgent").get().then((value) => value.docs.map((e) => PropertyModel.fromMap(e.data())).toList());
  }

  Future<List<PropertyModel>> getPremiumProperties()async {
    return await  _firestore.collection('properties').where('priority', isEqualTo: "premium").get().then((value) => value.docs.map((e) => PropertyModel.fromMap(e.data())).toList());
  }

  Future<List<PropertyModel>> getHouses() async {
    return await  _firestore.collection('properties').where('type', isEqualTo: "house").get().then((value) => value.docs.map((e) => PropertyModel.fromMap(e.data())).toList());
  }

  // get lands
  Future<List<PropertyModel>> getLands() async {
    return await  _firestore.collection('properties').where('type', isEqualTo: "land").get().then((value) => value.docs.map((e) => PropertyModel.fromMap(e.data())).toList());
  }



  // Get all properties from Firebase Firestore
  Future<void> getAllProperties() async {
    try {
      final QuerySnapshot querySnapshot =
          await _firestore.collection('properties').get();
      _properties = querySnapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
      _filteredProperties = _properties;
      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
  }

  // Filter properties based on selected type and verification status
  void filterProperties() {
    if (_selectedType != null && _selectedVerificationStatus != null) {
      _filteredProperties = _properties
          .where((property) =>
              property['type'] == _selectedType.toString().split('.')[1] &&
              property['verified'] ==
                  (_selectedVerificationStatus == VerificationStatus.verified))
          .toList();
    } else if (_selectedType != null) {
      _filteredProperties = _properties
          .where((property) =>
              property['type'] == _selectedType.toString().split('.')[1])
          .toList();
    } else if (_selectedVerificationStatus != null) {
      _filteredProperties = _properties
          .where((property) =>
              property['verified'] ==
              (_selectedVerificationStatus == VerificationStatus.verified))
          .toList();
    } else {
      _filteredProperties = _properties;
    }
    notifyListeners();
  }

  // Setter methods for selected type and verification status
  void setSelectedType(PropertyType type) {
    _selectedType = type;
    filterProperties();
  }

  void setSelectedVerificationStatus(VerificationStatus status) {
    _selectedVerificationStatus = status;
    filterProperties();
  }

  // Getter methods for filtered properties
  List<Map<String, dynamic>> getFilteredProperties() {
    return _filteredProperties;
  }

  // Search properties by name
  void searchProperties(String query) {
    if (query.isNotEmpty) {
      _filteredProperties = _filteredProperties
          .where((property) =>
              property['name'].toLowerCase().contains(query.toLowerCase()))
          .toList();
    } else {
      _filteredProperties = _properties;
    }
    notifyListeners();
  }
}
