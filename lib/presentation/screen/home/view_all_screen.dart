import 'package:dufuna/core/util/colors.dart';
import 'package:dufuna/core/widget/property_box.dart';
import 'package:dufuna/view_model/mini_filter_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ViewAllPage extends StatelessWidget {
  ViewAllPage({super.key});

  final List<String> dropdownValues = ["Premium", "Urgent", "Featured"];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          // backgroundColor: ColorUtils.themeBlack,
          body: Consumer<MiniFilterViewModel>(
        builder: (context, miniFilterViewModel, child) {
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
                        Text('${miniFilterViewModel.currentFilter} Properties'),
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'Filter By',
                    border: OutlineInputBorder(),
                  ),
                  items: dropdownValues
                      .map((value) => DropdownMenuItem(
                            value: value,
                            child: Text(value),
                          ))
                      .toList(),
                  onChanged: (String? value) {
                    miniFilterViewModel.setCurrentFilter(value!);
                    switch (value) {
                      case "Premium":
                        miniFilterViewModel.setPremiumMfProperties();
                        break;
                      case "Urgent":
                        miniFilterViewModel.setUrgentMfProperties();
                        break;
                      case "Featured":
                        miniFilterViewModel.setFeaturedMfProperties();
                        break;
                    }

                    // Handle dropdown selection here
                  },
                  value: dropdownValues[0],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: miniFilterViewModel.mfProperties.length,
                  itemBuilder: (context, index) {
                    return miniFilterViewModel.mfProperties.length == 0
                        ? Center(
                            child: Text("No Properties with current Filter"))
                        : PropertyBox();
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
