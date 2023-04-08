import 'package:olivehomes/core/util/colors.dart';
import 'package:olivehomes/core/widget/property_box.dart';
import 'package:olivehomes/main.dart';
import 'package:olivehomes/presentation/screen/provider/olive_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/my_property_box.dart';

class MyProperties extends StatelessWidget {
  const MyProperties({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorUtils.themeBlack,
        appBar: AppBar(
          backgroundColor: ColorUtils.buttonRed,
          title: const Text('My Properties'),
        ),
        body: Consumer<OliveProvider>(
          builder: (context, value, child) {
            value.getMyProperties();
            if (value.myProperties.isEmpty) {
              return const Center(
                child: Text(
                  "No Properties",
                  style: TextStyle(color: ColorUtils.pureWhite),
                ),
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
      ),
    );
  }
}
