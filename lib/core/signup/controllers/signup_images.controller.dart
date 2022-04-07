import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seeks_app_prototype/core/media/models/media_asset_image.dart';
import 'package:seeks_app_prototype/core/media/pages/media_image_selector.page.dart';

class SignUpImagesController extends GetxController {
  Rx<List<CropImageInfoModel>> _selectImageList = Rx<List<CropImageInfoModel>>(
    [
      /* CropImageInfoModel(
        id: "btn",
        data: Uint8List.fromList([]),
        shape: BoxShape.rectangle,
      ), */
    ],
  );
  set selectImageList(value) => this._selectImageList.value = value;
  List<CropImageInfoModel> get selectImageList => this._selectImageList.value;

  Rx<int> _selectImageListLength = Rx<int>(0);
  set selectImageListLength(value) => this._selectImageListLength.value = value;
  int get selectImageListLength => this._selectImageListLength.value;

  void addAllByList(List<CropImageInfoModel> items) {
    selectImageList.addAll(items);
    selectImageListLength = selectImageList.length;
    /* var temp = selectImageList;
    temp.addAll(items);
    selectImageList = temp; */
  }

  void addItem(CropImageInfoModel item) {
    selectImageList.add(item);
    selectImageListLength = selectImageList.length;
  }

  void removeItemById(String id) {
    selectImageList.removeWhere((element) => element.id == id);
    selectImageListLength = selectImageList.length;
  }

  void removeItemByIndex(int idx) {
    selectImageList.removeAt(idx);
    selectImageListLength = selectImageList.length;
    /* var temp = selectImageList;
    temp.removeAt(idx);
    selectImageList = temp; */
  }

  void clear() {
    selectImageList.clear();
    selectImageListLength = selectImageList.length;
  }
}
