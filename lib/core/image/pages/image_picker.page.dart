import 'dart:io';

import 'package:flutter/material.dart';
import 'package:seeks_app_prototype/configs/size_config.dart';
import 'package:seeks_app_prototype/constants.dart';
import 'package:seeks_app_prototype/core/common/components/default_button.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerPage extends StatefulWidget {
  static String routeName = "/image/picker";
  const ImagePickerPage({Key? key}) : super(key: key);

  @override
  _ImagePickerPageState createState() => _ImagePickerPageState();
}

class _ImagePickerPageState extends State<ImagePickerPage> {
  File? _imageFile;
  String wording = "";
  final ImagePicker _picker = ImagePicker();

  Future<Null> _pickerImageFrom(ImageSource source) async {
    XFile theImage;
    if (source == ImageSource.camera) {
      final theImagePicker = await ImagePicker().pickImage(source: source);
      theImage = theImagePicker!;
    } else {
      final List<XFile>? images = await _picker.pickMultiImage();
      theImage = images![0];
    }

    setState(() {
      if (theImage != null) {
        _imageFile = File(theImage.path);
        wording = '';
      } else {
        wording = 'No image selected.';
      }
    });
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      print("addPostFrameCallback");
    });
  }

  Widget _createButton(bool isCamera) {
    final color = isCamera ? Colors.blueAccent : Colors.greenAccent;
    // final icon = isCamera ? IcoFontIcons.uiCamera : IcoFontIcons.uiImage;
    final source = isCamera ? ImageSource.camera : ImageSource.gallery;

    return Expanded(
        child: GestureDetector(
      child: Card(
          margin: EdgeInsets.only(top: 8),
          color: color,
          child: Center(child: Icon(Icons.ac_unit, size: 40))),
      onTap: () {
        _pickerImageFrom(source);
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.amber,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width,
                child: _imageFile == null
                    ? Image.asset(
                        "assets/images/splash_1.jpg",
                        fit: BoxFit.cover,
                      )
                    : Image.file(
                        _imageFile!,
                        fit: BoxFit.cover,
                      ),
              ),
              VerticalSpacing(
                of: 20,
              ),
              DefaultButton(
                text: "拍照",
                press: () {
                  _pickerImageFrom(ImageSource.camera);
                },
              ),
              VerticalSpacing(
                of: 20,
              ),
              DefaultButton(
                text: "選擇照片",
                press: () {
                  _pickerImageFrom(ImageSource.gallery);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Future<Null> _pickerImageFrom(String imgSrc) async {
  //   final theImage = await ImageP
  // }
  appBar() {
    return AppBar(
      elevation: 0.2,
      // backgroundColor: colorBarWhite,
      backgroundColor: Colors.white,
      title: Text(
        "新約會",
        style: TextStyle(
          color: colorFont02,
          fontSize: getProportionateScreenWidth(context, 20),
        ),
      ),
    );
  }
}
