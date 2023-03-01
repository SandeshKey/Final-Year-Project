import 'package:dufuna/core/service/db%20_services.dart';
import 'package:flutter/material.dart';

import '../../../core/model/property_model.dart';

class OliveProvider extends ChangeNotifier {
  OliveProvider() {
    refreshProperties();
  }
  List<PropertyModel> _properties = [];

  List<PropertyModel> get properties => _properties;

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
