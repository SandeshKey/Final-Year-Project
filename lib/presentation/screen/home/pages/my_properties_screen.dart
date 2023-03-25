import 'package:dufuna/core/widget/property_box.dart';
import 'package:dufuna/main.dart';
import 'package:flutter/material.dart';

class MyProperties extends StatelessWidget {
  const MyProperties({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Properties'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: List.generate(10, (index) => PropertyBox()),
        ),
      ),
    );
  }
}
