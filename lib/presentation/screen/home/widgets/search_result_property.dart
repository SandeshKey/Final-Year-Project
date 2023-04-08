import 'package:olivehomes/core/util/extension.dart';
import 'package:olivehomes/presentation/screen/property/property_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../../core/model/property_model.dart';
import '../../../../core/util/colors.dart';

class SearchResultProperty extends StatelessWidget {
  final PropertyModel? myProperty;
  const SearchResultProperty({super.key, this.myProperty});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          context.push(PropertyDetails(
            propertyModel: myProperty,
          ));
        },
        child: Container(
          height: MediaQuery.of(context).size.height * 0.18,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Expanded(
                  flex: 1,
                  child: FadeInImage(
                    height: MediaQuery.of(context).size.height * 0.16,
                    image: NetworkImage(
                      myProperty!.imgPath1!,
                    ),
                    fit: BoxFit.fitHeight,
                    placeholder: AssetImage(
                      "assets/images/bed_room.png",
                    ),
                  )),
              Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        myProperty!.propertyTitle ?? "Title",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                        const   Icon(Icons.location_on),
                          Text(
                            myProperty!.address ?? "Lainchaur, Kathmandu",
                            style: const TextStyle(
                              color: ColorUtils.themeBlack,
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                              overflow: TextOverflow.fade,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(
                        height: 20,
                      ),

                      Text(
                        "Rs. ${myProperty!.price} ${myProperty!.priceUnit}",
                        style: const TextStyle(
                          color: ColorUtils.themeBlack,
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          decoration: TextDecoration.none,
                        ),
                      ),

                      //Contact Button
                      Container(
                        height: 40,
                        width: 100,
                        decoration: BoxDecoration(
                          border:
                              Border.all(width: 1, style: BorderStyle.solid),
                          // color: Colors.red,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            "Contact",
                            style: TextStyle(
                              // color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
