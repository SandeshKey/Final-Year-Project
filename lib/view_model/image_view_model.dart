import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../core/model/image_model.dart';

import 'package:path_provider/path_provider.dart';

class ImageViewModel with ChangeNotifier {
  final supabase = Supabase.instance.client;

  List<ImageModel> _images = [];
  List<ImageModel> get images => _images;
  List<String> _imageUrls = [];
  String? _profileImage =
      "https://www.shareicon.net/data/128x128/2016/07/26/802016_man_512x512.png";
  String get profileImage => _profileImage!;
  bool _isUploading = false;

  bool get isUploading => _isUploading;
  List<String> get imageUrls => _imageUrls;

  bool _isUpdatingImage = false;
  bool get isUpdatingImage => _isUpdatingImage;

  Future<String> upload1Image(ImageModel image) async {
    final bytes = await image.file.readAsBytes();
    final fileExt = image.path.split('.').last;
    final fileName = image.path.split('/').last;
    final filePath = fileName;
    await supabase.storage.from('image').uploadBinary(
          filePath,
          bytes,
          fileOptions: FileOptions(),
        );
    return "";
  }

  Future<List<String>> uploadImages(BuildContext context) async {
    try {
      _isUploading = true;

      notifyListeners();
      List<String> downloadUrls = [];
      final storage = FirebaseStorage.instance;
      // final sstorage = SupabaseClient();
      for (var image in _images) {
        print("for loop is runnign");
        try {
          final bytes = await image.file.readAsBytes();
          final fileExt = image.path.split('.').last;
          final fileName = '${DateTime.now().toIso8601String()}.$fileExt';

          final filePath = image.path;

          await supabase.storage.from('image').uploadBinary(
                filePath,
                bytes,
                fileOptions: FileOptions(),
              );
          final imageUrlResponse = await supabase.storage
              .from('image')
              .createSignedUrl(filePath, 60 * 60 * 24 * 365 * 10);

          print(imageUrlResponse);
          // final fileName = '${DateTime.now().toIso8601String()}.$fileExt';
          // final String path = await supabase.storage
          //     .from('avatars')
          //     .upload(
          //       image.path,
          //       image.file,
          //       fileOptions:
          //           const FileOptions(cacheControl: '3600', upsert: false),
          //     )
          //     .then((value) {
          //   print(value);
          //   return value;
          // });
          downloadUrls.add(imageUrlResponse);
          print(downloadUrls);
        } catch (e) {
          print(e);
        }

        //    final String path = await _supabase.storage.from('avatars').upload(
        //   image.path,
        //   image.file,
        //   fileOptions: const FileOptions(cacheControl: '3600', upsert: false),
        // );

        // final ref = storage.ref().child('images/${image.path.split('/').last}');
        // print('images/${image.path.split('/').last}');
        // final uploadTask = ref.putFile(image.file);
        // final snapshot = await uploadTask.whenComplete(() => null);
        // final url = await snapshot.ref.getDownloadURL();
        // _imageUrls.add(url);
        // downloadUrls.add(url);
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
          content: Text('zEroor uploading uploading images'),
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

  Future<void> pickProfileImage() async {
    _isUpdatingImage = true;
    final ppicker = ImagePicker();
    final ppickedFile = await ppicker.pickImage(source: ImageSource.gallery);

    final File file = File(ppickedFile!.path);
    final appDir = await getApplicationDocumentsDirectory();
    final fileName = file.path.split('/').last;
    final newPath = '${appDir.path}/$fileName';
    await file.copy(newPath);

    await upload1Image(ImageModel(path: newPath, file: file));

    _profileImage =
        "https://rqugcsiajclmckhemfzk.supabase.co/storage/v1/object/public/image/${newPath.split('/').last}";

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
      _isUploading = true;
      notifyListeners();

      await upload1Image(ImageModel(path: newPath, file: file));
      _imageUrls.add(
          "https://rqugcsiajclmckhemfzk.supabase.co/storage/v1/object/public/image/${newPath.split('/').last}");
      _isUploading = false;
      notifyListeners();
    }

    print(_imageUrls.toString());

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
