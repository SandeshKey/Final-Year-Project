import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../view_model/image_view_model.dart';

class ImagePickerView extends StatelessWidget {
  const ImagePickerView({Key? key, this.isEdit}) : super(key: key);
  final bool? isEdit;

  @override
  Widget build(BuildContext context) {
    final imageViewModel = Provider.of<ImageViewModel>(context, listen: false);

    return isEdit== true? SizedBox():Material(
      child: SizedBox(
        height: 200,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                imageViewModel.pickImages();
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.04,
                  decoration: BoxDecoration(
                    color: Colors.indigo,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                      child: Text(
                    'Upload Images',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )),
                ),
              ),
            ),
            SizedBox(height: 20),
            Consumer<ImageViewModel>(
              builder: (context, imageViewModel, child) {
                final images = imageViewModel.images;

                return images.isEmpty
                    ? Text('No images selected.')
                    : Row(
                        children: List.generate(
                            images.length,
                            (index) => Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                        height: 100,
                                        width: 100,
                                        child: Stack(
                                          children: [
                                            Image.file(
                                              File(images[index].path),
                                              fit: BoxFit.fitHeight,
                                            ),
                                            Positioned(
                                                top: 0,
                                                right: 1,
                                                child: InkWell(
                                                  onTap: () => imageViewModel
                                                      .removeImage(index),
                                                  child: Container(
                                                    child: const Icon(
                                                        FontAwesomeIcons
                                                            .multiply),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color: Colors.red,
                                                    ),
                                                  ),
                                                )),
                                          ],
                                        )),
                                  ),
                                )));
              },
            ),
          ],
        ),
      ),
    );
  }
}
