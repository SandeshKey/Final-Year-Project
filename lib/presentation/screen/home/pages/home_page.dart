import 'package:dufuna/presentation/screen/home/widgets/text_heading.dart';
import 'package:dufuna/presentation/widgets/custom_appbar.dart';
import 'package:dufuna/presentation/widgets/home_small_box.dart';
import 'package:flutter/material.dart';
import '../../../../core/util/colors.dart';
import '../view_all_screen.dart';
import '../widgets/fake_row_items.dart';
import '../widgets/fake_search.dart';

class HomePageNew extends StatelessWidget {
  const HomePageNew({super.key});

  @override
  Widget build(BuildContext context) {
    double rh = MediaQuery.of(context).size.height;
    return Column(
      children: [
        CustomAppBar(),
        Expanded(
          child: ListView(
            children: [
              const FakeSearchBox(),
              const Padding(
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
              const HomeSmallRow(),

              TextHeading(
                text1: "Urgent",
                text2: "Properties",
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ViewAllPage()));
                },
              ),
              FakeRow(
                type: "urgent",
                height: rh * 0.40,
              ),
              TextHeading(
                text1: "Premium",
                text2: "Properties",
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ViewAllPage()));
                },
              ),

              FakeRow(
                type: "premium",
                height: rh * 0.40,
              ),

              TextHeading(
                text1: "Featured",
                text2: "Properties",
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ViewAllPage()));
                },
              ),

              FakeRow(
                type: "featured",
                height: rh * 0.40,
              ),

              TextHeading(
                text1: "House &",
                text2: "Apartments",
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ViewAllPage()));
                },
              ),

              FakeRow(
                type: "house",
                height: rh * 0.40,
              ),

              TextHeading(
                text1: "Lands",
                text2: "",
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ViewAllPage()));
                },
              ),

              FakeRow(
                type: "land",
                height: rh * 0.40,
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
              // const Expanded(
              //   child: Padding(
              //     padding: const EdgeInsets.fromLTRB(0, 8, 0, 4),
              //     child: Text(
              //       "Premium Properties",
              //       textAlign: TextAlign.center,
              //       style: TextStyle(
              //         color: ColorUtils.pureWhite,
              //         fontSize: 24,
              //         fontWeight: FontWeight.w600,
              //       ),
              //     ),
              //   ),
              // ),
              // Expanded(
              //   flex: 20,
              //   child: Consumer<OliveProvider>(
              //     builder: (context, oliveProvider, child) {
              //       if (oliveProvider.properties.length == 0) {
              //         return const Center(child: CircularProgressIndicator());
              //       }

              //       return SingleChildScrollView(
              //         scrollDirection: Axis.horizontal,
              //         child: Row(
              //           children: List.generate(
              //             oliveProvider.properties.length,
              //             (index) => Padding(
              //               padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              //               child: Container(
              //                 height: 325,
              //                 // width: MediaQuery.of(context).size.width,
              //                 child: PropertyBox(),
              //               ),
              //             ),
              //           ),
              //         ),
              //       );
              //     },
              //   ),
              // ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        )
      ],
    );
  }
}
