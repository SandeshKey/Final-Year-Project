import 'package:dufuna/core/util/colors.dart';
import 'package:dufuna/presentation/screen/provider/olive_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/search_result_property.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});

  // final List<String> dropdownValues = [
  //   'All Properties',
  //   'Rental Rooms',
  //   'Apartments',
  //   'Flat Spaces',
  //   'Farm House',
  //   'Mansion'
  // ];

  @override
  Widget build(BuildContext context) {
    OliveProvider _oliveProvider = Provider.of<OliveProvider>(context);
    return SafeArea(
      child: Scaffold(
        // backgroundColor: ColorUtils.themeBlack,
        body: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.08,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back),
                      ),
                      Text('Search Results'),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.one_x_mobiledata),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                autofocus: true,
                decoration: InputDecoration(
                  labelText: 'Search Properties',
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: ColorUtils.buttonRed, width: 0.0),
                  ),
                  border: const OutlineInputBorder(),
                  labelStyle: new TextStyle(color: ColorUtils.themeBlack),
                ),
                onChanged: (String text) {
                  if (text == '' || text == null) {
                    _oliveProvider.refreshProperties();
                  } else
                    _oliveProvider.searchProperties(text);
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: DropdownButtonFormField<String>(
            //     decoration: const InputDecoration(
            //       labelText: 'Filter By',
            //       border: OutlineInputBorder(),
            //     ),
            //     items: dropdownValues
            //         .map((value) => DropdownMenuItem(
            //               value: value,
            //               child: Text(value),
            //             ))
            //         .toList(),
            //     onChanged: (String? value) {
            //       // Handle dropdown selection here
            //     },
            //     value: dropdownValues[0],
            //   ),
            // ),

            Consumer<OliveProvider>(builder: (_, value, __) {
              return Expanded(
                child: ListView.builder(
                  itemCount: value.properties.length,
                  itemBuilder: (context, index) {
                    return SearchResultProperty(
                      myProperty: value.properties[index],
                    );
                  },
                ),
              );
            }),
            // Expanded(
            //   child: ListView.builder(
            //     itemCount: 10,
            //     itemBuilder: (context, index) {
            //       return SearchResultProperty();
            //     },
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
