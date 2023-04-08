import 'package:olivehomes/core/util/colors.dart';
import 'package:flutter/material.dart';

import '../util/colors.dart';

class PropertyContainer extends StatelessWidget {
  const PropertyContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorUtils.themeBlack,
        body: Center(
          child: Container(
            height: 350,
            width: 350,
            decoration: BoxDecoration(
              color: ColorUtils.pureWhite,
              border: Border.all(),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16),
                      ),
                      child: Image.asset(
                        "assets/images/bed_room.png",
                        fit: BoxFit.fitWidth,
                        height: 348,
                        width: double.infinity,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        height: 36,
                        width: 96,
                        decoration: BoxDecoration(
                          color: ColorUtils.buttonRed,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Center(
                          child: Text(
                            "For Rent",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: ColorUtils.pureWhite,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 108, 0, 0),
                      child: Container(
                        height: 240,
                        width: double.infinity,
                        // color: ColorUtils.themeBlack,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color.fromARGB(10, 0, 0, 0),
                              Color.fromARGB(255, 0, 0, 0),
                            ],
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.fromLTRB(0, 0, 0, 8),
                                  child: Text(
                                    "Heritage Apartment",
                                    maxLines: 1,
                                    overflow: TextOverflow.fade,
                                    style: TextStyle(
                                        color: ColorUtils.pureWhite,
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.fromLTRB(0, 0, 0, 4),
                                  child: Text(
                                    "Pokhara, Lakeside",
                                    maxLines: 1,
                                    overflow: TextOverflow.fade,
                                    style: TextStyle(
                                        color: ColorUtils.pureWhite,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Rs. 13,000",
                                      style: TextStyle(
                                        color: ColorUtils.pureWhite,
                                        fontSize: 22,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                    Container(
                                      height: 44,
                                      width: 120,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                            color: ColorUtils.buttonRed,
                                            width: 2),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          "Contact",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: ColorUtils.pureWhite,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ]),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
