import 'package:dufuna/core/util/extension.dart';
import 'package:dufuna/core/util/texts.dart';
import 'package:dufuna/core/widget/wide_button.dart';
import 'package:dufuna/presentation/screen/auth/register_screen.dart';
import 'package:dufuna/presentation/screen/home/home.dart';
import 'package:dufuna/presentation/screen/home/olive_home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/service/auth_services.dart';
import '../../../core/util/colors.dart';
import '../../../core/widget/text_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    Future.delayed(
        Duration(
          seconds: 2,
        ), () {
      FirebaseAuth.instance.currentUser != null
          ? Navigator.push(context,
              MaterialPageRoute(builder: (context) => const OliveHome()))
          : null;
    });

    // TODO: implement initState
    super.initState();
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String? errorMessage;

  Future<void> login() async {
    try {
      await AuthServices()
          .signIn(emailController.text, passwordController.text);
    } on FirebaseAuthException catch (e) {
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
    Size size = MediaQuery.of(context).size;
    double hh = size.height;
    double ww = size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorUtils.themeBlack,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: double.maxFinite,
                    height: 50,
                  ),
                  SvgPicture.asset("assets/images/login.svg"),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                        color: ColorUtils.pureWhite,
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: double.maxFinite,
                    height: 30,
                  ),

                  InputTextField(
                      controller: emailController,
                      onSaved: (hi) {},
                      labelText: "Email",
                      hintText: "Enter your name"),
                  const SizedBox(
                    width: double.maxFinite,
                    height: 20,
                  ),

                  InputTextField(
                      controller: passwordController,
                      onSaved: (hi) {},
                      labelText: "Password",
                      hintText: "Enter your password"),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                        child: Checkbox(
                            value: true,
                            onChanged: (value) {
                              value == true ? false : true;
                            }),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 8, 8, 0),
                        child: const Text(
                          "Remember Me",
                          style: TextStyle(
                            color: Colors.white,
                          ),
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
                    onClick: () async {
                      await login();

                      if (errorMessage != null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(errorMessage!)));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("login Successfully")));
                        context.push(const OliveHome());
                      }
                    },
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Dont have an account yet?",
                        style: TextUtils.buttonText,
                      ),
                      TextButton(
                        onPressed: () async {
                          context.push(const RegisterScreen());
                        },
                        child: const Text(
                          "Register",
                          style: TextStyle(
                              color: Color.fromARGB(255, 247, 73, 76),
                              fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: double.maxFinite,
                    height: 30,
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
                    height: hh * 0.03,
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
                        decoration: const BoxDecoration(
                            // color: ColorUtils.pureWhite,
                            // borderRadius: BorderRadius.circular(10),
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
                            // color: ColorUtils.pureWhite,
                            // borderRadius: BorderRadius.circular(10),
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
                          // color: ColorUtils.pureWhite,
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
      ),
    );
  }
}
