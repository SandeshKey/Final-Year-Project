class PropertyModel {
  static const tblProperty = 'property';
  static const colId = 'id';
  static const colLandDetail = 'landDetail';
  static const colPropertyId = 'propertyId';
  static const colCity = 'city';
  static const colPropertyFor = 'propertyFor';
  static const colPropertyType = 'propertyType';
  static const colPropertyPurpose = 'propertyPurpose';
  static const colPropertyFeature = 'propertyFeature';
  static const colAddressLine1 = 'addressLine1';
  static const colAddressLine2 = 'addressLine2';
  static const colNearestLandmark = 'nearestLandmark';
  static const colAreaUnit = 'areaUnit';
  static const colType = 'type';
  static const colprice = 'price';
  static const colPriceUnit = 'priceUnit';
  static const colRoadType = 'roadType';
  static const colRoadSize = 'roadSize';
  static const colPropertyLocation = 'propertyLocation';
  static const colPropertyPrice = 'propertyPrice';
  static const colPropertyArea = 'propertyArea';
  static const colBathroom = 'bathroom';
  static const colBedroom = 'bedroom';
  static const colLivingRoom = 'livingRoom';
  static const colKitchen = 'kitchen';
  static const colPropertyFace = 'propertyFace';
  static const colPropertyFloor = 'propertyFloor';
  static const colBikeParking = 'bikeParking';
  static const colCarParking = 'carParking';
  static const colFurnished = 'furnished';
  static const colStorey = 'storey';
  static const colBuildDate = 'buildDate';
  static const colOwnerName = 'ownerName';
  static const colPhoneNumber = 'phoneNumber';
  static const colName = 'name';
  static const colElectricity = 'electricity';
  static const colWaterSupply = 'waterSupply';
  static const colEntryDate = 'entryDate';
  static const colImage1 = 'imgPath1';
  static const colImage2 = 'imgPath2';
  static const colImage3 = 'imgPath3';
  static const colImage4 = 'imgPath4';
  static const colPropertyElectricity = 'propertyElectricity';
  static const colPropertyWatersupply = 'propertyWaterSupply';
  static const colPropertyIs = 'propertyIs';
  static const colAttachedBathroom = 'attachedBathroom';
  static const colCommonBedroom = 'commondBedroom';
  static const colAttachedBedroom = 'attachedBedroom';
  static const colBikeCount = 'bikeCount';
  static const colCarCount = 'carCount';
  static const colWifi = 'wifi';
  static const colOwnershipType = 'ownershipType';
  static const colOwnerOrAgentName = 'ownerOrAgentName';
  static const colWardNumber = 'wardNumber';
  static const colPriceUnit1 = 'priceUnit1';
  static const colAgentAddress = 'agentAddress';

  int? id;
  int? wardNumber;
  int? commonBedroom;
  int? attachedBedroom;
  int? bikeCount;
  int? carCount;
  String? wifi;
  String? ownershipType;
  String? ownerOrAgentName;
  String? landDetail;
  String? propertyIs;
  String? propertyFor;
  String? propertyType;
  String? propertyPurpose;
  String? propertyFeature;
  String? addressLine1;
  String? addressLine2;
  String? nearestLandmark;
  String? propertyArea;
  String? areaUnit;
  String? type;
  int? price;
  String? priceUnit1;
  String? priceUnit;
  String? roadType;
  double? roadSize;
  String? propertyFace;
  String? electricity;
  String? waterSupply;
  int? bedRoom;
  int? kitchen;
  int? livingRoom;
  int? bathRoom;
  int? attachedBathroom;
  String? bikeParking;
  String? carParking;
  String? furnished;
  double? storey;
  String? buildDate;
  String? ownerName;
  String? phoneNumber;
  String? name;
  String? entryDate;
  String? imgPath1;
  String? imgPath2;
  String? imgPath3;
  String? imgPath4;
  String? city;
  String? propertyId;
  String? propertyElectricity;
  String? propertyWatersupply;
  String? agentAddress;

  PropertyModel(
      
      {
        this.agentAddress,  
        this.priceUnit1,
      this.commonBedroom,
      this.attachedBedroom,
      this.carCount,
      this.bikeCount,
      this.ownerOrAgentName,
      this.ownershipType,
      this.landDetail,
      this.propertyIs,
      this.propertyElectricity,
      this.propertyWatersupply,
      this.city,
      this.propertyId,
      this.propertyFor,
      this.propertyType,
      this.propertyPurpose,
      this.propertyFeature,
      this.addressLine1,
      this.addressLine2,
      this.nearestLandmark,
      this.areaUnit,
      this.propertyArea,
      this.type,
      this.price,
      this.priceUnit,
      this.roadType,
      this.roadSize,
      this.propertyFace,
      this.electricity,
      this.waterSupply,
      this.bedRoom,
      this.kitchen,
      this.livingRoom,
      this.bathRoom,
      this.attachedBathroom,
      this.bikeParking,
      this.carParking,
      this.furnished,
      this.storey,
      this.buildDate,
      this.ownerName,
      this.phoneNumber,
      this.name,
      this.entryDate,
      this.imgPath1,
      this.imgPath2,
      this.imgPath3,
      this.imgPath4,
      this.wardNumber});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      colAgentAddress: agentAddress,
      colPriceUnit1: priceUnit1,
      colWardNumber: wardNumber,
      colCarCount: carCount,
      colBikeCount: bikeCount,
      colOwnerOrAgentName: ownerOrAgentName,
      colOwnershipType: ownershipType,
      colWifi: wifi,
      colCommonBedroom: commonBedroom,
      colAttachedBedroom: attachedBedroom,
      colLandDetail: landDetail,
      colPropertyIs: propertyIs,
      colPropertyWatersupply: propertyWatersupply,
      colPropertyElectricity: propertyElectricity,
      colPropertyId: propertyId,
      colCity: city,
      colId: id,
      colPropertyFor: propertyFor,
      colPropertyType: propertyType,
      colPropertyPurpose: propertyPurpose,
      colPropertyFeature: propertyFeature,
      colAddressLine1: addressLine1,
      colAddressLine2: addressLine2,
      colNearestLandmark: nearestLandmark,
      colAreaUnit: areaUnit,
      colPropertyArea: propertyArea,
      colType: type,
      colprice: price,
      colPriceUnit: priceUnit,
      colRoadType: roadType,
      colRoadSize: roadSize,
      colPropertyFace: propertyFace,
      colBathroom: bathRoom,
      colAttachedBathroom: attachedBathroom,
      colBedroom: bedRoom,
      colKitchen: kitchen,
      colLivingRoom: livingRoom,
      colBikeParking: bikeParking,
      colCarParking: carParking,
      colFurnished: furnished,
      colStorey: storey,
      colBuildDate: buildDate,
      colOwnerName: ownerName,
      colPhoneNumber: phoneNumber,
      colName: name,
      colElectricity: electricity,
      colWaterSupply: waterSupply,
      colEntryDate: entryDate,
      colImage1: imgPath1,
      colImage2: imgPath2,
      colImage3: imgPath3,
      colImage4: imgPath4,
    };

    if (id != null) {
      map[colId] = id;
    }
    return map;
  }

  PropertyModel.fromMap(Map<dynamic, dynamic> map) {
    agentAddress = map[colAgentAddress];
    
    priceUnit1 = map[colPriceUnit1];
    wardNumber = map[colWardNumber];
    carCount = map[colCarCount];
    bikeCount = map[colBikeCount];
    ownerOrAgentName = map[colOwnerOrAgentName];
    ownershipType = map[colOwnershipType];
    wifi = map[colWifi];
    commonBedroom = map[colCommonBedroom];
    attachedBedroom = map[colAttachedBedroom];

    landDetail = map[colLandDetail];
    propertyIs = map[colPropertyIs];
    attachedBathroom = map[colAttachedBathroom];
    propertyElectricity = map[colPropertyElectricity];
    propertyWatersupply = map[colPropertyWatersupply];
    id = map[colId];
    city = map[colCity];
    propertyId = map[colPropertyId];
    propertyFor = map[colPropertyFor];
    propertyType = map[colPropertyType];
    propertyPurpose = map[colPropertyPurpose];
    propertyFeature = map[colPropertyFeature];
    addressLine1 = map[colAddressLine1];
    addressLine2 = map[colAddressLine2];
    nearestLandmark = map[colNearestLandmark];
    areaUnit = map[colAreaUnit];
    propertyArea = map[colPropertyArea];
    type = map[colType];
    price = map[colprice];
    priceUnit = map[colPriceUnit];
    roadType = map[colRoadType];
    roadSize = map[colRoadSize];
    propertyFace = map[colPropertyFace];
    bathRoom = map[colBathroom];
    bedRoom = map[colBedroom];
    kitchen = map[colKitchen];
    livingRoom = map[colLivingRoom];
    bikeParking = map[colBikeParking];
    carParking = map[colCarParking];
    furnished = map[colFurnished];
    storey = map[colStorey];
    buildDate = map[colBuildDate];
    ownerName = map[colOwnerName];
    phoneNumber = map[colPhoneNumber];
    name = map[colName];
    electricity = map[colElectricity];
    waterSupply = map[colWaterSupply];
    entryDate = map[colEntryDate];
    imgPath1 = map[colImage1];
    imgPath2 = map[colImage2];
    imgPath3 = map[colImage3];
    imgPath4 = map[colImage4];

    // print(waterSupply);
  }
}
