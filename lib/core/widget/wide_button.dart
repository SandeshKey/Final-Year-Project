import 'package:dufuna/core/util/colors.dart';
import 'package:dufuna/core/util/texts.dart';
import 'package:flutter/material.dart';

class WideButton extends StatelessWidget {
  final String? textButton;
  const WideButton(this.textButton, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      width: 362,
      color: ColorUtils.buttonRed,
      child: Center(
        child: Text(
          textButton!,
          style: TextUtils.buttonText,
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: ColorUtils.themeBlack,
      ),
    );
  }
}
