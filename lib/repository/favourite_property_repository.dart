import 'package:cloud_firestore/cloud_firestore.dart';

import '../core/model/property_model.dart';

class FavoritePropertiesRepository {
  final CollectionReference _favoritePropertiesCollection =
      FirebaseFirestore.instance.collection('favoriteProperties');

  Future<void> addFavoriteProperty(
      String userId, PropertyModel propertyRef) async {
    await _favoritePropertiesCollection.add({
      'userId': userId,
      'propertyRef': propertyRef.toMap(),
    });
  }

 Future<List<PropertyModel>> getFavoriteProperties(String userId)async {
    return await _favoritePropertiesCollection
        .where('userId', isEqualTo: userId).get()  .then((value) =>
              value.docs.map((e) => PropertyModel.fromMap(e.data() as Map)).toList()); ;
    
  }
}
