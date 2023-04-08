import 'dart:io';
import 'package:dufuna/core/service/db%20_services.dart';
import 'package:dufuna/core/util/colors.dart';
import 'package:dufuna/presentation/image_picker_view.dart';
import 'package:dufuna/presentation/screen/home/form_widgets/radio_buttons.dart';
import 'package:dufuna/presentation/screen/home/form_widgets/text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';
import '../../../core/model/property_model.dart';
import 'package:path/path.dart' as paths;

import '../../../data/datas/data.dart';
import '../../../view_model/image_view_model.dart';
import '../home/form_widgets/drop_down.dart';
import '../home/form_widgets/slider.dart';
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
    if (!isLand!) {
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
                  initialValue: widget.myproperty?.attachedBathroom.toString(),
                  label: "Attached Bedroom",
                  keyboardType: TextInputType.number,
                ),
              ),
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
    ImageViewModel imageViewModel =
        Provider.of<ImageViewModel>(context, listen: false);
    ToastContext().init(context);

    PropertyModel myproperty1 = PropertyModel();

    print(widget.isLand);

    if (widget.isfromEdit == true) {
      setState(() {
        myproperty1 = widget.myproperty!;
      });
    }
    return SafeArea(
      child: Scaffold(
        // backgroundColor: ColorUtils.themeBlack,
        appBar: AppBar(
          backgroundColor: ColorUtils.buttonRed,
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
                padding: const EdgeInsets.fromLTRB(10, 16, 8, 16),
                child: Padding(
                  padding: const EdgeInsets.only(top: 24),
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
                    selectedColor: ColorUtils.buttonRed,
                    labelStyle: TextStyle(color: Colors.white),
                    spacing: 44.0,
                    name: 'propertyIs',
                    decoration: const InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 5.0, vertical: 5),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: ColorUtils.themeBlack),
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
                  selectedColor: ColorUtils.buttonRed,
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
                  // SizedBox(
                  //   width: MediaQuery.of(context).size.width * 0.50,
                  //   child: FormDropDown(
                  //     initialValue: widget.myproperty?.priceUnit,
                  //     dropdownItems: priceUnit,
                  //     label: "Per Unit",
                  //   ),
                  // ),
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
                initialRadioValue:
                    widget.myproperty?.propertyElectricity == null
                        ? null
                        : _tobool(widget.myproperty!.propertyElectricity!),
                radioLabel: "Property Electricity",
              ),
              FormRadioButton(
                initialRadioValue:
                    widget.myproperty?.propertyWatersupply == null
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

              ImagePickerView(isEdit: widget.isfromEdit),
              // showAttachments(widget.isfromEdit!)!,

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: ColorUtils.pureWhite,
                      side: BorderSide(
                        width: 1,
                        color: ColorUtils.buttonRed,
                      ),
                    ),
                    onPressed: () {
                      _formkey.currentState?.reset();
                    },
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(140, 16, 140, 16),
                      child: Text(
                        "Reset",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: ColorUtils.buttonRed,
                        ),
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 4, 0, 32),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: ColorUtils.buttonRed,
                      side: BorderSide(
                        width: 1,
                        color: ColorUtils.buttonRed,
                      ),
                    ),
                    onPressed: () async {
                      if (widget.isfromEdit == false) {
                        if (imageViewModel.images.length != 4) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("Please select 4 images"),
                          ));
                          return;
                        } else {
                          imageViewModel.uploadImages(context).then((value) {
                            print("$value");
                          }).onError((error, stackTrace) {
                            print("error is $error");
                          });
                        }
                      }

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
                          propertyType: json['propertyType'],
                          propertyPurpose: json['propertyPurpose'],
                          propertyFeature: json['propertyFeature'],
                          address: json['addressLine1'],
                          city: json['city'],
                          wardNumber: int.parse(json['wardNumber']),
                          nearestLandmark: json['nearestLandmark'],
                          listingType: json['type'],
                          landDetail: json['landDetail'],

                          propertyId: json['propertyId'],
                          propertyIs: json['propertyIs'],
                          propertyFor: json['choice_chip'],
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
                          waterSupply:
                              json['propertyWaterSupply'] ?? true.toString(),
                          ownershipType: json['ownershipType'],
                          ownerOrAgentName: json['ownerOrAgentName'],
                          agentAddress: json['ownerOrAgentAddress'],
                          phoneNumber: json['phoneNumber'].toString(),
                          name: json['name'],
                          entryDate: json['submitDate'].toString(),
                          carParking: json['carParking'].toString(),
                          carCount: int.parse(json['carCount'] ?? "0"),
                          bikeParking: json['bikeParking'].toString(),
                          bikeCount: int.parse(json['bikeCount'] ?? "0"),

                          propertyTitle: json['propertyFeature'],
                          livingRoom: int.tryParse(json['livingRoom']) ?? 0,
                          kitchen: int.tryParse(json['kitchen']) ?? 0,
                          bathRoom: int.tryParse(json['bathroom']) ?? 0,
                          commonBedroom:
                              int.tryParse(json['commonBedroom']) ?? 0,
                          attachedBedroom:
                              int.tryParse(json['attachedBedroom']) ?? 0,
                          imgPath1: imageViewModel.imageUrls[0],
                          imgPath2: imageViewModel.imageUrls[1],
                          imgPath3: imageViewModel.imageUrls[2],
                          imgPath4: imageViewModel.imageUrls[3],
                          isFavourite: false,
                          isUrgent: false,
                          isVerified: false,
                          status: "unverified",
                          isPremium: false,
                          addedBy: FirebaseAuth.instance.currentUser!.uid,

                          // attachments: json['attachments'],
                        );

                        // p

                        DatabaseServices().addProperty(property);

                        print(widget.myproperty?.id);

                        if (widget.myproperty?.id! == null) {
                          print('id is not null');
                          // await _dbHelpers.insertProperty(_property);
                          print(" Property added");
                        } else {
                          setState(() {
                            myproperty1.wardNumber =
                                int.parse(json['wardNumber']);

                            myproperty1.ownershipType = json['ownershipType'];
                            myproperty1.ownerOrAgentName =
                                json['ownerOrAgentName'];
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
                            myproperty1.nearestLandmark =
                                json['nearestLandmark'];
                            myproperty1.propertyPurpose =
                                json['propertyPurpose'];
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
                            myproperty1.carParking =
                                json['carParking'].toString();
                            myproperty1.furnished =
                                json['furnished'].toString();
                            myproperty1.ownerName = json['ownerName'];
                            myproperty1.phoneNumber = json['phoneNumber'];
                            myproperty1.name = json['name'];
                            myproperty1.entryDate =
                                json['submitDate'].toString();
                            myproperty1.buildDate =
                                json['buildYear'].toString();
                            myproperty1.carCount =
                                int.parse(json['carCount'] ?? "0");
                            myproperty1.bikeCount =
                                int.parse(json['bikeCount'] ?? "0");
                            myproperty1.attachedBedroom =
                                int.parse(json['attachedBedroom'] ?? "0");
                            myproperty1.commonBedroom =
                                int.parse(json['commonBedroom'] ?? "0");
                            myproperty1.bedRoom =
                                int.parse(json['bedroom'] ?? "0");
                            myproperty1.bathRoom =
                                int.parse(json['bathroom'] ?? "0");
                            myproperty1.attachedBathroom =
                                int.parse(json['attachedBathroom'] ?? "0");
                            myproperty1.livingRoom = int.parse(
                                json['livingRoom'] == null
                                    ? "0"
                                    : json['bathroom']);
                            myproperty1.kitchen =
                                int.parse(json['kitchen'] ?? "0");

                            myproperty1.propertyFeature =
                                json['propertyFeature'];
                            myproperty1.addressLine1 = json['addressLine1'];
                            myproperty1.addressLine2 = json['addressLine2'];
                            myproperty1.agentAddress =
                                json['ownerOrAgentAddress'];

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

                          // await _dbHelpers.updateProperty(myproperty1);
                          await DatabaseServices().updateProperty(myproperty1);

                          print("Property Updated");
                          // print(_property.propertyId);
                          // print("json is");
                          // print(json.toString());
                        }

                        if (widget.isfromEdit == true) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text("Property Updated Successfully"),
                          ));
                        } else {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
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
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(140, 16, 140, 16),
                      child: imageViewModel.isUploading == true
                          ? CircularProgressIndicator()
                          : Text(
                              "Save",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: ColorUtils.pureWhite,
                              ),
                            ),
                    )),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
