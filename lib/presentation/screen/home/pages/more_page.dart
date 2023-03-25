import 'package:dufuna/core/util/extension.dart';
import 'package:dufuna/presentation/screen/admin/admin_home.dart';
import 'package:dufuna/presentation/screen/home/pages/contact_us.dart';
import 'package:dufuna/presentation/screen/auth/forget_password.dart';
import 'package:dufuna/presentation/screen/home/pages/my_properties_screen.dart';
import 'package:dufuna/presentation/screen/home/pages/profile_page.dart';
import 'package:dufuna/presentation/screen/home/pages/search_page.dart';
import 'package:dufuna/presentation/screen/property/property_details.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class MorePage extends StatelessWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.08,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('More'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.1,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(width: 2.0, color: Colors.grey),
                  bottom: BorderSide(width: 2.0, color: Colors.grey),
                ),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    child: Text("MR"),
                    radius: 30,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Moses Rusell",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text("moses.r@gmail.com")
                    ],
                  )
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(PhosphorIcons.userLight),
            title: Text('Admin'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              context.push(AdminHome());
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(PhosphorIcons.userLight),
            title: Text('My Properties'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              context.push(MyProperties());
            },
          ),
          ListTile(
            leading: Icon(PhosphorIcons.userLight),
            title: Text('Profile Page'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              context.push(ProfilePage());
            },
          ),
          ListTile(
            leading: Icon(PhosphorIcons.userLight),
            title: Text('Forget Password'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              context.push(ForgetPassword());
            },
          ),

          ListTile(
            leading: Icon(PhosphorIcons.userLight),
            title: Text('Property View'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              context.push(PropertyDetails());
            },
          ),

          ListTile(
            leading: Icon(PhosphorIcons.userLight),
            title: Text('Contact Us'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              context.push(ContactUS());
            },
          ),
          // Expanded(
          //     child: ListView.builder(
          //   itemCount: 10,
          //   itemBuilder: (context, index) => Column(
          //     children: [
          //       ListTile(
          //         leading: Icon(Icons.home),
          //         title: Text('Service $index'),
          //         trailing: Icon(Icons.arrow_forward_ios),
          //       ),
          //       Divider(),
          //     ],
          //   ),
          // ))
        ],
      )),
    );
  }
}
