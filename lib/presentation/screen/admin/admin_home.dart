import 'package:dufuna/presentation/screen/provider/olive_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdminHome extends StatelessWidget {
  const AdminHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.logout)),
          ],
        ),
        body: Consumer<OliveProvider>(
          builder: (_, value, __) {
            if (value.properties.isEmpty) {
              return CircularProgressIndicator();
            }
            return ListView.builder(
                itemCount: value.properties.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: Column(
                      children: [

                        Row(
                          children: [
                            ElevatedButton(onPressed: (){}, child: Text("Approve"),),
                            ElevatedButton(onPressed: (){}, child: Text("Reject"),), 

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
