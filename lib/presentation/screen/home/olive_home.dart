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
import 'package:dufuna/presentation/screen/provider/olive_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorUtils.themeBlack,
        floatingActionButton: FloatingActionButton(
          backgroundColor: ColorUtils.buttonRed,
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
                  InkWell(
                    onTap: () {
                      _onItemTapped(0);
                    }, // Image tapped
                    splashColor: Colors.white10, // Splash color over image
                    child: SvgPicture.asset(
                      "assets/images/IconHome.svg",
                      height: 28,
                      width: 28,
                    ),
                  ),

                  // IconButton(
                  //   icon: Icon(
                  //     Icons.home_outlined,
                  //     size: 28,
                  //     color: ColorUtils.buttonRed,
                  //   ),
                  //   onPressed: () {
                  //     _onItemTapped(0);
                  //   },
                  // ),

                  InkWell(
                    onTap: () {
                      context.push(SearchPage());
                    }, // Image tapped
                    splashColor: Colors.white10, // Splash color over image
                    child: SvgPicture.asset(
                      "assets/images/IconSearch.svg",
                      height: 24,
                      width: 24,
                    ),
                  ),

                  // IconButton(
                  //   icon: Icon(
                  //     Icons.search_rounded,
                  //     size: 28,
                  //     color: ColorUtils.buttonRed,
                  //   ),
                  //   onPressed: () {
                  //     context.push(SearchPage());
                  //   },
                  // ),
                  // ),
                  // const Text(
                  //   'Olive Homes',
                  //   style: TextStyle(
                  //     fontSize: 24,
                  //     fontWeight: FontWeight.w700,
                  //   ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                    child: SizedBox(
                      width: 22,
                    ),
                  ),

                  InkWell(
                    onTap: () {
                      _onItemTapped(2);
                    }, // Image tapped
                    splashColor: Colors.white10, // Splash color over image
                    child: SvgPicture.asset(
                      "assets/images/IconFavorite.svg",
                      height: 26,
                      width: 26,
                    ),
                  ),

                  // IconButton(
                  //   icon: Icon(
                  //     Icons.favorite_outline_outlined,
                  //     size: 24,
                  //     color: ColorUtils.buttonRed,
                  //   ),
                  //   onPressed: () {
                  //     _onItemTapped(2);

                  //     // context.push(FavouritePage());
                  //   },
                  // ),

                  InkWell(
                    onTap: () {
                      _onItemTapped(3);
                    }, // Image tapped
                    splashColor: Colors.white10, // Splash color over image
                    child: SvgPicture.asset(
                      "assets/images/IconMenu.svg",
                      height: 28,
                      width: 28,
                    ),
                  ),

                  // IconButton(
                  //   icon: Icon(
                  //     Icons.menu,
                  //     size: 24,
                  //     color: ColorUtils.buttonRed,
                  //   ),
                  //   onPressed: () {
                  //     _onItemTapped(3);
                  //     // context.push(MorePage());
                  //   },
                  // ),
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
      ),
    );
  }
}
