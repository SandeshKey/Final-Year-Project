import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PositionedBubble extends StatelessWidget {
  const PositionedBubble(
      {super.key,
      required this.top,
      required this.left,
      required this.image,
      required this.length});
  final double top;
  final double left;
  final String image;
  final double length;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      child: SizedBox(
        // height: length,
        // width: length,
        child: SvgPicture.asset(
          image,
          fit: BoxFit.cover,
          alignment: Alignment.topLeft,
        ),
      ),
      // ),
    );
  }
}
