import 'package:get/get.dart';
import 'package:seeks_app_prototype/core/dating/pages/dating_add_info.page.dart';
import 'package:seeks_app_prototype/core/dating/pages/dating_add_preview.page.dart';
import 'package:seeks_app_prototype/core/main/pages/main.page.dart';
import 'package:seeks_app_prototype/infrastructures/util/getx_routes.dart';

class DatingAddController extends GetxController {
  Rx<bool> _datingAddImagesToNext = Rx<bool>(true);
  set datingAddImagesToNext(bool value) => _datingAddImagesToNext.value = value;
  bool get datingAddImagesToNext => _datingAddImagesToNext.value;

  Rx<bool> _datingAddInfoToNext = Rx<bool>(true);
  set datingAddInfoToNext(bool value) => _datingAddInfoToNext.value = value;
  bool get datingAddInfoToNext => _datingAddInfoToNext.value;

  Rx<bool> _datingAddPreviewToPublic = Rx<bool>(true);
  set datingAddPreviewToPublic(bool value) =>
      _datingAddPreviewToPublic.value = value;
  bool get datingAddPreviewToPublic => _datingAddPreviewToPublic.value;

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
