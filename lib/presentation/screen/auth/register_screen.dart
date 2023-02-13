import 'package:dufuna/core/util/extension.dart';
import 'package:dufuna/core/util/texts.dart';
import 'package:dufuna/core/widget/text_input.dart';
import 'package:dufuna/core/widget/wide_button.dart';
import 'package:dufuna/presentation/screen/auth/login_screen.dart';
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
              const SizedBox(
                height: 8,
              ),
              InputTextField(
                  onSaved: (hi) {},
                  labelText: "Name",
                  hintText: "Enter your name"),
              const SizedBox(
                height: 8,
              ),
              InputTextField(
                  onSaved: (hi) {},
                  labelText: "Email",
                  hintText: "Enter your name"),
              const SizedBox(
                height: 8,
              ),
              InputTextField(
                  onSaved: (hi) {},
                  labelText: "Phone Number",
                  hintText: "Enter your name"),
              const SizedBox(
                height: 8,
              ),
              InputTextField(
                  onSaved: (hi) {},
                  labelText: "Password",
                  hintText: "Enter your password"),
              const SizedBox(
                height: 8,
              ),
              InputTextField(
                  onSaved: (hi) {},
                  labelText: "Confirm Password",
                  hintText: "Confirm your password"),
              const SizedBox(
                height: 40,
              ),
              const WideButton("Sign Up"),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: TextUtils.buttonText,
                  ),
                  TextButton(
                    onPressed: () {
                      context.push(const LoginScreen());
                    },
                    child: const Text("Sign In",
                        style: TextStyle(color: ColorUtils.buttonRed)),
                  ),
                ],
              )
              // SizedBox(
              //   height: 260,
              // )
            ],
          ),
        ),
      ),
    );
  }
}

// git checkout main
// git fetch
// git pull origin main
