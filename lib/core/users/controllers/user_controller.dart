import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seeks_app_prototype/core/main/pages/main.page.dart';
import 'package:seeks_app_prototype/core/media/components/media_image.component.dart';
import 'package:seeks_app_prototype/core/users/pages/user_info.page.dart';
import 'package:seeks_app_prototype/core/users/pages/user_info_editor.page.dart';
import 'package:seeks_app_prototype/core/users/services/user.service.dart';
import 'package:seeks_app_prototype/domain/user.dart';
import 'package:seeks_app_prototype/infrastructures/util/getx_routes.dart';

class UserController extends GetxController {
  UserService userService = UserService();

  String userId = "";

  onInitUserInfo() async {
    userInfo = await userService.getUserInfoById(userId);
    refreshUserImageProviders();
  }

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
    id: "01",
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
      var result = getImageProviderByType(
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

    UserInfoEntity _tempUserInfo = userInfo;
    List<UserInfoListEntity> _temp = [
      UserInfoListEntity(
        name: "詳細個人資料",
        contents: [
          UserInfoListContentEntity(title: "性別", name: "男"),
        ],
      ),
    ];

    List<UserInfoImageEntity> _tempImages = [
      UserInfoImageEntity(id: "02", image: "assets/images/splash_2.jpg"),
      UserInfoImageEntity(id: "01"),
    ];
    _tempUserInfo.username = "editor";
    _tempUserInfo.infoList = _temp;
    _tempUserInfo.images = _tempImages;
    userInfo = _tempUserInfo;
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

  @override
  void onInit() async {
    await onInitUserInfo();
    super.onInit();
  }
}
