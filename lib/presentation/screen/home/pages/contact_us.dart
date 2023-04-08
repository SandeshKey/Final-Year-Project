import 'package:olivehomes/core/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/util/texts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

class ContactUS extends StatelessWidget {
  const ContactUS({super.key});

  void sendEmail() async {
    final Email email = Email(
      body: 'Hello, how are you?',
      subject: 'Greeting',
      recipients: ['recipient@example.com'],
      isHTML: false,
    );

    await FlutterEmailSender.send(email);
  }

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
                        size: 20,
                      ),
                    ),
                    const Padding(
                      padding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
                      child: Text(
                        "Contact Us",
                        style: TextStyle(
                          color: ColorUtils.pureWhite,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
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
          padding: const EdgeInsets.fromLTRB(12, 32, 12, 12),
          child: SvgPicture.asset(
            "assets/images/contact_us.svg",
            height: 200,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 40, 12, 24),
          child: Text(
            "Let us know how you are feeling",
            style: TextUtils.buttonText,
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 24, 12, 24),
          child: GestureDetector(
            onTap: () {
              launch('tel:+9779827100678');
            },
            child: Container(
              height: 80,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(width: 2, color: ColorUtils.buttonRed),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 4, 4, 4),
                          child: Text(
                            "Reach us via Phone Call",
                            style: TextStyle(
                              color: ColorUtils.pureWhite,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 4, 4, 4),
                          child: Text(
                            "+977 9827100678",
                            style: TextStyle(
                                color: ColorUtils.pureWhite,
                                fontWeight: FontWeight.w500,
                                fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 24, 0),
                    child: SvgPicture.asset("assets/images/PhoneIcon.svg"),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 24, 12, 24),
          child: GestureDetector(
            onTap: () {
              sendEmail();
            },
            child: Container(
              height: 80,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(width: 2, color: ColorUtils.buttonRed),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 4, 4, 4),
                          child: Text(
                            "Reach us via Email",
                            style: TextStyle(
                              color: ColorUtils.pureWhite,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 4, 4, 4),
                          child: Text(
                            "olivehomes1@gmail.com",
                            style: TextStyle(
                                color: ColorUtils.pureWhite,
                                fontWeight: FontWeight.w500,
                                fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 24, 0),
                    child: SvgPicture.asset("assets/images/EmailIcon.svg"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ]),
    ));
  }
}
