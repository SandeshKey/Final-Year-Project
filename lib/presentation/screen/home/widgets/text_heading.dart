import 'package:flutter/material.dart';

import '../../../../core/util/colors.dart';
import '../view_all_screen.dart';

class TextHeading extends StatelessWidget {
  final String text1;
  final String text2;
  final VoidCallback onTap;

  const TextHeading(
      {super.key,
      required this.text1,
      required this.text2,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  text1,
                  style: const TextStyle(
                    color: ColorUtils.buttonRed,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  text2,
                  style: const TextStyle(
                    color: ColorUtils.pureWhite,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            InkWell(
              onTap: onTap,
              child: Text(
                "View All",
                style: TextStyle(
                  color: ColorUtils.pureWhite,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
          ],
        ));
  }
}
