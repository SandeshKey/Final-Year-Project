import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../core/model/property_model.dart';

class AdminViewModel extends ChangeNotifier {
  //constructor
  AdminViewModel() {
    setVerifiedProperties();
    setUnVerifiedProperties();
    setRejectedProperties();
  }

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  List<PropertyModel> _verifiedProperties = [];
  List<PropertyModel> get verifiedProperties => _verifiedProperties;
  List<PropertyModel> _unVerifiedProperties = [];
  List<PropertyModel> get unVerifiedProperties => _unVerifiedProperties;
  List<PropertyModel> _rejectedProperties = [];
  List<PropertyModel> get rejectedProperties => _rejectedProperties;

  setVerifiedProperties() async {
    _verifiedProperties = await _firestore
        .collection('properties')
        .where('status', isEqualTo: "verified")
        .get()
        .then((value) =>
            value.docs.map((e) => PropertyModel.fromMap(e.data())).toList());
    notifyListeners();
  }

  setUnVerifiedProperties() async {
    _unVerifiedProperties = await _firestore
        .collection('properties')
        .where('status', isEqualTo: "unverified")
        .get()
        .then((value) =>
            value.docs.map((e) => PropertyModel.fromMap(e.data())).toList());
    notifyListeners();
  }

  setRejectedProperties() async {
    _rejectedProperties = await _firestore
        .collection('properties')
        .where('status', isEqualTo: "rejected")
        .get()
        .then((value) =>
            value.docs.map((e) => PropertyModel.fromMap(e.data())).toList());
    notifyListeners();
  }

  refresh() async {
    await setVerifiedProperties();
    await setUnVerifiedProperties();
    await setRejectedProperties();
  }
}
