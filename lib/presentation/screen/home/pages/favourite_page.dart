import 'package:dufuna/core/util/colors.dart';
import 'package:dufuna/core/util/texts.dart';
import 'package:dufuna/presentation/screen/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

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
                decoration: BoxDecoration(
                  color: ColorUtils.buttonRed,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8),
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
                        size: 30,
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: ColorUtils.themeBlack,
                          // border:
                          //     Border.all(color: ColorUtils.buttonRed, width: 1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        height: 150,
                        child: Row(
                          children: [
                            Image(
                              height: double.maxFinite,
                              fit: BoxFit.cover,
                              image: AssetImage(
                                "assets/images/villa_details3.png",
                              ),
                              width: 160,
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "Lakecity Apartment",
                                      style: TextUtils.titleHead,
                                      maxLines: 1,
                                      softWrap: false,
                                    ),
                                    Text(
                                      "Pokhara Lakeside",
                                      style: TextStyle(
                                          color: ColorUtils.pureWhite,
                                          fontSize: 16),
                                    ),
                                    Text(
                                      "+977 9827100678",
                                      style: TextStyle(
                                          color: ColorUtils.pureWhite,
                                          fontSize: 16),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Rs. 1400000",
                                          style: TextUtils.titleHead,
                                          maxLines: 1,
                                          softWrap: false,
                                        ),
                                        SvgPicture.asset(
                                            "assets/images/Favorited Icon.svg"),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

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
              Expanded(
                child: Center(
                  child: Text('No favourite Properties! Please add some'),
                ),
              ),
            ],
          )),
    );
  }
}
