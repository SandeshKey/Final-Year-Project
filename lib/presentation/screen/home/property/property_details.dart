import 'package:carousel_slider/carousel_slider.dart';
import 'package:olivehomes/core/model/property_model.dart';
import 'package:olivehomes/core/util/colors.dart';
import 'package:olivehomes/presentation/screen/home/property/widgets/amenty_widget.dart';
import 'package:olivehomes/presentation/screen/home/property/widgets/carousel.dart';
import 'package:olivehomes/view_model/fav_property_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widgets/info_text.dart';

class PropertyDetails extends StatefulWidget {
  final PropertyModel? propertyModel;
  const PropertyDetails({Key? key, this.propertyModel}) : super(key: key);

  @override
  State<PropertyDetails> createState() => _PropertyDetailsState();
}

class _PropertyDetailsState extends State<PropertyDetails> {
  final List imageList = [
    {"id": 1, "image_path": "assets/images/villa_details.png"},
    {"id": 2, "image_path": "assets/images/villa_details1.png"},
    {"id": 3, "image_path": "assets/images/villa_details2.png"},
    {"id": 3, "image_path": "assets/images/villa_detail4.png"},
  ];

  final CarouselController carouselController = CarouselController();

  int currentIndex = 0;
  bool added = false;

  @override
  Widget build(BuildContext context) {
    FavoritePropertiesViewModel favoritePropertiesViewModel =
        Provider.of<FavoritePropertiesViewModel>(context);

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
                          style: TextStyle(
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Column(
                    children: [
                      InfoText(
                        title: "Address",
                        data:
                            widget.propertyModel!.addressLine1 ?? "No address",
                      ),
                      InfoText(
                        title: "Safaley",
                        data: "This Safaley 101",
                      ),
                      InfoText(
                        title: "Safaley",
                        data: "This Safaley 101",
                      )
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
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 8, 8, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AmentyWidget(name: "hi", data: "2 bhk"),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: ColorUtils.buttonRed,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            height: 36,
                            width: 36,
                            child: const Icon(
                              Icons.bathtub,
                              color: ColorUtils.pureWhite,
                              size: 24,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                            child: Text(
                              "2 Bathrooms",
                              style: TextStyle(
                                  color: ColorUtils.pureWhite,
                                  fontWeight: FontWeight.bold),
                            ),
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
                            child: const Icon(
                              Icons.local_parking,
                              color: ColorUtils.pureWhite,
                              size: 24,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                            child: Text(
                              "Cars",
                              style: TextStyle(
                                  color: ColorUtils.pureWhite,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(12, 8, 12, 8),
              child: Divider(
                thickness: .5,
                color: ColorUtils.grey,
              ),
            ),
            Padding(
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
                              const CircleAvatar(
                                radius: 24,
                                backgroundImage: AssetImage(
                                    "assets/images/villa_details2.png"),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 0, 0, 4),
                                  child: Text(
                                    widget.propertyModel!.ownerOrAgentName!,
                                    style: TextStyle(
                                        color: ColorUtils.pureWhite,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w800),
                                  ),
                                ),
                                const Text(
                                  "Owner",
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
                        child: const Icon(
                          Icons.messenger_outline_rounded,
                          color: ColorUtils.pureWhite,
                          size: 24,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: ColorUtils.buttonRed,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          height: 36,
                          width: 36,
                          child: const Icon(
                            Icons.phone,
                            color: ColorUtils.pureWhite,
                            size: 24,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Padding(
                  padding: EdgeInsets.fromLTRB(8, 8, 0, 4),
                  child: Text(
                    "Overview",
                    style: TextStyle(
                        color: ColorUtils.pureWhite,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
