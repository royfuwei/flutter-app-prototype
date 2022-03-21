import 'package:flutter/cupertino.dart';
import 'package:seeks_app_prototype/core/media/pages/media_image_selector.page.dart';

enum MediaImageSelectorState { init, selector }

class MediaImageSelectorProvider extends ChangeNotifier {
  List<CropImageInfoEntity> _selectImageInfoList = [];
  List<CropImageInfoEntity> get selectImageInfoList => _selectImageInfoList;

  setSelectImageInfoList(List<CropImageInfoEntity> data) {
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

  addItem(CropImageInfoEntity item) {
    _selectImageInfoList.add(item);
    notifyListeners();
  }

  addItemByList(List<CropImageInfoEntity> items) {
    _selectImageInfoList.addAll(items);
    notifyListeners();
  }

  clear() {
    _selectImageInfoList = [];
    notifyListeners();
  }
}
