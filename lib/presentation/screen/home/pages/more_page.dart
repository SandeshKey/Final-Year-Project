import 'package:dufuna/core/util/colors.dart';
import 'package:dufuna/core/util/extension.dart';
import 'package:dufuna/presentation/screen/admin/admin_home.dart';
import 'package:dufuna/presentation/screen/auth/login_screen.dart';
import 'package:dufuna/presentation/screen/home/pages/contact_us.dart';
import 'package:dufuna/presentation/screen/auth/forget_password.dart';
import 'package:dufuna/presentation/screen/home/pages/my_properties_screen.dart';
import 'package:dufuna/presentation/screen/home/pages/profile_page.dart';
import 'package:dufuna/presentation/screen/home/pages/search_page.dart';
import 'package:dufuna/presentation/screen/property/property_details.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class MorePage extends StatelessWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: ColorUtils.themeBlack,
          body: Column(
            children: [
              Container(
                color: ColorUtils.buttonRed,
                height: MediaQuery.of(context).size.height * 0.08,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'More Actions',
                      style: TextStyle(
                          color: ColorUtils.pureWhite,
                          fontSize: 18,
                          fontWeight: FontWeight.w700),
                    ),
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
                        backgroundColor: ColorUtils.themeBlack,
                        child: Image.network(FirebaseAuth
                                .instance.currentUser!.photoURL ??
                            "https://cdn.pixabay.com/photo/2015/03/04/22/35/avatar-659651_1280.png"),
                      ),
                      // child: FirebaseAuth.instance.currentUser.photoURL==??("MR"),

                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            FirebaseAuth.instance.currentUser!.displayName ??
                                "Sandesh Subedi",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: ColorUtils.pureWhite),
                          ),
                          Text(
                            FirebaseAuth.instance.currentUser!.email ??
                                "sandeshyes77@gmail.com",
                            style: TextStyle(color: ColorUtils.pureWhite),
                          )
                        ],
                      ),

                      // Logout Button
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            height: 40,
                            width: 100,
                            decoration: BoxDecoration(
                              color: ColorUtils.buttonRed,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: TextButton(
                              onPressed: () {
                                FirebaseAuth.instance.signOut().then(
                                    (value) => context.push(LoginScreen()));
                              },
                              child: Text(
                                "Log Out",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.admin_panel_settings_rounded,
                  color: ColorUtils.buttonRed,
                ),
                title: Text(
                  'Admin',
                  style: TextStyle(
                      fontWeight: FontWeight.w500, color: ColorUtils.pureWhite),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: ColorUtils.buttonRed,
                  size: 18,
                ),
                onTap: () {
                  context.push(AdminHome());
                },
              ),
              Divider(),
              ListTile(
                leading: Icon(
                  Icons.holiday_village_rounded,
                  color: ColorUtils.buttonRed,
                ),
                title: Text(
                  'My Properties',
                  style: TextStyle(
                      fontWeight: FontWeight.w500, color: ColorUtils.pureWhite),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: ColorUtils.buttonRed,
                  size: 18,
                ),
                onTap: () {
                  context.push(MyProperties());
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.face_sharp,
                  color: ColorUtils.buttonRed,
                ),
                title: Text(
                  'Profile Page',
                  style: TextStyle(
                      fontWeight: FontWeight.w500, color: ColorUtils.pureWhite),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: ColorUtils.buttonRed,
                  size: 18,
                ),
                onTap: () {
                  context.push(ProfilePage());
                },
              ),
              // ListTile(
              //   leading: Icon(PhosphorIcons.userLight),
              //   title: Text('Forget Password'),
              //   trailing: Icon(Icons.arrow_forward_ios),
              //   onTap: () {
              //     context.push(ForgetPassword());
              //   },
              // ),

              ListTile(
                leading: Icon(
                  Icons.remove_red_eye,
                  color: ColorUtils.buttonRed,
                ),
                title: Text(
                  'Property View',
                  style: TextStyle(
                      fontWeight: FontWeight.w500, color: ColorUtils.pureWhite),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: ColorUtils.buttonRed,
                  size: 18,
                ),
                onTap: () {
                  context.push(AdminHome());
                },
              ),

              ListTile(
                leading: Icon(
                  Icons.contact_page,
                  color: ColorUtils.buttonRed,
                ),
                title: Text(
                  'Contact Us',
                  style: TextStyle(
                      fontWeight: FontWeight.w500, color: ColorUtils.pureWhite),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: ColorUtils.buttonRed,
                  size: 18,
                ),
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
