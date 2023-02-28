import 'package:dufuna/core/util/colors.dart';
import 'package:dufuna/core/util/extension.dart';
import 'package:dufuna/core/widget/property_box.dart';
import 'package:dufuna/presentation/screen/home/widgets/fake_row_items.dart';
import 'package:dufuna/presentation/screen/home/widgets/fake_search.dart';
import 'package:dufuna/provider/olive_provider.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:provider/provider.dart';

import '../../../config/constants.dart';
import '../property/property_form.dart';
import 'filter.dart';

class OliveHome extends StatelessWidget {
  const OliveHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorUtils.buttonRed,
          title: Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 12, 0),
                child: Image.asset(
                  "assets/images/applogo.png",
                  height: 28,
                ),
              ),
              const Text(
                'Olive Homes',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () => context.push(const FilterPage()),
              icon: Icon(
                PhosphorIcons.funnel,
                color: AppColors.kDark,
              ),
            ),
            IconButton(
              onPressed: () => context.push(DetailForm()),
              icon: Icon(
                PhosphorIcons.funnel,
                color: AppColors.kDark,
              ),
            )
          ],
        ),
        body: ListView(
          children: [
            const FakeSearchBox(),
            const Padding(
              padding: const EdgeInsets.fromLTRB(12, 8, 0, 8),
              child: Text(
                "Explore Olive Homes",
                style: TextStyle(
                    color: ColorUtils.buttonRed,
                    fontSize: 22,
                    fontWeight: FontWeight.w700),
              ),
            ),
            const FakeRow(),

            const Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 0, 0),
              child: Text(
                "Explore Properties",
                style: TextStyle(
                    color: ColorUtils.buttonRed,
                    fontSize: 22,
                    fontWeight: FontWeight.w700),
              ),
            ),
            const FakeRow(
              height: 350,
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
            const Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
                child: Text(
                  "Get Your Dream House",
                  style: TextStyle(
                      color: ColorUtils.buttonRed,
                      fontSize: 22,
                      fontWeight: FontWeight.w700),
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
                          padding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
                          child: PropertyBox(),
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
      ),
    );
  }
}
