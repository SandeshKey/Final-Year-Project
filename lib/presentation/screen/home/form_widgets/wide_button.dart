import 'package:flutter/material.dart';

import '../../../../core/util/colors.dart';

class WideButton extends StatelessWidget {
  const WideButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: Container(
        height: 56,
        width: double.infinity,
        decoration: BoxDecoration(
          color: ColorUtils.buttonRed,
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Center(
          child: Text(
            "Submit Changes",
            style: TextStyle(
                color: ColorUtils.pureWhite,
                fontWeight: FontWeight.w600,
                fontSize: 20),
          ),
        ),
      ),
    );
  }
}
