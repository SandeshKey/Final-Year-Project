import 'package:dufuna/core/util/extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/util/colors.dart';
import '../../../../core/widget/property_box.dart';
import '../../provider/olive_provider.dart';
import '../../property/property_form.dart';
import '../widgets/fake_row_items.dart';
import '../widgets/fake_search.dart';

class HomePageNew extends StatelessWidget {
  const HomePageNew({super.key});

  @override
  Widget build(BuildContext context) {
    double rh = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: ColorUtils.buttonRed,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(8),
              bottomRight: Radius.circular(8),
            ),
          ),
          height: rh * 0.07,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 10,
              ),
              CircleAvatar(
                child: Image.asset(
                  "assets/images/applogo.png",
                ),
              ),
              Text(
                "Olive Homes",
                style: TextStyle(
                    color: ColorUtils.pureWhite,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 200,
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView(
            children: [
              FakeSearchBox(),
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 8, 0, 8),
                child: Text(
                  "Explore Olive Homes",
                  style: TextStyle(
                    color: ColorUtils.pureWhite,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              FakeRow(),

              Padding(
                padding: const EdgeInsets.fromLTRB(12, 12, 0, 0),
                child: Text(
                  "Find Properties",
                  style: TextStyle(
                    color: ColorUtils.pureWhite,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              FakeRow(
                height: rh * 0.37,
                child: PropertyBox(),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
                child: Text(
                  "Best in Town",
                  style: TextStyle(
                    color: ColorUtils.pureWhite,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              FakeRow(
                height: rh * 0.37,
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
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 8, 24, 4),
                child: Divider(
                  color: ColorUtils.grey,
                  thickness: .5,
                ),
              ),
              const Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 8, 0, 4),
                  child: Text(
                    "Premium Properties",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: ColorUtils.pureWhite,
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 20,
                child: Consumer<OliveProvider>(
                  builder: (context, oliveProvider, child) {
                    if (oliveProvider.properties.length == 0) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    return SingleChildScrollView(
                      child: Column(
                        children: List.generate(
                          oliveProvider.properties.length,
                          (index) => Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Container(
                              height: 325,
                              // width: MediaQuery.of(context).size.width,
                              child: PropertyBox(),
                            ),
                          ),
                        ),
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
          ),
        )
      ],
    );
  }
}
