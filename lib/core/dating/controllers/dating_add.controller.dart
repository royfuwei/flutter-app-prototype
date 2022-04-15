import 'package:get/get.dart';
import 'package:seeks_app_prototype/core/dating/pages/dating_add_info.page.dart';
import 'package:seeks_app_prototype/core/dating/pages/dating_add_preview.page.dart';
import 'package:seeks_app_prototype/core/main/pages/main.page.dart';
import 'package:seeks_app_prototype/core/media/models/media_asset_image.dart';
import 'package:seeks_app_prototype/infrastructures/util/getx_routes.dart';

class DatingAddController extends GetxController {
  Rx<bool> _datingAddImagesToNext = Rx<bool>(true);
  set datingAddImagesToNext(bool value) => _datingAddImagesToNext.value = value;
  bool get datingAddImagesToNext => _datingAddImagesToNext.value;

  Rx<bool> _datingAddInfoToNext = Rx<bool>(false);
  set datingAddInfoToNext(bool value) => _datingAddInfoToNext.value = value;
  bool get datingAddInfoToNext => _datingAddInfoToNext.value;

  Rx<bool> _datingAddPreviewToPublic = Rx<bool>(true);
  set datingAddPreviewToPublic(bool value) =>
      _datingAddPreviewToPublic.value = value;
  bool get datingAddPreviewToPublic => _datingAddPreviewToPublic.value;

  Rx<List<CropAssetEntity>> _selectImageInfoList =
      Rx<List<CropAssetEntity>>([]);
  set selectImageInfoList(List<CropAssetEntity> value) =>
      _selectImageInfoList.value = value;
  List<CropAssetEntity> get selectImageInfoList => _selectImageInfoList.value;

  Rx<bool> _resizeToAvoidBottomInset = Rx<bool>(true);
  set resizeToAvoidBottomInset(bool value) =>
      _resizeToAvoidBottomInset.value = value;
  bool get resizeToAvoidBottomInset => _resizeToAvoidBottomInset.value;

  Rx<String> _textTopic = Rx<String>("");
  set textTopic(String value) => _textTopic.value = value;
  String get textTopic => _textTopic.value;

  Rx<String> _textContent = Rx<String>("");
  set textContent(String value) => _textContent.value = value;
  String get textContent => _textContent.value;

  textTopicOnChanged(String text) {
    textTopic = text;
    checkDatingAddInfoToNext();
  }

  textContentOnChanged(String text) {
    textContent = text;
    checkDatingAddInfoToNext();
  }

  checkDatingAddInfoToNext() {
    if (textTopic.length > 4 && textContent.length > 10) {
      datingAddInfoToNext = true;
    } else {
      datingAddInfoToNext = false;
    }
  }

  getSelectImageInfoList(List<CropAssetEntity> items) async {
    selectImageInfoList = items;
  }

  Future<void> datingAddImagesToNextOnPressed() async {
    toRoutesNamed([
      MainPage.routeName,
      DatingAddInfoPage.routeName,
    ]);
  }

  Future<void> datingAddInfoToNextOnPressed() async {
    toRoutesNamed([
      MainPage.routeName,
      DatingAddPreviewPage.routeName,
    ]);
  }

  Future<void> datingAddPreviewToPublicOnPressed() async {
    toRoutesNamed([
      MainPage.routeName,
    ]);
  }
}
