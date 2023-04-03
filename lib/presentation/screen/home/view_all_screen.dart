import 'package:dufuna/core/model/property_model.dart';
import 'package:dufuna/core/util/colors.dart';
import 'package:dufuna/core/widget/property_box.dart';
import 'package:dufuna/presentation/screen/home/widgets/search_result_property.dart';
import 'package:dufuna/view_model/mini_filter_view_model.dart';
import 'package:dufuna/view_model/property_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ViewAllPage extends StatefulWidget {
  final String? currentType;
  ViewAllPage({super.key, this.currentType});

  @override
  State<ViewAllPage> createState() => _ViewAllPageState();
}

class _ViewAllPageState extends State<ViewAllPage> {
  final List<String> dropdownValues = [
    "Premium",
    "Urgent",
    "Featured",
    "House & Apartments",
    "Land",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          // backgroundColor: ColorUtils.themeBlack,
          body: Consumer<PropertyViewModel>(
        builder: (context, propertyViewModel, child) {
          List<PropertyModel> myproperties = propertyViewModel.urgentProperties;

          switch (widget.currentType) {
            case "Premium":
              myproperties = propertyViewModel.premiumProperties;

              print(myproperties);

              break;
            case "Urgent":
              myproperties = propertyViewModel.urgentProperties;

              break;
            case "Featured":
              myproperties = propertyViewModel.featuredProperties;
              break;

            case "House & Apartments":
              myproperties = propertyViewModel.houses;
              break;

            case "Land":
              myproperties = propertyViewModel.lands;
              break;
          }

          return Column(
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
                        Text('${widget.currentType} Properties'),
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
              SizedBox(
                height: 10,
              ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: DropdownButtonFormField<String>(
              //     decoration: InputDecoration(
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
              //       switch (value) {
              //         case "Premium":
              //           setState(() {
              //             myproperties = propertyViewModel.premiumProperties;
              //           });
              //           print(myproperties);

              //           break;
              //         case "Urgent":
              //           setState(() {
              //             myproperties = propertyViewModel.urgentProperties;
              //           });
              //           break;
              //         case "Featured":
              //           myproperties = propertyViewModel.featuredProperties;
              //           break;
              //       }

              //       // Handle dropdown selection here
              //     },
              //     value: widget.currentType ?? dropdownValues[0],
              //   ),
              // ),
              Expanded(
                child: ListView.builder(
                  itemCount: myproperties.length,
                  itemBuilder: (context, index) {
                    return myproperties.length == 0
                        ? Center(
                            child: Text("No Properties with current Filter"))
                        : SearchResultProperty(myProperty: myproperties[index]);
                  },
                ),
              )
            ],
          );
        },
      )),
    );
  }
}
