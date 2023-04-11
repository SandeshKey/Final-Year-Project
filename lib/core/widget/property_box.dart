import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:olivehomes/core/util/extension.dart';
import 'package:olivehomes/presentation/screen/home/property/property_details.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

// import '../../repository/fire_property_repo.dart';
import '../model/property_model.dart';
import '../model/user.dart';
import '../service/db _services.dart';
import '../util/colors.dart';

class PropertyBox extends StatefulWidget {
  final PropertyModel? property;
  const PropertyBox({Key? key, this.property}) : super(key: key);

  @override
  State<PropertyBox> createState() => _PropertyBoxState();
}

class _PropertyBoxState extends State<PropertyBox> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 8, 4, 12),
      child: InkWell(
        onTap: () {
          context.push(PropertyDetails(
            propertyModel: widget.property,
          ));
        },
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.78,
          height: MediaQuery.of(context).size.height * 0.3,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: ColorUtils.pureWhite,
                    borderRadius: BorderRadius.circular(12),
                    border: (Border.all(
                      width: .5,
                      style: BorderStyle.solid,
                      // color: Color.fromARGB(255, 116, 117, 119),
                      color: ColorUtils.buttonRed,
                    )),
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            ClipRect(
                              child: ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.zero,
                                    bottomRight: Radius.zero,
                                    topLeft: Radius.circular(8),
                                    topRight: Radius.circular(8),
                                  ),
                                  child: widget.property?.imgPath1 == null
                                      ? Image.asset(
                                          "assets/images/villa_details3.png",
                                          height: 180,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          fit: BoxFit.fill,
                                        )
                                      : FadeInImage(
                                          placeholder: const AssetImage(
                                            "assets/images/villa_details3.png",
                                          ),
                                          image: NetworkImage(
                                            widget.property!.imgPath1!,
                                          ),
                                          height: 180,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          fit: BoxFit.fill,
                                        )),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Container(
                                height: 30,
                                width: 70,
                                decoration: BoxDecoration(
                                    color: ColorUtils.buttonRed,
                                    borderRadius: BorderRadius.circular(4)),
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    "For ${widget.property!.propertyFor}", //yo text center ma ayena
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: ColorUtils.pureWhite,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 8, 0, 6),
                          child: Text(
                            widget.property!.propertyTitle!,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left, //yo text start ma gayena
                            style: const TextStyle(
                                color: ColorUtils.themeBlack,
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                overflow: TextOverflow.fade,
                                decoration: TextDecoration.none),
                          ),
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.fromLTRB(16, 8, 0, 6),
                                  child: Icon(
                                    Icons.place,
                                    size: 15,
                                    color: Color.fromARGB(255, 68, 69, 70),
                                  ),
                                ),
                                Text(
                                  widget.property!.address ??
                                      "Lainchaur, Kathmandu",
                                  style: TextStyle(
                                    color: ColorUtils.themeBlack,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13,
                                    overflow: TextOverflow.fade,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 0, 20, 8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Rs. ${widget.property!.price} ${widget.property!.priceUnit}",
                                    style: TextStyle(
                                      color: ColorUtils.themeBlack,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                    child: GestureDetector(
                                      onTap: () {
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              // return ;
                                              return AlertDialog(
                                                title: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(" Contact Seller"),
                                                    IconButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        icon: Icon(
                                                            PhosphorIcons.x))
                                                  ],
                                                ),

                                                // content: SingleChildScrollView(
                                                //   child: Column(
                                                //     children: [
                                                //       Text(" K xaa")
                                                //     ],
                                                //   ),

                                                // ),
                                                content: SingleChildScrollView(
                                                  child: Container(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.15,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            1,
                                                    // width: 300,
                                                    // color: Colors.indigo,
                                                    child: Column(
                                                      children: [
                                                        FutureBuilder(
                                                            future: DatabaseServices()
                                                                .getUserData(widget
                                                                    .property!
                                                                    .addedBy!),
                                                            builder: ((context,
                                                                snapshot) {
                                                              if (snapshot
                                                                  .hasData) {
                                                                final data =
                                                                    snapshot.data
                                                                        as AppUser;
                                                                return Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .fromLTRB(
                                                                          12,
                                                                          0,
                                                                          0,
                                                                          8),
                                                                  child: Column(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Row(
                                                                        children: [
                                                                          CircleAvatar(
                                                                            radius:
                                                                                24,
                                                                            backgroundImage:
                                                                                NetworkImage(data.displayImage!),
                                                                          ),
                                                                          Padding(
                                                                            padding: const EdgeInsets.fromLTRB(
                                                                                16,
                                                                                0,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                Column(
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsets.fromLTRB(0, 0, 0, 4),
                                                                                  child: Text(
                                                                                    widget.property!.ownerOrAgentName!,
                                                                                    style: TextStyle(color: ColorUtils.themeBlack, fontSize: 16, fontWeight: FontWeight.w800),
                                                                                  ),
                                                                                ),
                                                                                const Text(
                                                                                  "Owner/Agent",
                                                                                  style: TextStyle(color: ColorUtils.themeBlack, fontSize: 14, fontWeight: FontWeight.w500),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Container(
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: ColorUtils.buttonRed,
                                                                              borderRadius: BorderRadius.circular(20),
                                                                            ),
                                                                            height:
                                                                                36,
                                                                            width:
                                                                                36,
                                                                            child:
                                                                                IconButton(
                                                                              icon: Icon(Icons.email_outlined),
                                                                              color: ColorUtils.pureWhite,
                                                                              onPressed: () {
                                                                                launch("mailto:${data.email}");
                                                                              },
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: const EdgeInsets.fromLTRB(
                                                                                12,
                                                                                0,
                                                                                12,
                                                                                0),
                                                                            child:
                                                                                Container(
                                                                              decoration: BoxDecoration(
                                                                                color: ColorUtils.buttonRed,
                                                                                borderRadius: BorderRadius.circular(20),
                                                                              ),
                                                                              height: 36,
                                                                              width: 36,
                                                                              child: IconButton(
                                                                                icon: Icon(Icons.phone),
                                                                                color: ColorUtils.pureWhite,
                                                                                onPressed: () {
                                                                                  launch("tel:${int.tryParse(data.phoneNumber!) ?? 9827100678}");
                                                                                },
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                );
                                                              }

                                                              if (snapshot
                                                                  .hasError) {
                                                                return const Center(
                                                                    child: Text(
                                                                        "Error"));
                                                              } else {
                                                                return const Center(
                                                                    child:
                                                                        CircularProgressIndicator());
                                                              }
                                                            })),
                                                      ],
                                                    ),
                                                  ),
                                                  // child: Column(
                                                  //   children: [
                                                  //     Padding(
                                                  //       padding:
                                                  //           const EdgeInsets.all(8.0),
                                                  //       child: Row(
                                                  //         mainAxisAlignment:
                                                  //             MainAxisAlignment
                                                  //                 .spaceBetween,
                                                  //         children: [
                                                  //           Text(" Contact Seller"),
                                                  //           IconButton(
                                                  //               onPressed: () {
                                                  //                 Navigator.pop(context);
                                                  //               },
                                                  //               icon:
                                                  //                   Icon(PhosphorIcons.x))
                                                  //         ],
                                                  //       ),
                                                  //     ),
                                                  //     Row(
                                                  //       children: [
                                                  //         CircleAvatar(
                                                  //           radius: 30,
                                                  //           backgroundColor:
                                                  //               Colors.grey[300],
                                                  //           child: Icon(
                                                  //               Icons.person_2_outlined),
                                                  //         ),
                                                  //         Column(
                                                  //           mainAxisAlignment:
                                                  //               MainAxisAlignment.center,
                                                  //           crossAxisAlignment:
                                                  //               CrossAxisAlignment.start,
                                                  //           children: [
                                                  //             Text("Seller Name"),
                                                  //             Text(
                                                  //                 "selleremail@gmail.com"),
                                                  //             Text("9812345678")
                                                  //           ],
                                                  //         ),
                                                  //         Container(
                                                  //           height: MediaQuery.of(context)
                                                  //                   .size
                                                  //                   .height *
                                                  //               0.02,
                                                  //           color: Colors.greenAccent,
                                                  //           child: Row(
                                                  //             mainAxisAlignment:
                                                  //                 MainAxisAlignment
                                                  //                     .spaceBetween,
                                                  //             children: [
                                                  //               IconButton(
                                                  //                   onPressed: () {
                                                  //                     Navigator.pop(
                                                  //                         context);
                                                  //                   },
                                                  //                   icon: Icon(
                                                  //                       PhosphorIcons
                                                  //                           .phone)),
                                                  //               Text("Contact")
                                                  //             ],
                                                  //           ),
                                                  //         ),
                                                  //         TextField(
                                                  //           controller: _emailController,
                                                  //           decoration: InputDecoration(
                                                  //             labelText: 'Email',
                                                  //             border:
                                                  //                 OutlineInputBorder(),
                                                  //           ),
                                                  //         ),
                                                  //         TextField(
                                                  //           controller:
                                                  //               _fullNameController,
                                                  //           decoration: InputDecoration(
                                                  //             labelText: 'Full Name',
                                                  //             border:
                                                  //                 OutlineInputBorder(),
                                                  //           ),
                                                  //         ),
                                                  //         TextField(
                                                  //           controller: _phoneController,
                                                  //           decoration: InputDecoration(
                                                  //             labelText: 'Phone',
                                                  //             border:
                                                  //                 OutlineInputBorder(),
                                                  //           ),
                                                  //         ),
                                                  //         TextField(
                                                  //           maxLines: 3,
                                                  //           controller:
                                                  //               _messageController,
                                                  //           decoration: InputDecoration(
                                                  //             labelText: 'Message',
                                                  //             border:
                                                  //                 OutlineInputBorder(),
                                                  //           ),
                                                  //         ),
                                                  //         ElevatedButton(
                                                  //           onPressed: () {
                                                  //             print(
                                                  //                 _emailController.text);
                                                  //             print(_fullNameController
                                                  //                 .text);
                                                  //             print(
                                                  //                 _phoneController.text);
                                                  //             print(_messageController
                                                  //                 .text);
                                                  //           },
                                                  //           child: Text('Submit'),
                                                  //         ),
                                                  //       ],
                                                  //     )
                                                  //   ],
                                                  // ),
                                                ),
                                              );
                                            });
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        height: 40,
                                        width: 100,
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: const [
                                              Icon(
                                                Icons.call,
                                                size: 16,
                                              ),
                                              Text(
                                                " Contact",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color:
                                                        ColorUtils.themeBlack,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 12,
                                                    decoration:
                                                        TextDecoration.none),
                                              )
                                            ]),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ]),
                ),
              ]),
        ),
      ),
    );
  }
}
