import 'package:dufuna/core/service/auth_services.dart';
import 'package:dufuna/core/util/colors.dart';
import 'package:dufuna/core/util/texts.dart';
import 'package:dufuna/core/widget/wide_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  Color firstBoxColor = ColorUtils.pureWhite;
  Color secondBoxColor = ColorUtils.pureWhite;
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
                          "Forget Password",
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
            padding: const EdgeInsets.fromLTRB(12, 24, 12, 32),
            child: SvgPicture.asset(
                "assets/images/Forgot Password Illustration.svg"),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 16, 12, 16),
            child: Text(
              "Select which contact details should we use to reset your password",
              style: TextUtils.buttonText,
              textAlign: TextAlign.center,
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                firstBoxColor = ColorUtils.buttonRed;
                secondBoxColor = ColorUtils.pureWhite;
              });
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 24, 12, 24),
              child: Container(
                height: 80,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: firstBoxColor),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(24, 0, 0, 0),
                      child: SvgPicture.asset("assets/images/MessageIcon.svg"),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(4, 4, 4, 4),
                            child: Text(
                              "via SMS",
                              style: TextStyle(
                                color: ColorUtils.pureWhite,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(4, 4, 4, 4),
                            child: Text(
                              "+977 9827100678",
                              style: TextStyle(
                                  color: ColorUtils.pureWhite,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                firstBoxColor = ColorUtils.pureWhite;
                secondBoxColor = ColorUtils.buttonRed;
              });
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 24, 12, 24),
              child: Flexible(
                child: Container(
                  height: 80,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: secondBoxColor),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(24, 0, 0, 0),
                        child: SvgPicture.asset("assets/images/EmailIcon.svg"),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(4, 4, 4, 4),
                              child: Text(
                                "via Email",
                                overflow: TextOverflow.fade,
                                style: TextStyle(
                                  color: ColorUtils.pureWhite,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(4, 4, 4, 4),
                              child: Text(
                                "sandeshyes77@gmail.com",
                                overflow: TextOverflow.fade,
                                maxLines: 1,
                                softWrap: false,
                                style: TextStyle(
                                    color: ColorUtils.pureWhite,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
            child: WideButton(
              "Continue",
              onClick: () async {
                await AuthServices()
                    .forgotPassword("acharyabibek746@gmail.com");
              },
            ),
          ),
        ]),
      ),
    );
  }
}
