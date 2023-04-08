import 'package:olivehomes/core/service/db%20_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../core/model/property_model.dart';

class OliveProvider extends ChangeNotifier {
  DatabaseServices _databaseServices = DatabaseServices();
  OliveProvider() {
    refreshProperties();
  }
  List<PropertyModel> _properties = [];

  List<PropertyModel> get properties => _properties;
  List<PropertyModel> _myProperties = [];

  List<PropertyModel> get myProperties => _myProperties;

  void deleteProperty(PropertyModel property) async {
    await _properties.remove(property);
    await _databaseServices.deleteProperty(property.id!);
    refreshProperties();
    notifyListeners();
  }

  void getMyProperties() async {
    _myProperties = await _properties
        .where((element) =>
            element.addedBy == FirebaseAuth.instance.currentUser!.uid)
        .toList();
    notifyListeners();
  }

  void getProperties() async {
    _properties = await DatabaseServices().getProperties();
    print(" length of properties is ${_properties.length}");
    // notifyListeners();
  }

  void searchProperties(String search) {
    _properties = _properties
        .where(
          (property) => property.propertyTitle
              .toString()
              .toLowerCase()
              .contains(search.toLowerCase()),
        )
        .toList();
    notifyListeners();
  }

  void refreshProperties() {
    DatabaseServices().getProperties().then((value) {
      print("refresh properties is called");
      print(value);
      _properties = value;

      print(_properties);
      notifyListeners();
    });
    notifyListeners();
  }
}
