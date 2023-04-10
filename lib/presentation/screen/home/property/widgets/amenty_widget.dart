import 'package:flutter/material.dart';

import '../../../../../core/util/colors.dart';

class AmentyWidget extends StatelessWidget {
  final IconData iconName;
  final String data;

  const AmentyWidget({super.key, required this.iconName, required this.data});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 3,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Container(
              decoration: BoxDecoration(
                color: ColorUtils.buttonRed,
                borderRadius: BorderRadius.circular(20),
              ),
              height: 30,
              width: 30,
              child: Icon(
                iconName,
                color: ColorUtils.pureWhite,
                size: 24,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
            child: Text(
              data,
              style: const TextStyle(
                  color: ColorUtils.pureWhite, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
