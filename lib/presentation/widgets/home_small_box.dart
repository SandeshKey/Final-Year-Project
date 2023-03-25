import 'package:flutter/material.dart';

import '../../core/util/colors.dart';

class HomeSmallRow extends StatelessWidget {
  const HomeSmallRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.185,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          HomeSmallBox(
            onTap: () {},
            title: " Find Homes",
          ),
          HomeSmallBox(
            onTap: () {},
            title: "Find Flats",
          ),
          HomeSmallBox(
            onTap: () {},
            title: "Find Lands",
          ),
          HomeSmallBox(onTap: () {}),
          HomeSmallBox(onTap: () {}),
        ],
      ),
    );
  }
}

class HomeSmallBox extends StatelessWidget {
  final VoidCallback onTap;
  final String? imagePath;
  final String? title;
  const HomeSmallBox(
      {super.key, required this.onTap, this.imagePath, this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: ColorUtils.pureWhite,
            border: Border.all(
              width: .5,
              color: ColorUtils.buttonRed,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          // height: 150,
          width: 150,
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.zero,
                bottomRight: Radius.zero,
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
              child: Image.asset(
                imagePath ?? "assets/images/villa_detail4.png",
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title ?? "Find Home",
                style: TextStyle(
                    color: ColorUtils.themeBlack,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
