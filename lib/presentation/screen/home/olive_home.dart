import 'package:dufuna/core/util/colors.dart';
import 'package:dufuna/core/util/extension.dart';
import 'package:dufuna/core/widget/property_box.dart';
import 'package:dufuna/presentation/screen/home/home.dart';
import 'package:dufuna/presentation/screen/home/pages/favourite_page.dart';
import 'package:dufuna/presentation/screen/home/pages/home_page.dart';
import 'package:dufuna/presentation/screen/home/pages/more_page.dart';
import 'package:dufuna/presentation/screen/home/pages/search_page.dart';
import 'package:dufuna/presentation/screen/home/widgets/fake_row_items.dart';
import 'package:dufuna/presentation/screen/home/widgets/fake_search.dart';
import 'package:dufuna/provider/olive_provider.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:provider/provider.dart';

import '../../../config/constants.dart';
import '../property/property_form.dart';
import 'filter.dart';

class OliveHome extends StatefulWidget {
  const OliveHome({super.key});

  @override
  State<OliveHome> createState() => _OliveHomeState();
}

class _OliveHomeState extends State<OliveHome> {
  List<Widget> screens = [
    const HomePageNew(),
    SearchPage(),
    FavouritePage(),
    MorePage(),
  ];

  int _selectedIndex = 0;
  _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
                  onPressed: () {
                    _onItemTapped(0);
                  },
                ),
              // ),
              // const Text(
              //   'Olive Homes',
              //   style: TextStyle(
              //     fontSize: 24,
              //     fontWeight: FontWeight.w700,
              //   ),
              //   SizedBox(
              //     width: 30,
              //   ),
                IconButton(
                  icon: Icon(Icons.favorite_outline_outlined),
                  onPressed: () {
                    _onItemTapped(2);

                    // context.push(FavouritePage());
                  },
                ),
                IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () {
                    _onItemTapped(3);
                    // context.push(MorePage());
                  },
                ),
              ],
            ),
          ),
          // actions: [
          //   IconButton(
          //     onPressed: () => context.push(const FilterPage()),
          //     icon: Icon(
          //       PhosphorIcons.funnel,
          //       color: AppColors.kDark,
          //     ),
          //   ),
          //   IconButton(
          //     onPressed: () => context.push(DetailForm()),
          //     icon: Icon(
          //       PhosphorIcons.funnel,
          //       color: AppColors.kDark,
          //     ),
          //   )
          // ],
        ),
      ),
      // appBar: AppBar(
      //   title: const Text('Olive Home'),
      //   actions: [
      //     IconButton(
      //       onPressed: () => context.push(const FilterPage()),
      //       icon: Icon(
      //         PhosphorIcons.funnel,
      //         color: AppColors.kDark,
      //       ),
      //     ),
      //     IconButton(
      //       onPressed: () => context.push(DetailForm()),
      //       icon: Icon(
      //         PhosphorIcons.funnel,
      //         color: AppColors.kDark,
      //       ),
      //     )
      //   ],
      // ),
      body: screens.elementAt(_selectedIndex),
    );
  }
}
