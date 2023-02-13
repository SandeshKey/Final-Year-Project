import 'package:dufuna/core/util/colors.dart';
import 'package:dufuna/core/util/extension.dart';
import 'package:dufuna/core/widget/positioned_bubble.dart';
import 'package:dufuna/core/widget/wide_button.dart';
import 'package:dufuna/presentation/screen/auth/register_screen.dart';
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
            Expanded(
              flex: 6,
              child: Stack(
                children: const [
                  PositionedBubble(
                      top: 160,
                      left: -10,
                      image: "assets/images/ggs2.svg",
                      length: 60),
                  // PositionedBubble(
                  //     top: 121,
                  //     left: 104,
                  //     image: "assets/images/gs2.png",
                  //     length: 70),
                  // PositionedBubble(
                  //     top: 343,
                  //     left: -10,
                  //     image: "assets/images/gs3.png",
                  //     length: 62),
                  // PositionedBubble(
                  //     top: 252,
                  //     left: 82,
                  //     image: "assets/images/gs4.png",
                  //     length: 92),
                  // PositionedBubble(
                  //     top: 146,
                  //     left: 268,
                  //     image: "assets/images/gs5.png",
                  //     length: 90),
                  // PositionedBubble(
                  //     top: 290,
                  //     left: 241,
                  //     image: "assets/images/gs6.png",
                  //     length: 58),
                  // PositionedBubble(
                  //     top: 394,
                  //     left: 164,
                  //     image: "assets/images/gs7.png",
                  //     length: 42),
                  // PositionedBubble(
                  //     top: 343,
                  //     left: 361,
                  //     image: "assets/images/gs8.png",
                  //     length: 92),
                ],
              ),
            ),
            Expanded(
                flex: 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      "Welcome to",
                      style: TextStyle(
                          color: ColorUtils.pureWhite,
                          fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      "Olive Home",
                      style: TextStyle(
                          color: ColorUtils.pureWhite,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    WideButton(
                      "Get Started",
                      onClick: () {
                        context.push(const RegisterScreen());
                      },
                    ),
                    const SizedBox(
                      height: 80,
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
