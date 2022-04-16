import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seeks_app_prototype/core/main/pages/main.page.dart';
import 'package:seeks_app_prototype/core/media/services/media.service.dart';
import 'package:seeks_app_prototype/core/users/pages/user_info.page.dart';
import 'package:seeks_app_prototype/core/users/pages/user_info_editor.page.dart';
import 'package:seeks_app_prototype/core/users/pages/user_info_viewer.page.dart';
import 'package:seeks_app_prototype/core/users/services/user.service.dart';
import 'package:seeks_app_prototype/domain/user.dart';
import 'package:seeks_app_prototype/infrastructures/util/getx_routes.dart';

class UserController extends GetxController {
  UserService userService = UserService();
  MediaService mediaService = MediaService();

  String userId = "001";

  onInitUserInfo() async {
    await refreshUserInfoById(userId);
  }

  refreshUserInfoById(String id) async {
    userInfo = await userService.getUserInfoById(id);
    refreshUserImageProviders();
  }

  Rx<String> _userStatus = Rx<String>("正在線上");
  set userStatus(String value) => _userStatus.value = value;
  String get userStatus => _userStatus.value;

  Rx<bool> _userIsOnline = Rx<bool>(true);
  set userIsOnline(bool value) => _userIsOnline.value = value;
  bool get userIsOnline => _userIsOnline.value;

  Rx<bool> _isUserInfoOwner = Rx<bool>(true);
  set isUserInfoOwner(value) => _isUserInfoOwner.value = value;
  bool get isUserInfoOwner => _isUserInfoOwner.value;

  Rx<bool> _editorCanSave = Rx<bool>(false);
  set editorCanSave(value) => _editorCanSave.value = value;
  bool get editorCanSave => _editorCanSave.value;

  Rx<UserInfoEntity> _userInfo = Rx<UserInfoEntity>(UserInfoEntity(
    id: "01",
    habbyLabels: UserInfoLabelsEntity(
      name: "興趣",
    ),
  ));
  set userInfo(value) => _userInfo.value = value;
  UserInfoEntity get userInfo => _userInfo.value;

  Rx<UserInfoEntity> _userInfoEditorClone = Rx<UserInfoEntity>(UserInfoEntity(
    id: "001",
    habbyLabels: UserInfoLabelsEntity(
      name: "興趣",
    ),
  ));
  set userInfoEditorClone(value) => _userInfoEditorClone.value = value;
  UserInfoEntity get userInfoEditorClone => _userInfoEditorClone.value;

  Rx<List<ImageProvider<Object>>> _userInfoImageProviders =
      Rx<List<ImageProvider<Object>>>([]);
  set userInfoImageProviders(List<ImageProvider<Object>> value) =>
      _userInfoImageProviders.value = value;
  List<ImageProvider<Object>> get userInfoImageProviders =>
      _userInfoImageProviders.value;

  refreshUserImageProviders() async {
    userInfoImageProviders = [];
    await Future.delayed(Duration(microseconds: 10));
    List<ImageProvider<Object>> temp = [];
    for (var image in userInfo.images) {
      var result = mediaService.getImageProviderByType(
        image.imageType,
        image.image,
      );
      temp.add(result);
    }
    userInfoImageProviders = temp;
  }

  Future<void> editorUserInfo() async {
    userInfoEditorClone = userInfo;
    getEditorCanSave();
    await refreshUserImageProviders();
    getEditorCanSave();
  }

  floatingActionButtonOnPressed() async {
    print("onPressed userController.editorUserInfo()");
    await editorUserInfo();
    toRoutesNamed([
      MainPage.routeName,
      UserInfoPage.routeName,
      UserInfoEditorPage.routeName,
    ]);
  }

  getEditorCanSave() {
    bool temp = userInfoEditorClone == userInfo;
    print("getEditorCanSave: ${temp}");
    print("userInfoEditorClone.username: ${userInfoEditorClone.username}");
    print("userInfo.username: ${userInfo.username}");
  }

  userInfoEditorImagesOnPressed() {
    Get.back();
  }

  userInfoEditorCancelOnPressed() {
    Get.back();
  }

  userInfoEditorSaveOnPressed() {}

  goPageByDatingId(String id) async {
    // datingId = id;
    print("goPageByDatingId id: ${id}");
    refreshUserInfoById(id);
    isUserInfoOwner = false;
    toRoutesNamed([MainPage.routeName, UserInfoViewerPage.routeName]);
  }

  @override
  void onInit() async {
    await onInitUserInfo();
    super.onInit();
  }

  @override
  void onReady() {
    print("UserController onReady!!!~~~~~~");
    super.onReady();
  }

  @override
  void onClose() {
    print("UserController onClose!!!~~~~~~");
    super.onClose();
  }
}
