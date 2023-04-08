import 'package:olivehomes/core/util/extension.dart';
import 'package:olivehomes/presentation/screen/home/pages/search_page.dart';
import 'package:flutter/material.dart';

class FakeSearchBox extends StatelessWidget {
  const FakeSearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
        child: InkWell(
          onTap: () {
            context.push(SearchPage());
          },
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey[800],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Search Area City or Property',
                  style: TextStyle(color: Colors.white),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.search, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
