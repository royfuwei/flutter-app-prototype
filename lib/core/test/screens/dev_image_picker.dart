import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_pickers/image_pickers.dart';
import 'package:seeks_app_prototype/configs/size_config.dart';
import 'package:seeks_app_prototype/constants.dart';

class DevImagePicker extends StatefulWidget {
  static String routeName = "dev/image/picker";
  const DevImagePicker({Key? key}) : super(key: key);

  @override
  _DevImagePickerState createState() => _DevImagePickerState();
}

class _DevImagePickerState extends State<DevImagePicker> {
  List<XFile> imageFiles = [];
  int currentPage = 0;

  Future pickImagesFrom(ImageSource source) async {
    if (source == ImageSource.camera) {
      final imagePicker = await ImagePicker().pickImage(source: source);
      if (imagePicker != null) {
        setState(() {
          imageFiles.add(imagePicker);
        });
      }
    }
    if (source == ImageSource.gallery) {
      final List<XFile>? images = await ImagePicker().pickMultiImage();
      if (images != null) {
        setState(() {
          imageFiles = images;
        });
      }
    }
  }

  Future selectImages() async {
    List<Media> listImagePaths = await ImagePickers.pickerPaths(
      galleryMode: GalleryMode.image,
      selectCount: 2,
      showGif: false,
      showCamera: true,
      compressSize: 500,
      uiConfig: UIConfig(uiThemeColor: Color(0xffff0f50)),
      cropConfig: CropConfig(enableCrop: false, width: 2, height: 1),
    );
  }

  Widget createButton(bool isCamera) {
    final color = isCamera ? Colors.blueAccent : Colors.greenAccent;
    // final icon = isCamera ? IcoFontIcons.uiCamera : IcoFontIcons.uiImage;
    final icon = isCamera ? Icons.camera_alt : Icons.image;
    final source = isCamera ? ImageSource.camera : ImageSource.gallery;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          // selectImages();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
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
            )
          ],
        ),
      ),
    );
  }

  splashContent(String image) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage(image),
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
            itemBuilder: (context, index) =>
                splashContent("${imageFiles[index].path}"),
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

  appBar() {
    return AppBar(
      elevation: 0.2,
      // backgroundColor: colorBarWhite,
      backgroundColor: Colors.white,
      title: Text(
        "新增照片",
        style: TextStyle(
          color: colorFont02,
          fontSize: getProportionateScreenWidth(context, 20),
        ),
      ),
    );
  }
}
