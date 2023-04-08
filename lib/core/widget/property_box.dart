import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../model/property_model.dart';
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
      child: Container(
        width: MediaQuery.of(context).size.width * 0.78,
        height: MediaQuery.of(context).size.height * 0.3,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Stack(
                children: [
                  ClipRect(
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.zero,
                        bottomRight: Radius.zero,
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                      ),
                      child: widget.property?.imgPath1 == null
                          ? Image.asset(
                              "./assets/images/gs1.png",
                              height: 180,
                              width: MediaQuery.of(context).size.width,
                              fit: BoxFit.fill,
                            )
                          : Image.network(
                              widget.property!.imgPath1!,
                              height: 180,
                              width: MediaQuery.of(context).size.width,
                              fit: BoxFit.fill,
                            ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      height: 30,
                      width: 70,
                      decoration: BoxDecoration(
                          color: ColorUtils.buttonRed,
                          borderRadius: BorderRadius.circular(4)),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "For Rent", //yo text center ma ayena
                          style: TextStyle(
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
              const Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 0, 6),
                child: Text(
                  "Kritipur - Flat or Room for Rent",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left, //yo text start ma gayena
                  style: TextStyle(
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
                    children: const [
                      Padding(
                        padding: EdgeInsets.fromLTRB(16, 8, 0, 6),
                        child: Icon(
                          Icons.place,
                          size: 15,
                          color: Color.fromARGB(255, 68, 69, 70),
                        ),
                      ),
                      Text(
                        "Kritipur, Kathmandu",
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Rs. 4,500",
                          style: TextStyle(
                            color: ColorUtils.themeBlack,
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            decoration: TextDecoration.none,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(64, 0, 0, 0),
                          child: GestureDetector(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    // return ;
                                    return AlertDialog(
                                      title: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(" Contact Seller"),
                                          IconButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              icon: Icon(PhosphorIcons.x))
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
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.8,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              1,
                                          // width: 300,
                                          color: Colors.red,
                                          child: Column(
                                            children: [],
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
                                borderRadius: BorderRadius.circular(4),
                              ),
                              height: 40,
                              width: 100,
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: const [
                                    Icon(
                                      Icons.call,
                                      size: 16,
                                    ),
                                    Text(
                                      "Contact",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: ColorUtils.themeBlack,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12,
                                          decoration: TextDecoration.none),
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
    );
  }
}
