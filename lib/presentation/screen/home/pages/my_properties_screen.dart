import 'package:dufuna/core/widget/property_box.dart';
import 'package:dufuna/main.dart';
import 'package:dufuna/presentation/screen/provider/olive_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/my_property_box.dart';

class MyProperties extends StatelessWidget {
  const MyProperties({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Properties'),
      ),
      body: Consumer<OliveProvider>(
        builder: (context, value, child) {
          value.getMyProperties();
          if (value.myProperties.isEmpty) {
            return const Center(
              child: Text("No Properties"),
            );
          } else {
            return ListView.builder(
              itemCount: value.myProperties.length,
              itemBuilder: (context, index) {
                return MyPropertyBox(
                  myProperty: value.myProperties[index],
                );
              },
            );
          }
        },
      ),
    );
  }
}
