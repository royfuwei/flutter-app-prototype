import 'package:flutter/cupertino.dart';
import 'package:seeks_app_prototype/core/media/models/media_asset_image.dart';

enum MediaImageSelectorState { init, selector }

class MediaImageSelectorProvider extends ChangeNotifier {
  List<CropImageInfoModel> _selectImageInfoList = [];
  List<CropImageInfoModel> get selectImageInfoList => _selectImageInfoList;

  setSelectImageInfoList(List<CropImageInfoModel> data) {
    _selectImageInfoList = data;
    notifyListeners();
  }

  removeItemById(String id) {
    _selectImageInfoList.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  removeItemByIndex(int idx) {
    _selectImageInfoList.removeAt(idx);
    notifyListeners();
  }

  addItem(CropImageInfoModel item) {
    _selectImageInfoList.add(item);
    notifyListeners();
  }

  addItemByList(List<CropImageInfoModel> items) {
    _selectImageInfoList.addAll(items);
    notifyListeners();
  }

  clear() {
    _selectImageInfoList = [];
    notifyListeners();
  }
}
