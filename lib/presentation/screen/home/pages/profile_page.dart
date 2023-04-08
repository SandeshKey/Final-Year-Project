import 'package:firebase_auth/firebase_auth.dart';
import 'package:olivehomes/core/util/colors.dart';
import 'package:olivehomes/core/util/texts.dart';
import 'package:olivehomes/core/widget/wide_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/model/user.dart';
import '../../../../core/service/db _services.dart';
import '../../../../view_model/image_view_model.dart';
// import 'package:olivehomes/repository/fire_property_repo.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    ImageViewModel _imageViewModel = Provider.of<ImageViewModel>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorUtils.themeBlack,
        body: FutureBuilder(
            future: DatabaseServices()
                .getUserData(FirebaseAuth.instance.currentUser!.uid),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Center(child: Text("Error"));
              }
              if (snapshot.hasData) {
                final data = snapshot.data as AppUser;
                _nameController.text = data.name!;
                _emailController.text = data.email!;
                _phoneController.text = data.phoneNumber!;

                return SingleChildScrollView(
                  child: Column(children: [
                    Container(
                      decoration: const BoxDecoration(
                        color: ColorUtils.buttonRed,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(12, 16, 16, 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Icon(
                                    Icons.arrow_back_ios,
                                    color: ColorUtils.pureWhite,
                                    size: 20,
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.fromLTRB(12, 0, 0, 0),
                                  child: Text(
                                    "Profile",
                                    style: TextStyle(
                                      color: ColorUtils.pureWhite,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 32, 0, 0),
                      child: Stack(children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(
                              width: 2,
                              color: ColorUtils.buttonRed,
                            ),
                          ),
                          child: CircleAvatar(
                            radius: 50,
                            backgroundColor: ColorUtils.buttonRed,
                            child: _imageViewModel.isUpdatingImage == false
                                ? CircleAvatar(
                                    radius: 48,
                                    backgroundImage:
                                        NetworkImage(data.displayImage!),
                                  )
                                : CircleAvatar(
                                    radius: 48,
                                    backgroundImage: NetworkImage(
                                        _imageViewModel.profileImage),
                                  ),
                          ),
                        ),
                        // child: Container(
                        //   height: 100,
                        //   width: 100,
                        //   decoration: BoxDecoration(
                        //     borderRadius: BorderRadius.circular(50),
                        //     border: Border.all(
                        //       width: 2,
                        //       color: ColorUtils.buttonRed,
                        //     ),
                        //   ),
                        //   child: FadeInImage(
                        //     placeholder: AssetImage(
                        //       "assets/images/App Icon.png",
                        //     ),
                        //     image: _imageViewModel.isUpdatingImage == false
                        //         ? NetworkImage(data.displayImage!)
                        //         : NetworkImage(_imageViewModel.profileImage),
                        //     fit: BoxFit.fill,
                        //   ),
                        // ),

                        InkWell(
                          onTap: () {},
                          child: Stack(children: [
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(106, 106, 0, 0),
                              child: Container(
                                height: 36,
                                width: 36,
                                decoration: BoxDecoration(
                                  color: ColorUtils.buttonRed,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                _imageViewModel.pickProfileImage();
                              },
                              child: const Padding(
                                padding: EdgeInsets.fromLTRB(112, 112, 0, 0),
                                child: Icon(
                                  Icons.edit,
                                  size: 24,
                                  color: ColorUtils.pureWhite,
                                ),
                              ),
                            ),
                          ]),
                        ),
                      ]),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                      child: Divider(
                        color: ColorUtils.grey,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(12, 4, 12, 4),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                            child: TextField(
                              onChanged: (value){
                                _nameController.text = value;
                              

                              },
                              controller: _nameController,
                              decoration: InputDecoration(
                                hintText: "User's Name Here",
                                hintStyle: const TextStyle(
                                    color: ColorUtils.pureWhite),
                                filled: true,
                                fillColor:
                                    const Color.fromARGB(255, 67, 68, 73),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(32),
                                  // borderSide: BorderSide(color: Colors.grey),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(32),
                                  borderSide: const BorderSide(
                                    color: ColorUtils.buttonRed,
                                  ),
                                ),
                                prefixIcon: const Padding(
                                  padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                                  child: Icon(
                                    Icons.person_pin,
                                    color: ColorUtils.grey,
                                    size: 22,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                            child: TextField(
                              onChanged: (value){
                               
                                  _emailController.text = value;
                                
                              
                              },
                              controller: _emailController,
                              decoration: InputDecoration(
                                hintText: "User's Email Here",
                                hintStyle: const TextStyle(
                                    color: ColorUtils.pureWhite),
                                filled: true,
                                fillColor:
                                    const Color.fromARGB(255, 67, 68, 73),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(32),
                                  // borderSide: BorderSide(color: Colors.grey),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(32),
                                  borderSide: const BorderSide(
                                    color: ColorUtils.buttonRed,
                                  ),
                                ),
                                prefixIcon: const Padding(
                                  padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                                  child: Icon(
                                    Icons.email,
                                    color: ColorUtils.grey,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                            child: TextField(
                              onChanged: (value){
                                _passwordController.text = value;
                              },
                              controller: _passwordController,
                              obscureText: true,
                              obscuringCharacter: '*',
                              decoration: InputDecoration(
                                hintText: "User's Password Here",
                                hintStyle: const TextStyle(
                                    color: ColorUtils.pureWhite),
                                filled: true,
                                fillColor:
                                    const Color.fromARGB(255, 67, 68, 73),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(32),
                                  // borderSide: BorderSide(color: Colors.grey),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(32),
                                  borderSide: const BorderSide(
                                    color: ColorUtils.buttonRed,
                                  ),
                                ),
                                prefixIcon: const Padding(
                                  padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                                  child: Icon(
                                    Icons.lock_person,
                                    color: ColorUtils.grey,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                            child: TextField(
                              onChanged: (value){
                                _phoneController.text = _phoneController.text;
                              },
                              controller: _phoneController,
                              decoration: InputDecoration(
                                hintText: "User's Phone Number Here",
                                hintStyle: const TextStyle(
                                    color: ColorUtils.pureWhite),
                                filled: true,
                                fillColor:
                                    const Color.fromARGB(255, 67, 68, 73),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(32),
                                  // borderSide: BorderSide(color: Colors.grey),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(32),
                                  borderSide: const BorderSide(
                                    color: ColorUtils.buttonRed,
                                  ),
                                ),
                                prefixIcon: const Padding(
                                  padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                                  child: Icon(
                                    Icons.phone_in_talk,
                                    color: ColorUtils.grey,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    WideButton(
                      "Submit Changes",
                      onClick: () async {
                        AppUser updatedUser = AppUser(
                            name: _nameController.text,
                            email: _emailController.text,
                            phoneNumber: _phoneController.text,
                            displayImage:
                                _imageViewModel.isUpdatingImage == true
                                    ? _imageViewModel.profileImage
                                    : data.displayImage,
                            uid: data.uid);

                        await DatabaseServices().updateUser(updatedUser);

                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("User Updated Successfully")));

                        Navigator.pop(context);
                      },
                    ),
                  ]),
                );
              }

              return const Center(
                child: CircularProgressIndicator(
                  color: ColorUtils.buttonRed,
                ),
              );
            }),
      ),
    );
  }
}
