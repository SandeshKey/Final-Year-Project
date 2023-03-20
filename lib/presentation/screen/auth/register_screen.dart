import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dufuna/core/util/extension.dart';
import 'package:dufuna/core/util/texts.dart';
import 'package:dufuna/core/widget/text_input.dart';
import 'package:dufuna/core/widget/wide_button.dart';
import 'package:dufuna/presentation/screen/auth/login_screen.dart';
import 'package:dufuna/presentation/screen/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/service/auth_services.dart';
import '../../../core/util/colors.dart';
import '../home/olive_home.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String? errorMessage;

  Future<void> Register() async {
    try {
      await AuthServices().signUp(emailController.text, passwordController.text,
          fullNameController.text);
    } on FirebaseException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  bool isChecked = false;
  bool isLoggedIn = false;
  Map userObj = {};
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
                controller: fullNameController,
                  onSaved: (hi) {},
                  labelText: "Name",
                  hintText: "Enter your name"),
              const SizedBox(
                height: 8,
              ),
              InputTextField(
                controller: emailController,
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
                controller: passwordController,
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
               WideButton("Sign Up", onClick: () async{

                  try {
                        await AuthServices().signUp(emailController.text,
                            passwordController.text, fullNameController.text);

                            if(!mounted){
                              return;

                            }
                        context.push(const OliveHome());
                      } on FirebaseException catch (e) {
                        print(e);
                      }

              },),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: TextUtils.buttonText,
                  ),
                  TextButton(
                    onPressed: () async {

                      context.push(const LoginScreen());
                    
                    },
                    child: const Text("Login",
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
