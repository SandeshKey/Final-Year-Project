import 'package:dufuna/core/util/colors.dart';
import 'package:dufuna/core/widget/wide_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorUtils.themeBlack,
        body: Column(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              child: Stack(
                children: [
                  Positioned(
                    top: 160,
                    left: -10,
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("./assets/images/gs1.png"),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 121,
                    left: 104,
                    child: Container(
                      height: 70,
                      width: 70,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("./assets/images/gs2.png"),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 343,
                    left: -10,
                    child: Container(
                      height: 62,
                      width: 62,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("./assets/images/gs3.png"),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 252,
                    left: 82,
                    child: Container(
                      height: 92,
                      width: 92,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("./assets/images/gs4.png"),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 146,
                    left: 268,
                    child: Container(
                      height: 90,
                      width: 90,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("./assets/images/gs5.png"),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 290,
                    left: 241,
                    child: Container(
                      height: 58,
                      width: 58,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("./assets/images/gs6.png"),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 394,
                    left: 164,
                    child: Container(
                      height: 42,
                      width: 42,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("./assets/images/gs7.png"),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 343,
                    left: 361,
                    child: Container(
                      height: 92,
                      width: 92,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("./assets/images/gs8.png"),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            WideButton("Get Started"),
          ],
        ),
      ),
    );
  }
}
