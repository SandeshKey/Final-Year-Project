import 'package:dufuna/core/model/property.dart';
import 'package:dufuna/core/model/property_model.dart';
import 'package:dufuna/core/service/db%20_services.dart';
import 'package:dufuna/core/widget/property_box.dart';
import 'package:dufuna/presentation/screen/provider/olive_provider.dart';
import 'package:dufuna/view_model/admin_view_model.dart';
import 'package:dufuna/view_model/property_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdminHome extends StatelessWidget {
  const AdminHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Admin Panel"),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.logout)),
          ],
        ),
        body: Consumer<AdminViewModel>(
          builder: (_, value, __) {
            if (value.unVerifiedProperties.isEmpty) {
              return CircularProgressIndicator();
            }
            return ListView.builder(
                itemCount: value.unVerifiedProperties.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: Column(
                      children: [
                        PropertyBox(),
                        Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                PropertyModel _currentPrperty =
                                    value.unVerifiedProperties[index];
                                _currentPrperty.status = "verified";
                                DatabaseServices()
                                    .updateProperty(_currentPrperty);
                              },
                              child: Text("Approve"),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: Text("Reject"),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                });
          },
        ));
  }
}
