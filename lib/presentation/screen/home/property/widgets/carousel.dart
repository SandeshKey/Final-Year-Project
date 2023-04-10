import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/model/property_model.dart';
import '../../../../../core/util/colors.dart';
import '../../../../../view_model/fav_property_view_model.dart';

class PropertyCarousel extends StatefulWidget {
  final PropertyModel propertyModel;
  const PropertyCarousel({super.key, required this.propertyModel});

  @override
  State<PropertyCarousel> createState() => _PropertyCarouselState();
}

class _PropertyCarouselState extends State<PropertyCarousel> {
  int currentIndex = 0;
  bool added = false;
  final CarouselController carouselController = CarouselController();
  final List imageList = [
    {"id": 1, "image_path": "assets/images/villa_details.png"},
    {"id": 2, "image_path": "assets/images/villa_details1.png"},
    {"id": 3, "image_path": "assets/images/villa_details2.png"},
    {"id": 3, "image_path": "assets/images/villa_detail4.png"},
  ];

  @override
  Widget build(BuildContext context) {
     FavoritePropertiesViewModel favoritePropertiesViewModel =
        Provider.of<FavoritePropertiesViewModel>(context);
    return Stack(
      children: [
        InkWell(
          onTap: () {
            print(currentIndex);
          },
          child: CarouselSlider(
            items: [
              Image.network(
                widget.propertyModel.imgPath1!,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
              Image.network(
                widget.propertyModel.imgPath2!,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
              Image.network(
                widget.propertyModel.imgPath3!,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
              Image.network(
                widget.propertyModel.imgPath4!,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ],
            // items: imageList
            //     .map(
            //       (item) => Image.asset(
            //         item['image_path'],
            //         fit: BoxFit.cover,
            //         width: double.infinity,
            //       ),
            //     )
            //     .toList(),
            carouselController: carouselController,
            options: CarouselOptions(
              scrollPhysics: const BouncingScrollPhysics(),
              autoPlay: true,
              aspectRatio: 1.5, //manages height ratio
              viewportFraction: 1, //manages zoom viewport
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                });
              },
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imageList.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => carouselController.animateToPage(entry.key),
                child: Container(
                  width: currentIndex == entry.key ? 17 : 7,
                  height: 7.0,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 3.0,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: currentIndex == entry.key
                          ? Colors.red
                          : Colors.white),
                ),
              );
            }).toList(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: ColorUtils.buttonRed,
                  borderRadius: BorderRadius.circular(20),
                ),
                height: 36,
                width: 36,
                child: IconButton(
                  icon: Icon(
                    Icons.favorite,
                    color: ColorUtils.pureWhite,
                    size: 24,
                  ),
                  onPressed: () {
                    if (!added) {
                      favoritePropertiesViewModel
                          .addFavoriteProperty(widget.propertyModel);

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Added to favorites"),
                        ),
                      );

                      setState(() {
                        added = true;
                      });
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Already added to favorites"),
                        ),
                      );
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
                child: Container(
                  decoration: BoxDecoration(
                    color: ColorUtils.buttonRed,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  height: 36,
                  width: 36,
                  child: const Icon(
                    Icons.share,
                    color: ColorUtils.pureWhite,
                    size: 24,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
