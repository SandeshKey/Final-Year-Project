import 'package:flutter/material.dart';

class FakeRow extends StatelessWidget {
  final double? height;
  final Widget? child;
  const FakeRow({super.key, this.child, this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height?? 150,
      width: double.maxFinite,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(
            5,
            (index) =>
                child ??
                Container(
                  height: 100,
                  width: 150,
                  decoration: BoxDecoration(border: Border.all(width: 10)),
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/gs6.png",
                        fit: BoxFit.cover,
                      ),
                      Text("Search Houses")
                    ],
                  ),
                )),
      ),
    );
  }
}
