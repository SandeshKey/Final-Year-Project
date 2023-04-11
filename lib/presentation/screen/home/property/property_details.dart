import 'package:olivehomes/core/model/property_model.dart';
import 'package:olivehomes/core/model/user.dart';
import 'package:olivehomes/core/util/colors.dart';
import 'package:olivehomes/presentation/screen/home/property/widgets/amenty_widget.dart';
import 'package:olivehomes/presentation/screen/home/property/widgets/carousel.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/service/db _services.dart';
import 'widgets/info_text.dart';

class PropertyDetails extends StatefulWidget {
  final PropertyModel? propertyModel;
  const PropertyDetails({Key? key, this.propertyModel}) : super(key: key);

  @override
  State<PropertyDetails> createState() => _PropertyDetailsState();
}

class _PropertyDetailsState extends State<PropertyDetails> {
  @override
  Widget build(BuildContext context) {
    Widget landView() {
      return Column(
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(8, 8, 0, 4),
            child: Text(
              "Property Details",
              style: TextStyle(
                  color: ColorUtils.pureWhite,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          ),
          Column(
            children: [
              InfoText(
                  title: "Address",
                  data: widget.propertyModel!.address ?? "Pokhara 25 Hemja"),
              InfoText(
                  title: "Area",
                  data:
                      "${widget.propertyModel!.propertyArea} ${widget.propertyModel!.areaUnit}"),
              InfoText(
                  title: "Price",
                  data:
                      "${widget.propertyModel!.price} ${widget.propertyModel!.priceUnit}"),
              InfoText(
                  title: "Entry Date",
                  data: widget.propertyModel!.entryDate!
                      .replaceRange(10, 23, '')),
              InfoText(
                  title: "Nearest landmark",
                  data: widget.propertyModel!.nearestLandmark!),
              InfoText(
                  title: "Road Type", data: widget.propertyModel!.roadType!),
              InfoText(
                  title: "Road Size",
                  data: "${widget.propertyModel!.roadSize!.toString()} meter "),
            ],
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(8, 8, 0, 4),
            child: Text(
              "Amenities",
              style: TextStyle(
                  color: ColorUtils.pureWhite,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          ),
          Wrap(
            children: const [
              AmentyWidget(
                  iconName: Icons.electric_bolt, data: "Electricity: Yes"),
              AmentyWidget(
                  iconName: Icons.water_drop_sharp, data: "Water: Yes"),
              AmentyWidget(iconName: Icons.pattern_sharp, data: "Road: Yes"),
            ],
          )
        ],
      );
    }

    Widget houseView() {
      return Column(
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(8, 8, 0, 4),
            child: Text(
              "Property Details",
              style: TextStyle(
                  color: ColorUtils.pureWhite,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          ),
          Container(
            child: Column(
              children: [
                InfoText(
                    title: "Price",
                    data:
                        "${widget.propertyModel!.price} ${widget.propertyModel!.priceUnit}"),
                InfoText(
                    title: "Entry Date",
                    data: widget.propertyModel!.entryDate!
                        .replaceRange(10, 23, '')),
                InfoText(
                    title: "Nearest landmark",
                    data: widget.propertyModel!.nearestLandmark!),
                InfoText(
                    title: "Road Type", data: widget.propertyModel!.roadType!),
                InfoText(
                    title: "Road Size",
                    data:
                        "${widget.propertyModel!.roadSize!.toString()} meter "),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(8, 8, 0, 4),
            child: Text(
              "Amenities",
              style: TextStyle(
                  color: ColorUtils.pureWhite,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          ),
          Wrap(
            children: [
              AmentyWidget(
                  iconName: Icons.bed,
                  data:
                      "${widget.propertyModel!.attachedBedroom!.toString()} Bedrooms"),
              AmentyWidget(
                  iconName: Icons.kitchen,
                  data:
                      "${widget.propertyModel!.kitchen!.toString()} Kitchens"),
              AmentyWidget(
                  iconName: Icons.bathroom,
                  data:
                      "${widget.propertyModel!.bathRoom!.toString()} Bathrooms"),
              AmentyWidget(
                  iconName: Icons.local_parking,
                  data: "${widget.propertyModel!.bikeCount!.toString()} Bike"),
              AmentyWidget(
                  iconName: Icons.local_parking,
                  data: "${widget.propertyModel!.carCount!.toString()} Car"),
              const AmentyWidget(
                  iconName: Icons.electric_bolt, data: "Electricity: Yes"),
              const AmentyWidget(
                  iconName: Icons.water_drop_sharp, data: "Water: Yes"),
              const AmentyWidget(
                  iconName: Icons.pattern_sharp, data: "Road: Yes"),
            ],
          )
        ],
      );
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorUtils.themeBlack,
        body: SingleChildScrollView(
          child: Column(children: [
            PropertyCarousel(propertyModel: widget.propertyModel!),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
                  child: Text(
                    widget.propertyModel!.propertyTitle!,
                    style: const TextStyle(
                        color: ColorUtils.pureWhite,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Chip(
                        label: Text(
                          widget.propertyModel!.propertyType!,
                          style: const TextStyle(
                              color: ColorUtils.pureWhite,
                              fontWeight: FontWeight.bold),
                        ),
                        backgroundColor: ColorUtils.buttonRed,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: const [
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 20,
                            ),
                            Text(
                              "  4.4 (12,399 reviews)",
                              style: TextStyle(
                                  color: ColorUtils.pureWhite,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            widget.propertyModel!.propertyType! == "Land"
                ? landView()
                : houseView(),
            // Column(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     Container(
            //       child: Column(
            //         children: [
            //           InfoText(
            //             title: "Address",
            //             data:
            //                 widget.propertyModel!.addressLine1 ?? "No address",
            //           ),
            //           InfoText(
            //             title: "Safaley",
            //             data: "This Safaley 101",
            //           ),
            //           InfoText(
            //             title: "Safaley",
            //             data: "This Safaley 101",
            //           )
            //         ],
            //       ),
            //     ),

            //     Padding(
            //       padding: const EdgeInsets.fromLTRB(12, 8, 8, 0),
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //           AmentyWidget(iconName: Icons.bluetooth, data: "2 bhk"),
            //           Row(
            //             children: [
            //               Container(
            //                 decoration: BoxDecoration(
            //                   color: ColorUtils.buttonRed,
            //                   borderRadius: BorderRadius.circular(20),
            //                 ),
            //                 height: 36,
            //                 width: 36,
            //                 child: const Icon(
            //                   Icons.bathtub,
            //                   color: ColorUtils.pureWhite,
            //                   size: 24,
            //                 ),
            //               ),
            //               const Padding(
            //                 padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
            //                 child: Text(
            //                   "2 Bathrooms",
            //                   style: TextStyle(
            //                       color: ColorUtils.pureWhite,
            //                       fontWeight: FontWeight.bold),
            //                 ),
            //               ),
            //             ],
            //           ),
            //           Row(
            //             children: [
            //               Container(
            //                 decoration: BoxDecoration(
            //                   color: ColorUtils.buttonRed,
            //                   borderRadius: BorderRadius.circular(20),
            //                 ),
            //                 height: 36,
            //                 width: 36,
            //                 child: const Icon(
            //                   Icons.local_parking,
            //                   color: ColorUtils.pureWhite,
            //                   size: 24,
            //                 ),
            //               ),
            //               const Padding(
            //                 padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
            //                 child: Text(
            //                   "Cars",
            //                   style: TextStyle(
            //                       color: ColorUtils.pureWhite,
            //                       fontWeight: FontWeight.bold),
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ],
            //       ),
            //     )
            //   ],
            // ),
            const Padding(
              padding: EdgeInsets.fromLTRB(12, 8, 12, 8),
              child: Divider(
                thickness: .5,
                color: ColorUtils.grey,
              ),
            ),

            FutureBuilder(
                future: DatabaseServices()
                    .getUserData(widget.propertyModel!.addedBy!),
                builder: ((context, snapshot) {
                  if (snapshot.hasData) {
                    final data = snapshot.data as AppUser;
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(12, 0, 0, 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 24,
                                        backgroundImage:
                                            NetworkImage(data.displayImage!),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(16, 0, 0, 0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(0, 0, 0, 4),
                                          child: Text(
                                            widget.propertyModel!
                                                .ownerOrAgentName!,
                                            style: TextStyle(
                                                color: ColorUtils.pureWhite,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w800),
                                          ),
                                        ),
                                        const Text(
                                          "Owner/Agent",
                                          style: TextStyle(
                                              color: ColorUtils.pureWhite,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: ColorUtils.buttonRed,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                height: 36,
                                width: 36,
                                child: IconButton(
                                  icon: Icon(Icons.email_outlined),
                                  color: ColorUtils.pureWhite,
                                  onPressed: () {
                                    launch("mailto:${data.email}");
                                  },
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(12, 0, 12, 0),
                                child: Container(
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
                                      launch(
                                          "tel:${int.tryParse(data.phoneNumber!) ?? 9827100678}");
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

                  if (snapshot.hasError) {
                    return const Center(child: Text("Error"));
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                })),

            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(8, 8, 0, 4),
                  child: Align(
                    child: Text(
                      "Overview",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: ColorUtils.buttonRed,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 58.0),
                  child: Text(
                    widget.propertyModel!.landDetail ?? """ This is a 2 bhk """,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                )
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
