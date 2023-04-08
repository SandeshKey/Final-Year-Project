import 'package:olivehomes/core/util/colors.dart';
import 'package:olivehomes/core/util/texts.dart';
import 'package:flutter/material.dart';

class WideButton extends StatelessWidget {
  final String? textButton;
  final VoidCallback? onClick;
  const WideButton(this.textButton, {this.onClick, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        height: 56,
        width: 362,
        child: Center(
          child: Text(
            textButton!,
            style: TextUtils.buttonText,
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: ColorUtils.buttonRed,
        ),
      ),
    );
  }
}
