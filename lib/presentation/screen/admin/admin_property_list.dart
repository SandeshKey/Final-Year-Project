import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/model/property_model.dart';
import '../../../core/service/db _services.dart';
import '../../../view_model/admin_view_model.dart';
import 'admin_property_box.dart';

class AdminPropertyList extends StatelessWidget {
  final List<PropertyModel>? propertyList;

  AdminPropertyList({
    super.key,
    this.propertyList,
  });

  @override
  Widget build(BuildContext context) {
    if (propertyList == null) {
      return Center(child: CircularProgressIndicator());
    }

    return ListView.builder(
        itemCount: propertyList!.length,
        itemBuilder: (context, index) {
          return Container(
            child: Column(
              children: [
                AdminPropertyBox(),
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
                        PropertyModel _currentPrperty = propertyList![index];
                        _currentPrperty.status = "verified";
                        DatabaseServices().updateProperty(_currentPrperty);
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
                      onPressed: () {},
                      child: Text("Reject"),
                    ),
                  ],
                )
              ],
            ),
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
