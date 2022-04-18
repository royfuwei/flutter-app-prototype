import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seeks_app_prototype/core/media/models/media_asset_image.dart';
import 'package:seeks_app_prototype/core/media/pages/media_image_selector.page.dart';

class SignUpImagesController extends GetxController {
  Rx<List<CropImageInfoModel>> _selectImageList =
      Rx<List<CropImageInfoModel>>([]);
  set selectImageList(List<CropImageInfoModel> value) =>
      this._selectImageList.value = value;
  List<CropImageInfoModel> get selectImageList => this._selectImageList.value;

  Rx<int> _selectImageListLength = Rx<int>(0);
  set selectImageListLength(value) => this._selectImageListLength.value = value;
  int get selectImageListLength => this._selectImageListLength.value;

  void addAllByList(List<CropImageInfoModel> items) {
    List<CropImageInfoModel> temp = selectImageList;
    temp.addAll(items);
    selectImageList = temp;
    selectImageListLength = selectImageList.length;
  }

  void addItem(CropImageInfoModel item) {
    List<CropImageInfoModel> temp = selectImageList;
    temp.add(item);
    selectImageList = temp;
    selectImageListLength = selectImageList.length;
  }

  void removeItemById(String id) {
    List<CropImageInfoModel> temp = selectImageList;
    temp.removeWhere((element) => element.id == id);
    selectImageList = temp;
  }

  void removeItemByIndex(int idx) {
    List<CropImageInfoModel> temp = selectImageList;
    temp.removeAt(idx);
    print("removeItemByIndex temp.length: ${temp.length}");
    selectImageList = temp;
    selectImageListLength = selectImageList.length;
  }

  void clear() {
    selectImageList = [];
    selectImageListLength = selectImageList.length;
  }
}
