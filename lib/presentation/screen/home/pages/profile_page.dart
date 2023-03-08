import 'package:dufuna/core/util/colors.dart';
import 'package:dufuna/core/util/texts.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorUtils.themeBlack,
        body: Column(children: [
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
                          "Profile",
                          style: TextStyle(
                            color: ColorUtils.pureWhite,
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 32, 0, 0),
            child: Stack(children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                    width: 2,
                    color: ColorUtils.buttonRed,
                  ),
                ),
                child: CircleAvatar(
                  radius: 72,
                  backgroundImage: AssetImage("assets/images/App Icon.png"),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Stack(children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(106, 106, 0, 0),
                    child: Container(
                      height: 36,
                      width: 36,
                      decoration: BoxDecoration(
                        color: ColorUtils.buttonRed,
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(112, 112, 0, 0),
                    child: Icon(
                      Icons.edit,
                      size: 24,
                      color: ColorUtils.pureWhite,
                    ),
                  ),
                ]),
              ),
            ]),
          ),
        ]),
      ),
    );
  }
}
