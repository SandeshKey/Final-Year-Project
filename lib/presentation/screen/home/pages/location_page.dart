import 'package:flutter/material.dart';
import 'package:olivehomes/core/service/location_service.dart';
import 'package:olivehomes/core/util/colors.dart';
import 'package:location/location.dart';
import 'package:geocoding/geocoding.dart' as goa;

class LocationPage extends StatefulWidget {
  const LocationPage({super.key});

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  String? lat, long, country, adminArea;
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: ColorUtils.buttonRed,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(4),
                    bottomRight: Radius.circular(4),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 16, 16, 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(
                              Icons.arrow_back_ios,
                              color: ColorUtils.pureWhite,
                              // color: ColorUtils.buttonRed,
                              size: 24,
                            ),
                          ),
                          const Padding(
                            padding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
                            child: Text(
                              "Live Location",
                              style: TextStyle(
                                color: ColorUtils.pureWhite,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
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
                padding: const EdgeInsets.all(32.0),
                child: Text(
                  "YOUR CURRENT LOCATION",
                  style: TextStyle(
                      color: ColorUtils.themeBlack,
                      fontSize: 22,
                      fontWeight: FontWeight.w700),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 32),
                child: Image.network(
                    "https://cdn-icons-png.flaticon.com/128/819/819814.png"),
              ),
              Text("Latitude : ${lat ?? 'Loading..'}"),
              SizedBox(height: 20),
              Text("Longitude : ${long ?? 'Loading..'}"),
              SizedBox(height: 20),
              Text("Country : ${country ?? 'Loading..'}"),
              SizedBox(height: 20),
              Text("Admin Area : ${adminArea ?? 'Loading..'}"),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  void getLocation() async {
    final service = LocationService();
    final locationData = await service.getLocation();

    if (locationData != null) {
      final placeMark = await service.getPlaceMark(locationData: locationData);

      setState(() {
        lat = locationData.latitude!.toStringAsFixed(2);
        long = locationData.longitude!.toStringAsFixed(2);

        country = placeMark?.country ?? 'could not get country';
        adminArea =
            placeMark?.administrativeArea ?? 'could not get the admin area';
      });
    }
  }
}
