import 'package:flutter/material.dart';

import '../../core/util/colors.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    double rh = MediaQuery.of(context).size.height;

    return Container(
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
            backgroundColor: ColorUtils.buttonRed,
            child: Image.asset(
              "assets/images/applogo.png",
              height: 32,
              width: 32,
            ),
          ),
          Text(
            "Olive Homes",
            style: TextStyle(
                color: ColorUtils.pureWhite,
                fontSize: 20,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            width: 200,
          ),
        ],
      ),
    );
  }
}
