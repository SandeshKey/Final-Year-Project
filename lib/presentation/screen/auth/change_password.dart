import 'package:olivehomes/core/util/colors.dart';
import 'package:olivehomes/core/widget/wide_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/util/texts.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorUtils.themeBlack,
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
                            "Create New Password",
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
              padding: const EdgeInsets.fromLTRB(12, 32, 12, 32),
              child: SvgPicture.asset("assets/images/ChangePassword.svg"),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 16, 12, 16),
              child: Text(
                "Create your new password",
                style: TextUtils.buttonText,
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                obscureText: true,
                obscuringCharacter: '*',
                decoration: InputDecoration(
                  hintText: "Enter your new Password",
                  hintStyle: TextStyle(color: ColorUtils.pureWhite),
                  filled: true,
                  fillColor: Color.fromARGB(255, 67, 68, 73),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32),
                    // borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32),
                    borderSide: BorderSide(
                      color: ColorUtils.buttonRed,
                    ),
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                    child: Icon(
                      Icons.lock_person,
                      color: ColorUtils.grey,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                obscureText: true,
                obscuringCharacter: '*',
                decoration: InputDecoration(
                  hintText: "Confirm Password",
                  hintStyle: TextStyle(color: ColorUtils.pureWhite),
                  filled: true,
                  fillColor: Color.fromARGB(255, 67, 68, 73),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32),
                    // borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32),
                    borderSide: BorderSide(
                      color: ColorUtils.buttonRed,
                    ),
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                    child: Icon(
                      Icons.lock_person,
                      color: ColorUtils.grey,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 24, 0, 0),
              child: WideButton("Confirm"),
            )
          ],
        ),
      ),
    );
  }
}
