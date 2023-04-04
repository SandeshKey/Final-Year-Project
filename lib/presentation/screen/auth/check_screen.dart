import 'package:dufuna/core/util/extension.dart';
import 'package:dufuna/core/widget/wide_button.dart';
import 'package:dufuna/presentation/screen/auth/login_screen.dart';
import 'package:flutter/material.dart';

class CheckScreen extends StatelessWidget {
  const CheckScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Check Screen"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                " We Have sent you password reset link in your email address please check that."),
            WideButton(
              "Return Login Screen",
              onClick: () {
                context.push(LoginScreen());
              },
            )
          ],
        ));
  }
}
