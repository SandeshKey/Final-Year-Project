import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class CloudStorage {
  FirebaseStorage _storage = FirebaseStorage.instance;

  Future<List<String>> uploadImages(List<File> images) async {
    List<String> imageUrls = [];

    for (var i = 0; i < images.length; i++) {
      String fileName = 'image_$i.jpg';
      Reference reference = _storage.ref().child(fileName);

      UploadTask uploadTask = reference.putFile(images[i]);
      TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);

      String imageUrl = await taskSnapshot.ref.getDownloadURL();
      imageUrls.add(imageUrl);
    }

    return imageUrls;
  }

  Future<List<String>> getImages() async {
    List<String> imageUrls = [];

    try {
      ListResult listResult = await _storage.ref().listAll();

      for (var item in listResult.items) {
        String imageUrl = await item.getDownloadURL();
        imageUrls.add(imageUrl);
      }
    } catch (error) {
      print(error.toString());
    }

    return imageUrls;
  }
}
