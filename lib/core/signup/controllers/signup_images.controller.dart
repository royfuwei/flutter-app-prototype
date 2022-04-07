import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seeks_app_prototype/core/media/pages/media_image_selector.page.dart';

class SignUpImagesController extends GetxController {
  Rx<List<CropImageInfoEntity>> _selectImagesList =
      Rx<List<CropImageInfoEntity>>(
    [
      CropImageInfoEntity(
        id: "btn",
        data: Uint8List.fromList([]),
        shape: BoxShape.rectangle,
      ),
    ],
  );
  set selectImagesList(value) => this._selectImagesList.value = value;
  List<CropImageInfoEntity> get selectImagesList =>
      this._selectImagesList.value;
}
