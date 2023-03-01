import 'package:dufuna/core/util/colors.dart';
import 'package:flutter/material.dart';

class FakeRow extends StatelessWidget {
  final double? height;
  final Widget? child;
  const FakeRow({super.key, this.child, this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? MediaQuery.of(context).size.height * 0.16,
      width: double.maxFinite,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(
          5,
          (index) => Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 0, 12),
            child: child ??
                Container(
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
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.zero,
                            bottomRight: Radius.zero,
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8),
                          ),
                          child: Image.asset(
                            "assets/images/villa_detail4.png",
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Find Home",
                            style: TextStyle(
                                color: ColorUtils.themeBlack,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ]),
                ),
          ),
        ),
      ),
    );
  }
}
