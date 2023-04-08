import 'package:flutter/material.dart';
import 'package:olivehomes/core/util/colors.dart';
import 'package:indexed/indexed.dart';
import 'package:olivehomes/core/widget/wide_button.dart';

class ContactSeller extends StatelessWidget {
  const ContactSeller({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.themeBlack,
      body: Center(
        child: Container(
          height: 500,
          width: 350,
          decoration: BoxDecoration(
            color: ColorUtils.themeBlack,
            border: Border.all(width: .5, color: ColorUtils.grey),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 12, 12, 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "CONTACT SELLER",
                        style: TextStyle(
                          color: ColorUtils.pureWhite,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(
                        Icons.close,
                        color: ColorUtils.pureWhite,
                        size: 28,
                      )
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: ColorUtils.buttonRed,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
                        child: Image.network(
                          "https://cdn-icons-png.flaticon.com/512/1256/1256652.png",
                          height: 64,
                          width: 64,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                              child: Text(
                                "Sandesh Subedi",
                                style: TextStyle(
                                    color: ColorUtils.pureWhite,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                              child: Text(
                                "sandeshyes77@gmail.com",
                                style: TextStyle(
                                    color: ColorUtils.pureWhite,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                              child: Text(
                                "+977 9827100678",
                                style: TextStyle(
                                  color: ColorUtils.pureWhite,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
                  child: TextField(
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: ColorUtils.grey,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: ColorUtils.buttonRed, // Set border color here
                          width: 0.5,
                        ),
                      ),
                      hintText: "Enter your email",
                      hintStyle:
                          TextStyle(color: ColorUtils.grey, fontSize: 12),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 12),
                  child: TextField(
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: ColorUtils.grey,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: ColorUtils.buttonRed, // Set border color here
                          width: 0.5,
                        ),
                      ),
                      hintText: "Enter your phone number",
                      hintStyle:
                          TextStyle(color: ColorUtils.grey, fontSize: 12),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 12),
                  child: WideButton("Call Now"),
                ),
                WideButton("Request a Callback"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
