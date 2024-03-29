import 'package:flutter/material.dart';

class InfoText extends StatelessWidget {
  final String title;
  final String data;
  InfoText({super.key, required this.title, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(
            "$title : ",
            style: TextStyle(
                color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
          ),
          Text(
            "$data",
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}
