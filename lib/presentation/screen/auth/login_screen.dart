import 'package:dufuna/core/util/extension.dart';
import 'package:dufuna/core/util/texts.dart';
import 'package:dufuna/core/widget/wide_button.dart';
import 'package:dufuna/presentation/screen/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/util/colors.dart';
import '../../../core/widget/text_input.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double hh = size.height;
    double ww = size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorUtils.themeBlack,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: double.maxFinite,
                  height: 50,
                ),
                SvgPicture.asset("assets/images/login.svg"),

                Text(
                  "Sign In",
                  style: TextUtils.boldHeading,
                ),
                const SizedBox(
                  width: double.maxFinite,
                  height: 50,
                ),

                InputTextField(
                    onSaved: (hi) {},
                    labelText: "Email",
                    hintText: "Enter your name"),
                const SizedBox(
                  width: double.maxFinite,
                  height: 20,
                ),

                InputTextField(
                    onSaved: (hi) {},
                    labelText: "Password",
                    hintText: "Enter your password"),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Checkbox(
                        value: true,
                        onChanged: (value) {
                          value == true ? false : true;
                        }),
                    const Text(
                      "Remember Me",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: double.maxFinite,
                  height: 20,
                ),

                WideButton(
                  "Sign In",
                  onClick: () {
                    context.push(const HomePage());
                  },
                ),
                const SizedBox(
                  width: double.maxFinite,
                  height: 50,
                ),

                Padding(
                  padding: EdgeInsets.only(top: hh * 0.02, left: ww * 0.17),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: hh * 0.001,
                        width: ww * 0.2,
                        color: ColorUtils.pureWhite,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 8),
                        child: Text(
                          "Or Login With",
                          style: TextStyle(
                            color: ColorUtils.pureWhite,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Container(
                          height: hh * 0.001,
                          width: ww * 0.2,
                          color: ColorUtils.pureWhite,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: hh * 0.02,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Container(
                      height: hh * 0.05,
                      width: ww * 0.15,
                      decoration: BoxDecoration(
                        color: ColorUtils.pureWhite,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: SvgPicture.asset(
                        "assets/images/gmail.svg",
                        height: 20,
                      ),
                    ),
                    Container(
                      height: hh * 0.05,
                      width: ww * 0.15,
                      decoration: BoxDecoration(
                        color: ColorUtils.pureWhite,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: SvgPicture.asset(
                        "assets/images/facebook.svg",
                        height: 20,
                      ),
                    ),
                    Container(
                      height: hh * 0.05,
                      width: ww * 0.15,
                      decoration: BoxDecoration(
                        color: ColorUtils.pureWhite,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: SvgPicture.asset(
                        "assets/images/apple.svg",
                        height: 20,
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                  ],
                )

                //TODO improve ui : tyo password hanerw sign in huni pani eutai ma banau
              ],
            ),
          ),
        ),
      ),
    );
  }
}
