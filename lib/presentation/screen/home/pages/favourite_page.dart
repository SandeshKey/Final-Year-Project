import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:olivehomes/core/model/property_model.dart';
import 'package:olivehomes/core/util/colors.dart';
import 'package:olivehomes/core/util/texts.dart';
import 'package:olivehomes/presentation/screen/home/widgets/favourite_item.dart';
import 'package:olivehomes/view_model/fav_property_view_model.dart';
// import 'package:olivehomes/presentation/screen/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.black,
          body: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: ColorUtils.buttonRed,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(4),
                    bottomRight: Radius.circular(4),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 16, 16, 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(
                              Icons.arrow_back_ios,
                              color: ColorUtils.pureWhite,
                              // color: ColorUtils.buttonRed,
                              size: 24,
                            ),
                          ),
                          const Padding(
                            padding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
                            child: Text(
                              "Favorites",
                              style: TextStyle(
                                color: ColorUtils.pureWhite,
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Icon(
                        Icons.delete_rounded,
                        color: ColorUtils.pureWhite,
                        size: 24,
                      )
                    ],
                  ),
                ),
              ),

              Expanded(child: Consumer<FavoritePropertiesViewModel>(
                builder: (context, value, child) {
                  return FutureBuilder(
                      future: value.getFavoriteProperties(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          List<PropertyModel> data = snapshot.data!;
                          print(data);
                          return ListView.builder(
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              return FavouriteItem(
                                property: data[index] as PropertyModel,
                              );
                            },
                          );
                        } else {
                          return const Center(
                            child: Text(
                              'No favourite Properties! Please add some',
                              style: TextStyle(
                                color: ColorUtils.pureWhite,
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          );
                        }
                      });
                },
              )),
              // const FavouriteItem(),
              // const FavouriteItem(),
              // const FavouriteItem(),
              // const Expanded(child: FavouriteItem()),

              // Container(
              //   height: MediaQuery.of(context).size.height * 0.08,
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Row(
              //         mainAxisAlignment: MainAxisAlignment.start,
              //         children: [
              //           Text('More'),
              //         ],
              //       ),
              //     ],
              //   ),
              // ),
              // const Expanded(
              //   child: Center(
              //     child: Text('No favourite Properties! Please add some'),
              //   ),
              // ),
            ],
          )),
    );
  }
}
