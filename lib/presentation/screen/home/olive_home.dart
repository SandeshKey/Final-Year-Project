import 'package:dufuna/core/util/extension.dart';
import 'package:dufuna/core/widget/property_box.dart';
import 'package:dufuna/presentation/screen/home/pages/search_page.dart';
import 'package:dufuna/presentation/screen/home/widgets/fake_row_items.dart';
import 'package:dufuna/presentation/screen/home/widgets/fake_search.dart';
import 'package:dufuna/provider/olive_provider.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:provider/provider.dart';

import '../../../config/constants.dart';
import '../../../core/util/colors.dart';
import '../property/property_form.dart';
import 'filter.dart';

class OliveHome extends StatelessWidget {
  const OliveHome({super.key});

  @override
  Widget build(BuildContext context) {
    double rh = MediaQuery.of(context).size.height;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push(DetailForm()),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.06,
          child: Material(
            shadowColor: Colors.black,
            elevation: 50,
            // color: ColorUtils.themeBlack,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.home),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    context.push(SearchPage());
                  },
                ),
                SizedBox(
                  width: 30,
                ),
                IconButton(
                  icon: Icon(Icons.person),
                  onPressed: () {
                    context.push(SearchPage());
                  },
                ),
                IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text('Olive Home'),
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
      ),
    );
  }
}
