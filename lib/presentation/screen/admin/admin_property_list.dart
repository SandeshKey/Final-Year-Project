import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/model/property_model.dart';
import '../../../core/service/db _services.dart';
import '../../../view_model/admin_view_model.dart';
import 'admin_property_box.dart';

class AdminPropertyList extends StatelessWidget {
  final List<PropertyModel>? propertyList;
  final bool showButtons;

  AdminPropertyList({
    super.key,
    this.propertyList,
    required this.showButtons,
  });

  @override
  Widget build(BuildContext context) {
    AdminViewModel adminViewModel = Provider.of(context, listen: true);
    if (propertyList == null) {
      return Center(child: CircularProgressIndicator());
    }

    return showButtons == true
        ? ListView.builder(
            itemCount: propertyList!.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  AdminPropertyBox(
                    property: propertyList![index],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        //change color of button
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.green),
                        ),

                        onPressed: () {
                          PropertyModel currentPrperty = propertyList![index];
                          currentPrperty.status = "verified";
                          DatabaseServices().updateProperty(currentPrperty);
                          adminViewModel.refresh();
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Property Approved successfully")));
                        },
                        child: Text("Approve"),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.red),
                        ),
                        onPressed: () async {
                          print(propertyList![index].id);
                          // print(currentPrperty.id);
                          propertyList![index].status = "rejected";
                          await DatabaseServices()
                              .updateProperty(propertyList![index]);
                          adminViewModel.refresh();
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Property Rejected successfully")));
                        },
                        child: Text("Reject"),
                      ),
                    ],
                  )
                ],
              );
            })
        : ListView.builder(
            itemCount: propertyList!.length,
            itemBuilder: (context, index) {
              return AdminPropertyBox(
                property: propertyList![index],
              );
            });
    // return Consumer<AdminViewModel>(
    //   builder: (_, value, __) {

    //     if (value.unVerifiedProperties.isEmpty) {
    //       return Center(child: CircularProgressIndicator());
    //     }
    //     return
    //   },
    // );
  }
}
