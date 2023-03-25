import 'package:dufuna/core/util/colors.dart';
import 'package:dufuna/core/widget/wide_button.dart';
import 'package:dufuna/main.dart';
// import 'package:dufuna/presentation/screen/home/home.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieLoading extends StatelessWidget {
  const LottieLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorUtils.themeBlack,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  height: 250,
                  width: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(200),
                    border: Border.all(color: ColorUtils.buttonRed, width: 2),
                  ),
                  child: Center(
                    // child: Lottie.network(
                    //     'https://assets3.lottiefiles.com/private_files/lf30_p5tali1o.json'),

                    child: Lottie.asset(
                      'assets/lottie_loading.json',
                      repeat: false,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              WideButton(
                "Start Exploring",
                onClick: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AuthWrapper(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
