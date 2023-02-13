import 'package:dufuna/core/util/texts.dart';
import 'package:dufuna/core/widget/text_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/util/colors.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorUtils.themeBlack,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(
                width: double.maxFinite,
              ),
              SvgPicture.asset("assets/images/signup.svg"),
              Text(
                "Register",
                style: TextUtils.boldHeading,
              ),
              SizedBox(
                height: 8,
              ),
              InputTextField(
                  onSaved: (hi) {},
                  labelText: "Name",
                  hintText: "Enter your name"),
              SizedBox(
                height: 8,
              ),
              InputTextField(
                  onSaved: (hi) {},
                  labelText: "Email",
                  hintText: "Enter your name"),
              SizedBox(
                height: 8,
              ),
              InputTextField(
                  onSaved: (hi) {},
                  labelText: "Phone Number",
                  hintText: "Enter your name"),
              SizedBox(
                height: 8,
              ),
              InputTextField(
                  onSaved: (hi) {},
                  labelText: "Password",
                  hintText: "Enter your password"),
              SizedBox(
                height: 8,
              ),
              InputTextField(
                  onSaved: (hi) {},
                  labelText: "Confirm Password",
                  hintText: "Confirm your password"),
              SizedBox(
                height: 260,
              )
            ],
          ),
        ),
      ),
    );
  }
}
