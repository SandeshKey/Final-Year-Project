import 'package:flutter/foundation.dart';
import 'package:olivehomes/core/util/colors.dart';
import 'package:olivehomes/core/util/extension.dart';
import 'package:olivehomes/presentation/screen/admin/admin_home.dart';
import 'package:olivehomes/presentation/screen/auth/login_screen.dart';
import 'package:olivehomes/presentation/screen/home/pages/contact_us.dart';
import 'package:olivehomes/presentation/screen/home/pages/ecommerce_products.dart';
import 'package:olivehomes/presentation/screen/home/pages/my_properties_screen.dart';
import 'package:olivehomes/presentation/screen/home/pages/profile_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:olivehomes/core/service/db _services.dart' as db;
import 'package:olivehomes/presentation/screen/home/pages/voice_assistant.dart';

import '../../../../core/model/user.dart';
import 'location_page.dart';
import 'package:olivehomes/core/service/location_service.dart';
import 'package:location/location.dart';
import 'package:geocoding/geocoding.dart' as goa;

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
                  children: const [
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
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(width: 2.0, color: Colors.grey),
                      bottom: BorderSide(width: 2.0, color: Colors.grey),
                    ),
                  ),
                  child: FutureBuilder(
                      future: db.DatabaseServices()
                          .getUserData(FirebaseAuth.instance.currentUser!.uid),
                      builder: (context, snapshot) {
                        print(snapshot.data);
                        if (snapshot.hasData) {
                          final data = snapshot.data as AppUser;

                          if (kDebugMode) {
                            print(
                                "User Data: ${data.name} ${data.email} ${data.phoneNumber} ${data.displayImage}");
                          }

                          return Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: ColorUtils.themeBlack,
                                backgroundImage: NetworkImage(data
                                        .displayImage ??
                                    "https://cdn.pixabay.com/photo/2015/03/04/22/35/avatar-659651_1280.png"),
                              ),
                              // child: FirebaseAuth.instance.currentUser.photoURL==??("MR"),

                              const SizedBox(
                                width: 20,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    data.name ?? "Sandesh Subedi",
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: ColorUtils.pureWhite),
                                  ),
                                  Text(
                                    data.email ?? "sandeshyes77@gmail.com",
                                    style: const TextStyle(
                                        color: ColorUtils.pureWhite),
                                  ),
                                  Text(
                                    data.phoneNumber ?? "",
                                    style: const TextStyle(
                                        color: ColorUtils.pureWhite),
                                  ),
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
                                            (value) => context
                                                .push(const LoginScreen()));
                                      },
                                      child: const Text(
                                        "Log Out",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        }

                        return const CircularProgressIndicator();
                      }),
                ),
              ),
              ListTile(
                leading: const Icon(
                  Icons.admin_panel_settings_rounded,
                  color: ColorUtils.buttonRed,
                ),
                title: const Text(
                  'Admin',
                  style: TextStyle(
                      fontWeight: FontWeight.w500, color: ColorUtils.pureWhite),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: ColorUtils.buttonRed,
                  size: 18,
                ),
                onTap: () {
                  context.push(const AdminHome());
                },
              ),
              const Divider(),
              ListTile(
                leading: const Icon(
                  Icons.holiday_village_rounded,
                  color: ColorUtils.buttonRed,
                ),
                title: const Text(
                  'My Properties',
                  style: TextStyle(
                      fontWeight: FontWeight.w500, color: ColorUtils.pureWhite),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: ColorUtils.buttonRed,
                  size: 18,
                ),
                onTap: () {
                  context.push(const MyProperties());
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.shopping_basket,
                  color: ColorUtils.buttonRed,
                ),
                title: const Text(
                  'Olive E-commerce',
                  style: TextStyle(
                      fontWeight: FontWeight.w500, color: ColorUtils.pureWhite),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: ColorUtils.buttonRed,
                  size: 18,
                ),
                onTap: () {
                  context.push(const EcommerceProducts());
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.face_sharp,
                  color: ColorUtils.buttonRed,
                ),
                title: const Text(
                  'Profile Page',
                  style: TextStyle(
                      fontWeight: FontWeight.w500, color: ColorUtils.pureWhite),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: ColorUtils.buttonRed,
                  size: 18,
                ),
                onTap: () {
                  context.push(const ProfilePage());
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.remove_red_eye,
                  color: ColorUtils.buttonRed,
                ),
                title: const Text(
                  'Property View',
                  style: TextStyle(
                      fontWeight: FontWeight.w500, color: ColorUtils.pureWhite),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: ColorUtils.buttonRed,
                  size: 18,
                ),
                onTap: () {
                  context.push(const AdminHome());
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.voice_chat,
                  color: ColorUtils.buttonRed,
                ),
                title: const Text(
                  'Voice Assistant',
                  style: TextStyle(
                      fontWeight: FontWeight.w500, color: ColorUtils.pureWhite),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: ColorUtils.buttonRed,
                  size: 18,
                ),
                onTap: () {
                  context.push(VoiceAssistant(
                  ));
                },
              ),

              ListTile(
                leading: const Icon(
                  Icons.location_on,
                  color: ColorUtils.buttonRed,
                ),
                title: const Text(
                  'Location',
                  style: TextStyle(
                      fontWeight: FontWeight.w500, color: ColorUtils.pureWhite),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: ColorUtils.buttonRed,
                  size: 18,
                ),
                onTap: () {
                  context.push(const LocationPage());
                },
              ),

              ListTile(
                leading: const Icon(
                  Icons.contact_page,
                  color: ColorUtils.buttonRed,
                ),
                title: const Text(
                  'Contact Us',
                  style: TextStyle(
                      fontWeight: FontWeight.w500, color: ColorUtils.pureWhite),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: ColorUtils.buttonRed,
                  size: 18,
                ),
                onTap: () {
                  context.push(const ContactUS());
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
