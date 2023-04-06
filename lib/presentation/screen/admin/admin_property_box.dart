import 'package:dufuna/core/model/property.dart';
import 'package:dufuna/core/model/property_model.dart';
import 'package:dufuna/core/util/colors.dart';
import 'package:dufuna/presentation/forms/contact_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class AdminPropertyBox extends StatefulWidget {
  final PropertyModel? property;
  const AdminPropertyBox({Key? key, this.property}) : super(key: key);

  @override
  State<AdminPropertyBox> createState() => _PropertyBoxState();
}

class _PropertyBoxState extends State<AdminPropertyBox> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 8, 4, 12),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.364,
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
                              "./assets/images/housetry.png",
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
                padding: const EdgeInsets.fromLTRB(16, 8, 0, 8),
                child: Text(
                  "Kritipur - Flat or Room for Rent",
                  textAlign: TextAlign.left, //yo text start ma gayena
                  style: TextStyle(
                      color: ColorUtils.themeBlack,
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      overflow: TextOverflow.fade,
                      decoration: TextDecoration.none),
                ),
              ),
              Column(
                children: [
                  Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.fromLTRB(16, 8, 0, 8),
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
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Rs. 4,500",
                          style: TextStyle(
                            color: ColorUtils.themeBlack,
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
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
                                          color: Colors.indigo,
                                          child: Column(
                                            children: [],
                                          ),
                                        ),
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
                                      size: 19,
                                    ),
                                    Text(
                                      "Contact",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: ColorUtils.themeBlack,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
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
