import 'package:cloud_firestore/cloud_firestore.dart';

class FavoritePropertyModel {
  final String userId;
  final DocumentReference propertyRef;

  FavoritePropertyModel({required this.userId, required this.propertyRef});
}