import 'package:flutter/material.dart';

import '../../../../../core/util/colors.dart';

class AmentyWidget extends StatelessWidget {
  final String name;
  final String data;

  const AmentyWidget({super.key, required this.name, required this.data});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: ColorUtils.buttonRed,
            borderRadius: BorderRadius.circular(20),
          ),
          height: 36,
          width: 36,
          child: const Icon(
            Icons.bed,
            color: ColorUtils.pureWhite,
            size: 24,
          ),
        ),
       Padding(
          padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
          child: Text(
            data,
            style: const TextStyle(
                color: ColorUtils.pureWhite, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
