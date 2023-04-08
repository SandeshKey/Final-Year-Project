import 'package:dufuna/core/util/colors.dart';
import 'package:dufuna/core/util/extension.dart';
import 'package:dufuna/core/util/texts.dart';
import 'package:dufuna/core/widget/positioned_bubble.dart';
import 'package:dufuna/core/widget/wide_button.dart';
import 'package:dufuna/presentation/screen/auth/register_screen.dart';
import 'package:dufuna/presentation/screen/home/pages/lottie_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xAA171717),
        body: Column(
          children: [
            Expanded(
              flex: 6,
              child: Stack(
                children: [
                  Positioned(
                    left: MediaQuery.of(context).size.width / 3,
                    top: 104,
                    child: CircleAvatar(
                      radius: 32,
                      backgroundImage: NetworkImage(
                        "https://cdn.pixabay.com/photo/2015/05/02/09/31/dresden-749683_1280.jpg",
                      ),
                    ),
                  ),
                  Positioned(
                    left: MediaQuery.of(context).size.width / 1.3,
                    top: 146,
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(
                        "https://cdn.pixabay.com/photo/2020/09/18/21/12/buildings-5582974_1280.jpg",
                      ),
                    ),
                  ),
                  Positioned(
                    left: -16,
                    top: 180,
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                        "https://cdn.pixabay.com/photo/2016/11/29/03/53/house-1867187_1280.jpg",
                      ),
                    ),
                  ),
                  Positioned(
                    left: 82,
                    top: 240,
                    child: CircleAvatar(
                      radius: 48,
                      backgroundImage: NetworkImage(
                        "https://images.unsplash.com/photo-1568605114967-8130f3a36994?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80",
                      ),
                    ),
                  ),
                  Positioned(
                    left: 241,
                    top: 291,
                    child: CircleAvatar(
                      radius: 28,
                      backgroundImage: NetworkImage(
                        "https://images.unsplash.com/photo-1494526585095-c41746248156?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80",
                      ),
                    ),
                  ),
                  Positioned(
                    left: -8,
                    top: 350,
                    child: CircleAvatar(
                      radius: 26,
                      backgroundImage: NetworkImage(
                        "https://images.pexels.com/photos/1396122/pexels-photo-1396122.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
                      ),
                    ),
                  ),
                  Positioned(
                    left: 164,
                    top: 394,
                    child: CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(
                        "https://images.pexels.com/photos/1396132/pexels-photo-1396132.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
                      ),
                    ),
                  ),
                  Positioned(
                    right: -24,
                    top: 394,
                    child: CircleAvatar(
                      radius: 48,
                      backgroundImage: NetworkImage(
                        "https://images.pexels.com/photos/7031408/pexels-photo-7031408.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Welcome to",
                    style: TextUtils.buttonText,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "OLIVE HOMES",
                    style: TextStyle(
                        color: ColorUtils.pureWhite,
                        fontSize: 32,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 56,
                  ),
                  WideButton(
                    "Get Started",
                    onClick: () {
                      context.push(const LottieLoading());
                    },
                  ),
                  const SizedBox(
                    height: 80,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
