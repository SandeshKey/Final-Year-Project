import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

          SvgPicture.asset("assets/images/login.svg"),

          Text("Sign In"),

          //TODO improve ui : tyo password hanerw sign in huni pani eutai ma banau

          



        ],
      ),
    );
  }
}