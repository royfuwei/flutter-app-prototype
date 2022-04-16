import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seeks_app_prototype/core/dating/pages/dating_add_preview.page.dart';
import 'package:seeks_app_prototype/core/dating/pages/dating_info.page.dart';
import 'package:seeks_app_prototype/core/dating/services/dating.service.dart';
import 'package:seeks_app_prototype/core/main/pages/main.page.dart';
import 'package:seeks_app_prototype/core/media/services/media.service.dart';
import 'package:seeks_app_prototype/core/users/controllers/user_controller.dart';
import 'package:seeks_app_prototype/core/users/services/user.service.dart';
import 'package:seeks_app_prototype/domain/dating.dart';
import 'package:seeks_app_prototype/infrastructures/util/getx_routes.dart';

class DatingInfoController extends GetxController {
  DatingService datingService = DatingService();
  UserService userService = UserService();
  MediaService mediaService = MediaService();

  String userId = "001";

  Rx<String> _username = Rx<String>("username");
  set username(String value) => _username.value = value;
  String get username => _username.value;

  Rx<String> _userStatus = Rx<String>("正在線上");
  set userStatus(String value) => _userStatus.value = value;
  String get userStatus => _userStatus.value;

  Rx<bool> _userIsOnline = Rx<bool>(true);
  set userIsOnline(bool value) => _userIsOnline.value = value;
  bool get userIsOnline => _userIsOnline.value;

  Rx<String> _datingId = Rx<String>("001");
  set datingId(String value) => _datingId.value = value;
  String get datingId => _datingId.value;

  Rx<List<ImageProvider<Object>>> _datingInfoImageProviders =
      Rx<List<ImageProvider<Object>>>([]);
  set datingInfoImageProviders(List<ImageProvider<Object>> value) =>
      _datingInfoImageProviders.value = value;
  List<ImageProvider<Object>> get datingInfoImageProviders =>
      _datingInfoImageProviders.value;

  Rx<DatingInfoEntity> _datingInfo = Rx<DatingInfoEntity>(
    DatingInfoEntity(
      id: "01",
      userId: "01",
      datingInfoTime: DatingInfoTimeEntity(),
    ),
  );

  Rx<List<Widget>> _datingLabelWidgets = Rx<List<Widget>>([]);
  set datingLabelWidgets(List<Widget> value) =>
      _datingLabelWidgets.value = value;
  List<Widget> get datingLabelWidgets => _datingLabelWidgets.value;
  set datingInfo(value) => _datingInfo.value = value;
  DatingInfoEntity get datingInfo => _datingInfo.value;

  getDatingInfoLabels() async {
    List<Widget> widgets = [];
    widgets = datingService.getDatingInfoWidgetsByLabels(
      labels: datingInfo.labels,
    );
    datingLabelWidgets = widgets;
  }

  refreshUserImageProviders() async {
    datingInfoImageProviders = [];
    await Future.delayed(Duration(microseconds: 10));
    List<ImageProvider<Object>> temp = [];
    for (var image in datingInfo.images) {
      var result = mediaService.getImageProviderByType(
        image.imageType,
        image.image,
      );
      temp.add(result);
    }
    datingInfoImageProviders = temp;
  }

  onInitUserInfo() async {
    print("onInitUserInfo datingId: ${datingId}");
    refreshDatingInfoById(datingId);
  }

  refreshDatingInfoById(String id) async {
    datingId = id;
    datingInfo = await datingService.getDatingInfoById(datingId);
    await getDatingInfoLabels();
    await refreshUserImageProviders();
  }

  goPageByDatingId(String id) async {
    // datingId = id;
    print("goPageByDatingId id: ${id}, before userId: ${userId}");
    datingInfo = await datingService.getDatingInfoById(datingId);
    await refreshDatingInfoById(id);
    print("goPageByDatingId datingInfo.userId: ${datingInfo.userId}");
    var userInfo = await userService.getUserInfoById(datingInfo.userId);
    print("goPageByDatingId userInfo.username: ${userInfo.username}");
    username = userInfo.username;
    userId = userInfo.id;
    toRoutesNamed([MainPage.routeName, DatingInfoPage.routeName]);
  }

  goPreviewPageByDatingInfo(DatingInfoEntity preview) async {
    await Future.delayed(Duration(milliseconds: 100));
    datingInfo = preview;
    await getDatingInfoLabels();
    await refreshUserImageProviders();
    toRoutesNamed([MainPage.routeName, DatingAddPreviewPage.routeName]);
  }

  appBarUserTitleOnPressed() {
    UserController userController = Get.put(UserController());
    print("appBarUserTitleOnPressed userId: ${userId}");
    userController.goPageByDatingId(userId);
  }

  @override
  void onInit() async {
    await onInitUserInfo();
    super.onInit();
  }
}
