import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:seeks_app_prototype/core/media/screens/media_image_selector.dart';

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
