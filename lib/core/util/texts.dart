import 'package:olivehomes/core/util/colors.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

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
    color: ColorUtils.pureWhite,
    fontSize: 24,
    fontWeight: FontWeight.w600,
    overflow: TextOverflow.fade,
  );
}
