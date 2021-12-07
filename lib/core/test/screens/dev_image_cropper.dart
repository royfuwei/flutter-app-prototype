import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:seeks_flutter/configs/size_config.dart';
import 'package:seeks_flutter/constants.dart';

class DevImageCropper extends StatefulWidget {
  static String routeName = "dev/image/cropper";
  const DevImageCropper({Key? key}) : super(key: key);

  @override
  _DevImageCropperState createState() => _DevImageCropperState();
}

class _DevImageCropperState extends State<DevImageCropper> {
  @override
  File? imageFile;

  Future pickImagesFrom(ImageSource source) async {
    if (source == ImageSource.camera) {
      final imagePicker = await ImagePicker().pickImage(source: source);
      if (imagePicker != null) {
        setState(() {
          imageFile = File(imagePicker.path);
        });
      }
    }
    if (source == ImageSource.gallery) {
      // final List<XFile>? images = await ImagePicker().pickMultiImage();
      XFile? image = await ImagePicker().pickImage(source: source);
      if (image != null) {
        String croppedFilePath = await croppedImage(image.path);
        setState(() {
          imageFile = File(image.path);
        });
      }
    }
  }

  Future<String> croppedImage(String pickerFilePath) async {
    File? croppedFile = await ImageCropper.cropImage(
      sourcePath: pickerFilePath,
      aspectRatioPresets: Platform.isAndroid
          ? [
              CropAspectRatioPreset.square,
              CropAspectRatioPreset.original,
              //CropAspectRatioPreset.ratio16x9
            ]
          : [
              CropAspectRatioPreset.original,
              CropAspectRatioPreset.square,
              //CropAspectRatioPreset.ratio16x9
            ],
      androidUiSettings: AndroidUiSettings(
          toolbarTitle: 'Cropper',
          toolbarColor: Colors.blueAccent,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.square,
          lockAspectRatio: false),
      iosUiSettings: IOSUiSettings(title: 'Cropper'),
    );
    if (croppedFile != null) {
      return croppedFile.path;
    }
    return pickerFilePath;
  }

  Widget createButton(bool isCamera) {
    final color = isCamera ? Colors.blueAccent : Colors.greenAccent;
    // final icon = isCamera ? IcoFontIcons.uiCamera : IcoFontIcons.uiImage;
    final icon = isCamera ? Icons.camera_alt : Icons.image;
    final source = isCamera ? ImageSource.camera : ImageSource.gallery;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          pickImagesFrom(source);
        },
        child: Card(
          margin: EdgeInsets.only(top: 8),
          color: color,
          child: Center(
            child: Icon(
              icon,
              size: 40,
            ),
          ),
        ),
      ),
    );
  }

  splashContent(File image) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: FileImage(image),
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(8),
        child: ListView(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width,
              color: colorIconHidden,
              child: imageFile == null
                  ? Center(
                      child: Icon(
                        Icons.camera_alt_outlined,
                        size: 40,
                      ),
                    )
                  : splashContent(imageFile!),
            ),
            Divider(),
            SizedBox(
              height: getProportionateScreenHeight(context, 100),
              child: Row(
                children: [
                  createButton(true),
                  SizedBox(
                    width: 10,
                  ),
                  createButton(false),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
