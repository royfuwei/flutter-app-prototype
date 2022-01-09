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
  List<File> imageFiles = [];
  int currentPage = 0;

  Future pickImagesFrom(ImageSource source) async {
    if (source == ImageSource.camera) {
      final imagePicker = await ImagePicker().pickImage(source: source);
      if (imagePicker != null) {
        String croppedFilePath = await croppedImage(imagePicker.path);
        setState(() {
          File imageFile = File(croppedFilePath);
          imageFiles.add(imageFile);
        });
      }
    }
    if (source == ImageSource.gallery) {
      final List<XFile>? images = await ImagePicker().pickMultiImage();
      List<File> croppedImagesFile = [];
      if (images != null) {
        for (var item in images) {
          String croppedFilePath = await croppedImage(item.path);
          croppedImagesFile.add(File(croppedFilePath));
        }
        setState(() {
          imageFiles.addAll(croppedImagesFile);
        });
      }
    }
  }

  Future<String> croppedImage(String pickerFilePath) async {
    File? croppedFile = await ImageCropper.cropImage(
      sourcePath: pickerFilePath,
      // aspectRatio: CropAspectRatio(ratioX: 4, ratioY: 4),
      cropStyle: CropStyle.circle,
      aspectRatioPresets: Platform.isAndroid
          ? [
              CropAspectRatioPreset.original,
              // CropAspectRatioPreset.square,
              //CropAspectRatioPreset.ratio16x9
            ]
          : [
              CropAspectRatioPreset.original,
              // CropAspectRatioPreset.square,
              //CropAspectRatioPreset.ratio16x9
            ],
      androidUiSettings: AndroidUiSettings(
        toolbarTitle: '照片裁切',
        toolbarColor: Colors.blueAccent,
        toolbarWidgetColor: Colors.white,
        initAspectRatio: CropAspectRatioPreset.square,
        lockAspectRatio: false,
      ),
      iosUiSettings: IOSUiSettings(
        title: '照片裁切',
        doneButtonTitle: "完成",
        cancelButtonTitle: "取消",
      ),
    );
    print('croppedFile!.stat(): ${croppedFile!.stat()}');
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

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }

  imageFileSplash() {
    return Expanded(
        child: Container(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Expanded(
              child: PageView.builder(
            onPageChanged: (value) {
              setState(() {
                currentPage = value;
              });
            },
            itemCount: imageFiles.length,
            itemBuilder: (context, index) => splashContent(imageFiles[index]),
          )),
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                imageFiles.length,
                (index) => buildDot(index: index),
              ),
            ),
          )
        ],
      ),
    ));
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
              child: imageFiles.length == 0
                  ? Center(
                      child: Icon(
                        Icons.camera_alt_outlined,
                        size: 40,
                      ),
                    )
                  : imageFileSplash(),
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
