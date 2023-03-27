import 'package:dufuna/core/model/property_model.dart';
import 'package:dufuna/core/util/colors.dart';
import 'package:dufuna/core/widget/property_box.dart';
import 'package:dufuna/view_model/property_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FakeRow extends StatelessWidget {
  final String? type;
  final double? height;
  final Widget? child;
  const FakeRow({super.key, this.child, this.height, this.type});

  @override
  Widget build(BuildContext context) {
    return Consumer<PropertyViewModel>(builder: (_, value, __) {
      List<PropertyModel> _properties = [];

      switch (type) {
        case "urgent":
          value.getUrgentProperties();
          _properties = value.urgentProperties;

          break;
        case "premium":
          value.getPremiumProperties();
          _properties = value.premiumProperties;
          break;
        case "featured":
          value.getFeatured();
          _properties = value.featuredProperties;
          break;
        case "house":
          value.getHouses();
          _properties = value.houses;
          break;
        case "land":
          value.getLands();
          _properties = value.lands;
          break;
        default:
          value.getUrgentProperties();
      }

      if (_properties.isEmpty) {
        return const Center(child: CircularProgressIndicator());
      }
      return SizedBox(
        height: height ?? MediaQuery.of(context).size.height * 0.18,
        width: double.maxFinite,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: List.generate(
            _properties.length,
            (index) => Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 0, 12),
              child: child == null
                  ? PropertyBox(
                      property: _properties[index],
                    )
                  : Container(
                      decoration: BoxDecoration(
                        color: ColorUtils.pureWhite,
                        border: Border.all(
                          width: .5,
                          color: ColorUtils.buttonRed,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      // height: 150,
                      width: 150,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.zero,
                                bottomRight: Radius.zero,
                                topLeft: Radius.circular(8),
                                topRight: Radius.circular(8),
                              ),
                              child: Image.asset(
                                "assets/images/villa_detail4.png",
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "Find Home",
                                style: TextStyle(
                                    color: ColorUtils.themeBlack,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ]),
                    ),
            ),
          ),
        ),
      );
    });
  }
}
