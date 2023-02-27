import 'package:dufuna/core/service/db%20_services.dart';
import 'package:flutter/material.dart';

import '../core/model/property_model.dart';

class OliveProvider extends ChangeNotifier {
  List<PropertyModel> properties = [];

  void getProperties() async {
    properties = await DatabaseServices().getProperties();
    print(" length of properties is ${properties.length}");
    notifyListeners();
  }
}
