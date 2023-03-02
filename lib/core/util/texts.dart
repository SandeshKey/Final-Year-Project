import 'package:dufuna/core/util/colors.dart';
import 'package:flutter/material.dart';

class TextUtils {
  static TextStyle boldHeading = const TextStyle(
    fontSize: 32,
    color: ColorUtils.pureWhite,
    fontWeight: FontWeight.w900,
  );

  static TextStyle buttonText = const TextStyle(
    fontSize: 18,
    color: ColorUtils.pureWhite,
    fontWeight: FontWeight.w500,
  );

  static TextStyle titleHead = const TextStyle(
    fontSize: 22,
    color: ColorUtils.pureWhite,
    fontWeight: FontWeight.w700,
    overflow: TextOverflow.fade,
  );
}
