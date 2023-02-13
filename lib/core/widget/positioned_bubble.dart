

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
        child: SvgPicture.asset(image),
        decoration:  BoxDecoration(
          // image: DecorationImage(
            // image: AssetImage(image),
            //TODO   chnage the code for line 24 like below before that export svg images and assign them from 
            // get started screen

            // image: SvgPicture.asset(image),
          ),
        ),
      // ),
    );
  }
}
