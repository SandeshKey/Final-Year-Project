

import 'package:flutter/material.dart';

class PositionedBubble extends StatelessWidget {
  const PositionedBubble({super.key, required this.top, required this.left, required this.image, required this.length});
  final double top;
  final double left;
  final String image;
  final double length;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      child: Container(
        height: length,
        width: length,
        decoration:  BoxDecoration(
          image: DecorationImage(
            image: AssetImage(image),
          ),
        ),
      ),
    );
  }
}
