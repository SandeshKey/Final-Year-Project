import 'package:dufuna/core/util/extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/widget/property_box.dart';
import '../../../../provider/olive_provider.dart';
import '../../property/property_form.dart';
import '../widgets/fake_row_items.dart';
import '../widgets/fake_search.dart';

class HomePageNew extends StatelessWidget {
  const HomePageNew({super.key});

  @override
  Widget build(BuildContext context) {
   double rh = MediaQuery.of(context).size.height;
    return ListView(
      children: [
        FakeSearchBox(),
        Text("Explore OliveHome"),
        FakeRow(),

        Text("Explore OliveHome"),
        FakeRow(
          height: rh * 0.40,
          child: PropertyBox(),
        ),

        Text("Explore OliveHome"),
        FakeRow(
          height: rh * 0.40,
          child: PropertyBox(),
        ),

        //     child: ListView(
        //         scrollDirection: Axis.horizontal,
        //         children: List.generate(
        //             5,
        //             (index) => Container(
        //                   height: 40,
        //                   width: 40,
        //                   child: Column(
        //                     children: [
        //                       Image.asset(
        //                         "assets/images/gs6.png",
        //                         fit: BoxFit.contain,
        //                       ),
        //                       Text("Search Houses")
        //                     ],
        //                   ),
        //                 )))),
        Expanded(child: Text("Hello World")),
        Expanded(
          flex: 20,
          child: Consumer<OliveProvider>(
            builder: (context, oliveProvider, child) {
              if (oliveProvider.properties.length == 0) {
                return const Center(child: CircularProgressIndicator());
              }

              return SingleChildScrollView(
                child: Column(
                  children: List.generate(oliveProvider.properties.length,
                      (index) => PropertyBox()),
                ),
              );
            },
          ),
        ),
        Container(
          padding: const EdgeInsets.all(20),
          child: ElevatedButton(
            onPressed: () => context.push(DetailForm()),
            child: Text("Add Property"),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(20),
          child: ElevatedButton(
            onPressed: () => context.push(DetailForm()),
            child: Text("Add Property"),
          ),
        )
      ],
    );
  }
}
