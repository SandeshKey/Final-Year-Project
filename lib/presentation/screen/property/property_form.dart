import 'dart:convert';
import 'dart:io';
import 'package:dufuna/core/service/db%20_services.dart';
import 'package:dufuna/presentation/screen/property/widgets/radio_buttons.dart';
import 'package:dufuna/presentation/screen/property/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:path_provider/path_provider.dart';
// import 'package:form_builder_file_picker/form_builder_file_picker.dart';
import 'package:toast/toast.dart';
import '../../../core/model/property_model.dart';
import 'package:path/path.dart' as paths;

import '../../../data/datas/data.dart';
import 'widgets/drop_down.dart';
import 'widgets/slider.dart';
// import 'demo_home.dart';

class DetailForm extends StatefulWidget {
  bool? isLand;
  PropertyModel? myproperty;
  bool? isfromEdit;
  DetailForm(
      {Key? key, this.isLand = false, this.myproperty, this.isfromEdit = false})
      : super(key: key);

  @override
  State<DetailForm> createState() => _DetailFormState();
}

class _DetailFormState extends State<DetailForm> {
  final _formkey = GlobalKey<FormBuilderState>();

  final PropertyModel _property = PropertyModel();

  _header(String title) {
    return Text(
      title,
      style: const TextStyle(
          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
    );
  }

  showLand(bool? isLand) {
    if (isLand != true) {
      return Column(
        children: [
          _header("Room Layout"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.40,
                  child: FormTextField(
                    initialValue: widget.myproperty?.livingRoom.toString(),
                    label: "Living Room",
                    keyboardType: TextInputType.number,
                  )),
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.30,
                  child: FormTextField(
                    initialValue: widget.myproperty?.kitchen.toString(),
                    label: "Kitchen",
                    keyboardType: TextInputType.number,
                  )),
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.30,
                  child: FormTextField(
                    initialValue: widget.myproperty?.bathRoom.toString(),
                    label: "Bathroom",
                    keyboardType: TextInputType.number,
                  )),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.50,
                  child: FormTextField(
                    initialValue: widget.myproperty?.bedRoom.toString(),
                    label: "Common Bedroom",
                    keyboardType: TextInputType.number,
                  )),
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.50,
                  child: FormTextField(
                    initialValue:
                        widget.myproperty?.attachedBathroom.toString(),
                    label: "Attached Bedroom",
                    keyboardType: TextInputType.number,
                  )),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.60,
                child: FormRadioButton(
                  initialRadioValue: widget.myproperty?.bikeParking == null
                      ? null
                      : _tobool(widget.myproperty!.bikeParking!),
                  radioLabel: "Bike Parking",
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.40,
                  // width: 100,
                  child: FormTextField(
                    initialValue: widget.myproperty?.carCount == null
                        ? "0"
                        : widget.myproperty?.carCount.toString(),
                    label: "Bike Count",
                    keyboardType: TextInputType.number,
                  ),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.60,
                child: FormRadioButton(
                  initialRadioValue: widget.myproperty?.carParking == null
                      ? null
                      : _tobool(widget.myproperty!.carParking!),
                  radioLabel: "Car Parking",
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.40,
                  // width: 100,
                  child: FormTextField(
                    initialValue: widget.myproperty?.carCount == null
                        ? "0"
                        : widget.myproperty?.carCount.toString(),
                    label: "Car Count",
                    keyboardType: TextInputType.number,
                  ),
                ),
              )
            ],
          ),
          FormRadioButton(
            initialRadioValue: widget.myproperty?.furnished == null
                ? null
                : _tobool(widget.myproperty!.furnished!),
            radioLabel: "Wifi",
          ),
          FormRadioButton(
            initialRadioValue: widget.myproperty?.furnished == null
                ? null
                : _tobool(widget.myproperty!.furnished!),
            radioLabel: "Furnished",
          ),
          FormSlider(
            name: 'Storey',
            sliderLabel: 'Storey',
            initialValue: 3,
            mainInitialvalue: widget.myproperty?.storey,
            divisions: 20,
            max: 10,
          ),
          FormTextField(
            initialValue: widget.myproperty?.buildDate,
            label: "Build Year",
            keyboardType: TextInputType.text,
          ),
        ],
      );
    } else {
      return FormTextField(
        initialValue: widget.myproperty?.landDetail,
        maxLines: 3,
        label: "Land Detail",
        keyboardType: TextInputType.text,
      );
    }
  }

  Widget? showAttachments(bool isedit) {
    if (isedit == true) {
      print(widget.myproperty!.imgPath1);

      return Container();

      // return Padding(
      //   // padding: const EdgeInsets.all(8.0),
      //   padding: const EdgeInsets.fromLTRB(10, 8, 8, 8.0),

      //   child: FormBuilderFilePicker(
      //     // validator: FormBuilderValidators.required(),
      //     // initialValue: [
      //     //   PlatformFile(
      //     //       path: widget.myproperty!.imgPath1!,
      //     //       name: widget.myproperty!.imgPath1!.replaceAll(
      //     //           "/data/user/0/com.neptechpal.sorhaaanahomes/app_flutter/",
      //     //           ""),
      //     //       size: 39939),

      //     //   PlatformFile(
      //     //       path: widget.myproperty!.imgPath2!,
      //     //       name: widget.myproperty!.imgPath2!.replaceAll(
      //     //           "/data/user/0/com.neptechpal.sorhaaanahomes/app_flutter/",
      //     //           ""),
      //     //       size: 39939),
      //     //   PlatformFile(
      //     //       path: widget.myproperty!.imgPath3!,
      //     //       name: widget.myproperty!.imgPath3!.replaceAll(
      //     //           "/data/user/0/com.neptechpal.sorhaaanahomes/app_flutter/",
      //     //           ""),
      //     //       size: 39939),
      //     //   PlatformFile(
      //     //       path: widget.myproperty!.imgPath1!,
      //     //       name: widget.myproperty!.imgPath2!.replaceAll(
      //     //           "/data/user/0/com.neptechpal.sorhaaanahomes/app_flutter/",
      //     //           ""),
      //     //       size: 39939),
      //     //   // PlatformFile(name: widget.myproperty!.imgPath2!, size: 2),
      //     //   // PlatformFile(name: widget.myproperty!.imgPath3!, size: 2),
      //     //   // PlatformFile(name: widget.myproperty!.imgPath4!, size: 2),
      //     // ],

      //     // initialValue: [],
      //     name: "images",
      //     decoration: const InputDecoration(
      //         labelText: "Attachments", labelStyle: TextStyle(fontSize: 18.0)),
      //     maxFiles: 4,
      //     previewImages: true,
      //     onChanged: (val) {
      //       setState(() {});
      //       // update
      //     },
      //     selector: Row(
      //       children: const [
      //         Icon(Icons.file_upload),
      //         Text('Upload'),
      //       ],
      //     ),
      //     onFileLoading: (val) {
      //       print(val);
      //     },
      //   ),
      // );
    } else {
      return Padding(
        // padding: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.fromLTRB(10, 8, 8, 8.0),

        // child: FormBuilderFilePicker(
        //   // initialValue: [],
        //   name: "images",
        //   decoration: const InputDecoration(
        //       labelText: "Attachments", labelStyle: TextStyle(fontSize: 18.0)),
        //   maxFiles: 4,
        //   previewImages: true,
        //   onChanged: (val) => print(val),
        //   selector: Row(
        //     children: const [
        //       Icon(Icons.file_upload),
        //       Text('Upload'),
        //     ],
        //   ),
        //   onFileLoading: (val) {
        //     print(val);
        //   },
        // ),
      );
    }
  }

  @override
  void initState() {
    super.initState();

    setState(() {});
  }

  Future<String> tempToFileConverter(String path) async {
    File tempFile = File(path);
    final appDir = await getApplicationDocumentsDirectory();
    final fileName = paths.basename(tempFile.path);

    tempFile = await tempFile.copy('${appDir.path}/$fileName');

    return tempFile.toString();
  }

  bool _tobool(String value) {
    if (value == 'true') {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);

    PropertyModel myproperty1 = PropertyModel();

    print(widget.isLand);

    if (widget.isfromEdit == true) {
      setState(() {
        myproperty1 = widget.myproperty!;
      });
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Form'),
      ),
      body: FormBuilder(
        // autovalidateMode: AutovalidateMode.always,
        key: _formkey,
        child: SingleChildScrollView(
            child: Column(
          children: [
            Padding(
              // padding: const EdgeInsets.all(8.0),
              padding: const EdgeInsets.fromLTRB(10, 8, 8, 8.0),

              child: FormBuilderChoiceChip(
                validator: FormBuilderValidators.required(),
                initialValue: widget.myproperty?.propertyIs == null
                    ? null
                    : widget.myproperty!.propertyIs,
                // initialValue: 'House & others',
                onChanged: (value) {
                  setState(() {
                    if (value != 'House & others') {
                      setState(() {
                        widget.isLand = true;
                      });
                    } else {
                      setState(() {
                        widget.isLand = false;
                        // widget.myproperty?.propertyIs = 'Land';
                      });
                    }
                  });
                },
                // validator: FormBuilderValidators.required(),
                backgroundColor: Colors.black45,
                selectedColor: Colors.indigo,
                labelStyle: TextStyle(color: Colors.white),
                spacing: 44.0,
                name: 'propertyIs',
                decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 5.0, vertical: 5),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    labelText: 'Property Is: ',
                    labelStyle: TextStyle(fontSize: 18.0)),
                options: const [
                  FormBuilderFieldOption(
                    value: 'Land',
                    child: Text(
                      'Land',
                    ),
                  ),
                  FormBuilderFieldOption(
                    value: 'House & others',
                    child: Text('House & others'),
                  ),
                ],
              ),
            ),
            _header("General Details"),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 8, 8, 8.0),
              child: FormBuilderChoiceChip(
                validator: FormBuilderValidators.required(),

                initialValue: widget.myproperty?.propertyFor == null
                    ? null
                    : widget.myproperty!.propertyFor,
                // initialValue: 'Rent',
                // validator: FormBuilderValidators.required(),
                backgroundColor: Colors.black45,

                // disabledColor: Colors.amber,
                // shadowColor: Colors.black,
                selectedColor: Colors.indigo,
                labelStyle: const TextStyle(
                  color: Colors.white,
                ),
                spacing: 44.0,
                name: 'choice_chip',
                decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 5.0, vertical: 5),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    labelText: 'Property For: ',
                    labelStyle: TextStyle(fontSize: 18)),
                options: const [
                  FormBuilderFieldOption(
                    value: 'Rent',
                    child: Text(
                      'Rent',
                    ),
                  ),
                  FormBuilderFieldOption(
                    value: 'Sale',
                    child: Text('Sale'),
                  ),
                  FormBuilderFieldOption(
                    value: 'Exchange',
                    child: Text('Exchange'),
                  ),
                ],
              ),
            ),
            FormTextField(
              label: "Property Id",
              keyboardType: TextInputType.number,
              initialValue: widget.myproperty?.propertyId,
            ),
            FormDropDown(
              initialValue: widget.myproperty?.propertyType,
              dropdownItems: propertyType,
              label: "Property Type",
            ),
            FormDropDown(
              initialValue: widget.myproperty?.propertyPurpose,
              dropdownItems: propertyPurpose,
              label: "Property Purpose",
            ),
            FormTextField(
              initialValue: widget.myproperty?.propertyFeature,
              label: "Property Feature",
              keyboardType: TextInputType.text,
              maxLines: 1,
              isLimited: true,
            ),
            _header("Location Details"),
            // FormTextField(
            //   label: "Address Line 1",
            //   keyboardType: TextInputType.text,
            // ),
            FormTextField(
              initialValue: widget.myproperty?.addressLine1,
              label: "Address Line 1",
              keyboardType: TextInputType.text,
              isLimited: true,
            ),

            FormTextField(
              initialValue: widget.myproperty?.city,
              label: "City",
              keyboardType: TextInputType.text,
            ),
            FormTextField(
              initialValue: widget.myproperty?.wardNumber.toString(),
              label: "Ward Number",
              keyboardType: TextInputType.number,
            ),
            FormTextField(
              initialValue: widget.myproperty?.nearestLandmark,
              label: "Nearest Landmark",
              keyboardType: TextInputType.text,
            ),
            _header("Property Details"),
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: FormTextField(
                    initialValue: widget.myproperty?.propertyArea,

                    label: "Property Area",
                    keyboardType: TextInputType.text,
                    // maxLines: 3,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: FormDropDown(
                    initialValue: widget.myproperty?.areaUnit,
                    dropdownItems: areaUnit,
                    label: "Area Unit",
                  ),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.50,
                  child: FormDropDown(
                    initialValue: widget.myproperty?.type,
                    dropdownItems: type,
                    label: "Type",
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.50,
                  child: FormTextField(
                    initialValue: widget.myproperty?.price.toString(),
                    label: "Price",
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),

            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.50,
                  child: FormDropDown(
                    initialValue: widget.myproperty?.priceUnit1,
                    dropdownItems: amount,
                    label: "Price Unit",
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.50,
                  child: FormDropDown(
                    initialValue: widget.myproperty?.priceUnit,
                    dropdownItems: priceUnit,
                    label: "Per Unit",
                  ),
                ),
              ],
            ),
            FormDropDown(
              initialValue: widget.myproperty?.roadType,
              dropdownItems: roadType,
              label: "Road Type",
            ),

            FormSlider(
              mainInitialvalue: widget.myproperty?.roadSize,
              name: 'slider',
              sliderLabel: "Road Size (Ft.)",
              divisions: 100,
              initialValue: 12,
              max: 100,
            ),

            FormDropDown(
              initialValue: widget.myproperty?.propertyFace,
              dropdownItems: propertyFace,
              label: "Property Face",
            ),

            FormRadioButton(
              initialRadioValue: widget.myproperty?.propertyElectricity == null
                  ? null
                  : _tobool(widget.myproperty!.propertyElectricity!),
              radioLabel: "Property Electricity",
            ),
            FormRadioButton(
              initialRadioValue: widget.myproperty?.propertyWatersupply == null
                  ? null
                  : _tobool(widget.myproperty!.propertyWatersupply!),
              radioLabel: "Property Watersupply",
            ),

            showLand(widget.isLand),

            _header("Ownership Details "),
            FormDropDown(
                initialValue: widget.myproperty?.ownershipType,
                label: "Ownership Type",
                dropdownItems: ownership),
            FormTextField(
              initialValue: widget.myproperty?.ownerOrAgentName.toString(),
              label: "Owner Or Agent Name",
              keyboardType: TextInputType.text,
            ),
            FormTextField(
              initialValue: widget.myproperty?.agentAddress.toString(),
              label: "Owner Or Agent Address",
              keyboardType: TextInputType.text,
            ),
            FormTextField(
              initialValue: widget.myproperty?.phoneNumber.toString(),
              label: "Phone Number",
              keyboardType: TextInputType.number,
            ),
            _header("Submitted By"),

            FormTextField(
              initialValue: widget.myproperty?.name.toString(),
              label: "Name",
              keyboardType: TextInputType.text,
            ),

            Padding(
              // padding: const EdgeInsets.all(8.0),
              padding: const EdgeInsets.fromLTRB(10, 8, 8, 8.0),

              child: FormBuilderDateTimePicker(
                initialValue: widget.myproperty?.entryDate == null
                    ? null
                    : DateTime.parse(widget.myproperty!.entryDate.toString()),

                name: 'submitDate',
                // onChanged: _onChanged,
                inputType: InputType.date,
                decoration: const InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 5.0, vertical: 5),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  labelText: 'Submit Date',
                ),
                initialTime: TimeOfDay(hour: 8, minute: 0),
                // initialValue: Date.now(),
                // enabled: true,
              ),
            ),
            showAttachments(widget.isfromEdit!)!,

            ElevatedButton(
                onPressed: () {
                  _formkey.currentState?.reset();
                },
                child: Text("Reset")),
            ElevatedButton(
                onPressed: () async {
                  print(" THis is printed at very first");

                  if (_formkey.currentState!.validate() == true) {
                    _formkey.currentState?.save();

                    print(_formkey.currentState?.value);
                    print(_formkey.currentState?.validate());

                    _property.propertyFor =
                        _formkey.currentState?.value['propertyFor'];
                    var json = _formkey.currentState?.value;
                    print(json!);

                    print("property id is ${json['propertyId']}");

                    PropertyModel property = PropertyModel(
                      address: json['addressLine1'],

                      propertyId: json['propertyId'],
                      propertyIs: json['propertyIs'],
                      propertyFor: json['propertyFor'],
                      propertyArea: json['propertyArea'],
                      areaUnit: json['areaUnit'],
                      type: json['type'],
                      price: int.parse(json['price']),
                      priceUnit: json['priceUnit'],
                      priceUnit1: json['priceUnit1'],
                      roadType: json['roadType'],
                      roadSize: json['slider'],
                      propertyFace: json['propertyFace'],
                      propertyElectricity:
                          json['propertyElectricity'].toString(),
                      propertyWatersupply:
                          json['propertyWatersupply'].toString(),
                      ownershipType: json['ownershipType'],
                      ownerOrAgentName: json['ownerOrAgentName'],
                      agentAddress: json['agentAddress'],
                      phoneNumber: json['phoneNumber'].toString(),
                      name: json['name'],
                      entryDate: json['submitDate'].toString(),
                      carParking: json['carParking'],
                      carCount: int.parse(
                          json['carCount'] == null ? "0" : json['carCount']),
                      bikeParking: json['bikeParking'],
                      bikeCount: int.parse(
                          json['bikeCount'] == null ? "0" : json['bikeCount']),

                      propertyTitle: json['propertyFeature'],

                      // attachments: json['attachments'],
                    );

                    print("property id is ${property.propertyId}");

                    DatabaseServices().addProperty(property);

                    // _property.propertyIs = json['propertyIs'];
                    // _property.propertyFor = json['choice_chip'];

                    // if (_property.propertyFor == "Rent" &&
                    //     _property.propertyIs == "Land") {
                    //   _property.propertyId = "SRL${json['propertyId']}";
                    // } else if (_property.propertyFor == "Sale" &&
                    //     _property.propertyIs == "Land") {
                    //   _property.propertyId = "SSL${json['propertyId']}";
                    // } else if (_property.propertyFor == "Rent" &&
                    //     _property.propertyIs == "House & others") {
                    //   _property.propertyId = "SRH${json['propertyId']}";
                    // } else if (_property.propertyFor == "Sale" &&
                    //     _property.propertyIs == "House & others") {
                    //   _property.propertyId = "SSH${json['propertyId']}";
                    // } else if (_property.propertyFor == "Exchange" &&
                    //     _property.propertyIs == "House & others") {
                    //   _property.propertyId = "SEH${json['propertyId']}";
                    // } else if (_property.propertyFor == "Exchange" &&
                    //     _property.propertyIs == "Land") {
                    //   _property.propertyId = "SEL${json['propertyId']}";
                    // } else {
                    //   _property.propertyId = "SE${json['propertyId']}";
                    // }

                    // _property.ownershipType = json['ownershipType'];
                    // _property.ownerOrAgentName = json['ownerOrAgentName'];
                    // _property.agentAddress = json['ownerOrAgentAddress'];
                    // _property.propertyElectricity =
                    //     json['propertyElectricity'].toString();
                    // _property.propertyWatersupply =
                    //     json['propertyWatersupply'].toString();
                    // _property.propertyType = json['propertyType'];
                    // _property.propertyArea = json['propertyArea'].toString();
                    // _property.nearestLandmark = json['nearestLandmark'];
                    // _property.propertyPurpose = json['propertyPurpose'];
                    // _property.priceUnit1 = json['priceUnit'];
                    // _property.areaUnit = json['areaUnit'];
                    // _property.propertyFace = json['propertyFace'];
                    // _property.roadType = json['roadType'];
                    // _property.roadSize = json['slider'];
                    // _property.price = int.parse(json['price']);
                    // _property.wardNumber = int.parse(json['wardNumber']);
                    // _property.priceUnit = json['perUnit'];
                    // _property.storey = json['Storey'];
                    // _property.bikeParking = json['bikeParking'].toString();
                    // _property.carParking = json['carParking'].toString();
                    // _property.furnished = json['furnished'].toString();
                    // _property.wifi = json['wifi'].toString();
                    // _property.ownerName = json['ownerName'];
                    // _property.phoneNumber = json['phoneNumber'];
                    // _property.name = json['name'];
                    // _property.entryDate = json['submitDate'].toString();
                    // _property.buildDate = json['buildYear'].toString();
                    // _property.carCount = int.parse(
                    //     json['carCount'] == null ? "0" : json['carCount']);
                    // _property.bikeCount = int.parse(
                    //     json['bikeCount'] == null ? "0" : json['bikeCount']);
                    // _property.attachedBedroom = int.parse(
                    //     json['attachedBedroom'] == null
                    //         ? "0"
                    //         : json['attachedBedroom']);
                    // _property.commonBedroom = int.parse(
                    //     json['commonBedroom'] == null
                    //         ? "0"
                    //         : json['commonBedroom']);
                    // _property.bedRoom = int.parse(
                    //     json['bedroom'] == null ? "0" : json['bedroom']);
                    // _property.bathRoom = int.parse(
                    //     json['bathroom'] == null ? "0" : json['bathroom']);
                    // _property.attachedBathroom = int.parse(
                    //     json['attachedBathroom'] == null
                    //         ? "0"
                    //         : json['attachedBathroom']);
                    // _property.livingRoom = int.parse(
                    //     json['livingRoom'] == null ? "0" : json['bathroom']);
                    // _property.kitchen = int.parse(
                    //     json['kitchen'] == null ? "0" : json['kitchen']);

                    // _property.propertyFeature = json['propertyFeature'];
                    // _property.addressLine1 = json['addressLine1'];
                    // _property.addressLine2 = json['addressLine2'];

                    // _property.city = json['city'];
                    // _property.type = json['type'];
                    // _property.landDetail = json['landDetail'];

                    // _property.imgPath1 = json['images'] == null
                    //     ? null
                    //     : await tempToFileConverter("${json['images'][0].path}")
                    //         .then((value) => value
                    //             .replaceAll('File:', '')
                    //             .replaceAll("'", '')
                    //             .replaceAll(' ', ''));
                    // _property.imgPath2 = json['images'] == null
                    //     ? null
                    //     : await tempToFileConverter("${json['images'][1].path}")
                    //         .then((value) => value
                    //             .replaceAll('File:', '')
                    //             .replaceAll("'", '')
                    //             .replaceAll(' ', ''));
                    // _property.imgPath3 = json['images'] == null
                    //     ? null
                    //     : await tempToFileConverter("${json['images'][2].path}")
                    //         .then((value) => value
                    //             .replaceAll('File:', '')
                    //             .replaceAll("'", '')
                    //             .replaceAll(' ', ''));
                    // _property.imgPath4 = json['images'] == null
                    //     ? null
                    //     : await tempToFileConverter("${json['images'][3].path}")
                    //         .then((value) => value
                    //             .replaceAll('File:', '')
                    //             .replaceAll("'", '')
                    //             .replaceAll(' ', ''));

                    if (widget.myproperty?.id! == null) {
                      // await _dbHelpers.insertProperty(_property);
                      print(" Property added");
                    } else {
                      setState(() {
                        myproperty1.wardNumber = int.parse(json['wardNumber']);

                        myproperty1.ownershipType = json['ownershipType'];
                        myproperty1.ownerOrAgentName = json['ownerOrAgentName'];
                        myproperty1.wifi = json['wifi'].toString();
                        myproperty1.propertyIs = json['propertyIs'];
                        myproperty1.propertyId = json['propertyId'];
                        myproperty1.propertyFor = json['choice_chip'];
                        myproperty1.propertyElectricity =
                            json['propertyElectricity'].toString();
                        myproperty1.propertyWatersupply =
                            json['propertyWatersupply'].toString();
                        myproperty1.propertyType = json['propertyType'];
                        myproperty1.propertyArea =
                            json['propertyArea'].toString();
                        myproperty1.nearestLandmark = json['nearestLandmark'];
                        myproperty1.propertyPurpose = json['propertyPurpose'];
                        myproperty1.areaUnit = json['areaUnit'];
                        myproperty1.propertyFace = json['propertyFace'];
                        myproperty1.roadType = json['roadType'];
                        myproperty1.roadSize = json['slider'];
                        myproperty1.price = int.parse(json['price']);
                        myproperty1.priceUnit = json['perUnit'];
                        myproperty1.priceUnit1 = json['priceUnit'];

                        myproperty1.storey = json['Storey'];
                        myproperty1.bikeParking =
                            json['bikeParking'].toString();
                        myproperty1.carParking = json['carParking'].toString();
                        myproperty1.furnished = json['furnished'].toString();
                        myproperty1.ownerName = json['ownerName'];
                        myproperty1.phoneNumber = json['phoneNumber'];
                        myproperty1.name = json['name'];
                        myproperty1.entryDate = json['submitDate'].toString();
                        myproperty1.buildDate = json['buildYear'].toString();
                        myproperty1.carCount = int.parse(
                            json['carCount'] == null ? "0" : json['carCount']);
                        myproperty1.bikeCount = int.parse(
                            json['bikeCount'] == null
                                ? "0"
                                : json['bikeCount']);
                        myproperty1.attachedBedroom = int.parse(
                            json['attachedBedroom'] == null
                                ? "0"
                                : json['attachedBedroom']);
                        myproperty1.commonBedroom = int.parse(
                            json['commonBedroom'] == null
                                ? "0"
                                : json['commonBedroom']);
                        myproperty1.bedRoom = int.parse(
                            json['bedroom'] == null ? "0" : json['bedroom']);
                        myproperty1.bathRoom = int.parse(
                            json['bathroom'] == null ? "0" : json['bathroom']);
                        myproperty1.attachedBathroom = int.parse(
                            json['attachedBathroom'] == null
                                ? "0"
                                : json['attachedBathroom']);
                        myproperty1.livingRoom = int.parse(
                            json['livingRoom'] == null
                                ? "0"
                                : json['bathroom']);
                        myproperty1.kitchen = int.parse(
                            json['kitchen'] == null ? "0" : json['kitchen']);

                        myproperty1.propertyFeature = json['propertyFeature'];
                        myproperty1.addressLine1 = json['addressLine1'];
                        myproperty1.addressLine2 = json['addressLine2'];
                        myproperty1.agentAddress = json['ownerOrAgentAddress'];

                        if (myproperty1.propertyFor == "Rent") {
                          myproperty1.propertyId = "${json['propertyId']}";
                        } else if (myproperty1.propertyFor == "Sale") {
                          myproperty1.propertyId = "${json['propertyId']}";
                        } else {
                          myproperty1.propertyId = "${json['propertyId']}";
                        }
                        myproperty1.city = json['city'];
                        myproperty1.type = json['type'];
                        myproperty1.landDetail = json['landDetail'];
                      });
                      print(" updatesd iamge 1 is ${myproperty1.imgPath1}");
                      print(" updatesd iamge 2 is ${myproperty1.imgPath2}");
                      print(" updatesd iamge 3 is ${myproperty1.imgPath3}");
                      print(" updatesd iamge 4 is ${myproperty1.imgPath4}");

                      // await _dbHelpers.updateProperty(myproperty1);

                      print("Property Updated");
                      // print(_property.propertyId);
                      // print("json is");
                      // print(json.toString());
                    }

                    if (widget.isfromEdit == true) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Property Updated Successfully"),
                      ));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Property Added Successfully"),
                      ));
                    }

                    // List<PropertyModel> mylist =
                    //     await _dbHelpers.fetchProperties();
                    // print("${mylist[0].toString()}");

                    Navigator.pop(context);
                  }
                  //   Navigator.push(context,
                  //       MaterialPageRoute(builder: (_) => HomeScreens()));
                },
                child: const Text("Save")),
          ],
        )),
      ),
    );
  }
}
