import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../core/model/image_model.dart';

import 'package:path_provider/path_provider.dart';

class ImageViewModel with ChangeNotifier {
  List<ImageModel> _images = [];
  List<ImageModel> get images => _images;
  List<String> _imageUrls = [];
  bool _isUploading = false;
  //getters
  bool get isUploading => _isUploading;
  List<String> get imageUrls => _imageUrls;

  Future<List<String>> uploadImages(BuildContext context) async {
    try {
      _isUploading = true;

      notifyListeners();
      List<String> downloadUrls = [];
      final storage = FirebaseStorage.instance;
      for (var image in _images) {
        final ref = storage.ref().child('images/${image.path.split('/').last}');
        final uploadTask = ref.putFile(image.file);
        final snapshot = await uploadTask.whenComplete(() => null);
        final url = await snapshot.ref.getDownloadURL();
        _imageUrls.add(url);
        downloadUrls.add(url);
        return downloadUrls;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Images uploaded successfully'),
        ),
      );

      print(_imageUrls.toString());
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('zEroor uploading successfully'),
        ),
      );
    } finally {
      _isUploading = false;
      notifyListeners();
      return [];
    }
  }

  void clear() {
    _images.clear();
    notifyListeners();
  }

  Future<void> pickImages() async {
    final picker = ImagePicker();
    final pickedFiles = await picker.pickMultiImage();

    for (final pickedFile in pickedFiles) {
      final File file = File(pickedFile.path);

      final appDir = await getApplicationDocumentsDirectory();
      final fileName = file.path.split('/').last;
      final newPath = '${appDir.path}/$fileName';

      await file.copy(newPath);

      _images.add(ImageModel(path: newPath, file: file));
    }

    notifyListeners();
  }

  Future<void> removeImage(
    int index,
  ) async {
    _images.removeAt(index);
    // delete a file
    await File(_images[index].path).delete();

    notifyListeners();
  }
}
