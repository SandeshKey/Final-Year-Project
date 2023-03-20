import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../core/model/property_model.dart';

class MiniFilterViewModel extends ChangeNotifier {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  CollectionReference properties =
      FirebaseFirestore.instance.collection('properties');
  String _currentFilter = "";
  String get currentFilter => _currentFilter;

  List<PropertyModel> _mfProperties = [];
  List<PropertyModel> get mfProperties => _mfProperties;
  List<PropertyModel> _mfUrgentProperties = [];
  List<PropertyModel> get mfUrgentProperties => _mfUrgentProperties;
  List<PropertyModel> _mfPremiumProperties = [];
  List<PropertyModel> get mfPremiumProperties => _mfPremiumProperties;
  List<PropertyModel> _mfFeaturedProperties = [];
  List<PropertyModel> get mfFeaturedProperties => _mfFeaturedProperties;

  void setCurrentFilter(String value) {
    _currentFilter = value;
    notifyListeners();
  }

  void setPremiumMfProperties() async {
    // _mfProperties = properties.get();
    final querySnapshot = properties.where('isPremium', isEqualTo: false).get();
    final querySnapshot1 =
        properties.where('isPremium', isEqualTo: false).limit(5).get();
    _mfProperties = await querySnapshot.then((value) =>
        value.docs.map((e) => PropertyModel.fromMap(e.data() as Map)).toList());
    _mfPremiumProperties = await querySnapshot1.then((value) =>
        value.docs.map((e) => PropertyModel.fromMap(e.data() as Map)).toList());

    notifyListeners();
  }

  void setUrgentMfProperties() async {
    final querySnapshot = properties.where('isUrgent', isEqualTo: true).get();
    final querySnapshot1 =
        properties.where('isUrgent', isEqualTo: true).limit(5).get();
    _mfProperties = await querySnapshot.then((value) =>
        value.docs.map((e) => PropertyModel.fromMap(e.data() as Map)).toList());

    notifyListeners();
  }

  void setFeaturedMfProperties() async {
    final querySnapshot = properties.where('isFeatured', isEqualTo: true).get();
    final querySnapshot1 =
        properties.where('isFeatured', isEqualTo: true).limit(5).get();
    _mfProperties = await querySnapshot.then((value) =>
        value.docs.map((e) => PropertyModel.fromMap(e.data() as Map)).toList());
    _mfFeaturedProperties = await querySnapshot1.then((value) =>
        value.docs.map((e) => PropertyModel.fromMap(e.data() as Map)).toList());

    notifyListeners();
  }
}
