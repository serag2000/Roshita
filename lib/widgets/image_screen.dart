import 'dart:io' show File;

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageScreen extends StatefulWidget {
  const ImageScreen({super.key});

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  File? imageFile;

  showOption(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('make a choice'),
        content: SingleChildScrollView(
          child: Column(children: [
            ListTile(
              leading: const Icon(Icons.image),
              title: const Text('Gallery'),
              onTap: () => imageFormGallery(context),
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt_outlined),
              title: const Text('Camera'),
              onTap: () => imageFormCamera(context),
            ),
          ]),
        ),
      ),
    );
  }

  Future imageFormGallery(BuildContext context) async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return; //كان مادرتش هذي حيطلع خط اصفر
    setState(() {
      imageFile = File(image.path);
    });
    Navigator.pop(context);
  }

  Future imageFormCamera(BuildContext context) async {
    var image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) return;
    setState(() {
      // imageFile = image as File;
      imageFile=File(image.path);
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      color: Colors.grey[100],
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            if (imageFile != null)
              Stack(
                children: [
                  Image.file(File(imageFile!.path)),
                  Positioned(
                      right: 2,
                      top: 2,
                      child: IconButton(
                        icon: const Icon(
                          Icons.delete_outline,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          setState(() {
                            imageFile = null;
                          });
                        },
                      ))
                ],
              ),
            InkWell(
              onTap: () => showOption(context),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.image_search, color: Colors.blue),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Upload Picture',
                      style: TextStyle(color: Colors.blue),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
