import 'package:dufuna/core/model/property_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/util/colors.dart';

class FavouriteItem extends StatelessWidget {
  final PropertyModel? property;
  const FavouriteItem({super.key, this.property});

  @override
  Widget build(BuildContext context) {
    return Column(
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
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Lakecity Apartment",
                          style: TextStyle(
                              fontSize: 20,
                              color: ColorUtils.pureWhite,
                              fontWeight: FontWeight.bold),
                          maxLines: 1,
                          softWrap: false,
                        ),
                        Text(
                          "Pokhara Lakeside",
                          style: TextStyle(
                              color: ColorUtils.pureWhite, fontSize: 16),
                        ),
                        Text(
                          "+977 9827100678",
                          style: TextStyle(
                              color: ColorUtils.pureWhite, fontSize: 16),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Rs. 1400000",
                              style: TextStyle(
                                  color: ColorUtils.pureWhite,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
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
    );
  }
}
