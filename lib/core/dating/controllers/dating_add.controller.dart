import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seeks_app_prototype/core/dating/controllers/dating_info.controller.dart';
import 'package:seeks_app_prototype/core/dating/pages/dating_add_info.page.dart';
import 'package:seeks_app_prototype/core/dating/services/dating.service.dart';
import 'package:seeks_app_prototype/core/main/pages/main.page.dart';
import 'package:seeks_app_prototype/core/media/models/media_asset_image.dart';
import 'package:seeks_app_prototype/core/media/services/media.service.dart';
import 'package:seeks_app_prototype/core/users/services/user.service.dart';
import 'package:seeks_app_prototype/domain/dating.dart';
import 'package:seeks_app_prototype/domain/media.dart';
import 'package:seeks_app_prototype/infrastructures/util/getx_routes.dart';

class DatingAddController extends GetxController {
  MediaService mediaService = MediaService();
  DatingService datingService = DatingService();
  UserService userService = UserService();

  String userId = "000";
  DatingInfoEntity? datingInfo;

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

  Rx<List<DatingInfoImageEntity>> _datingInfoImageList =
      Rx<List<DatingInfoImageEntity>>([]);
  set datingInfoImageList(value) => this._datingInfoImageList.value = value;
  List<DatingInfoImageEntity> get datingInfoImageList =>
      this._datingInfoImageList.value;

  Rx<bool> _resizeToAvoidBottomInset = Rx<bool>(false);
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
    List<CropImageInfoModel> selectImageList =
        await mediaService.cropCropAssets(
      selectImageInfoList,
      BoxShape.rectangle,
    );
    getImageProviderListBySelectImageList(selectImageList);
    toRoutesNamed([
      MainPage.routeName,
      DatingAddInfoPage.routeName,
    ]);
  }

  getImageProviderListBySelectImageList(
    List<CropImageInfoModel> selectImageList,
  ) {
    List<DatingInfoImageEntity> results = [];
    for (var selectImage in selectImageList) {
      DatingInfoImageEntity result = DatingInfoImageEntity(
        id: "",
        image: selectImage.data,
        imageType: ImageType.MEMORY,
      );
      results.add(result);
    }
    datingInfoImageList = results;
  }

  Future<void> datingAddInfoToNextOnPressed() async {
    var userInfo = await userService.getUserInfoById(userId);
    datingInfo = DatingInfoEntity(
      id: '',
      title: textTopic,
      description: textContent,
      userId: userId,
      images: datingInfoImageList,
      userImage: userInfo.images[0].image,
      userImageType: userInfo.images[0].imageType,
      datingInfoTime: DatingInfoTimeEntity(),
      labels: <String, DatingInfoLabelEntity>{
        "datingDuration": DatingInfoLabelEntity(
          iconType: "access_time",
          name: "預計2hr",
          value: 60 * 60 * 2,
          key: "datingDuration",
        ),
        "signupCount": DatingInfoLabelEntity(
          iconType: "group_add",
          name: "0人報名",
          value: 100,
          key: "signupCount",
        ),
        "payment": DatingInfoLabelEntity(
          iconType: "money_outlined",
          name: "-1000元",
          value: -1000,
          key: "payment",
        ),
      },
    );
    DatingInfoController datingInfoController = Get.put(DatingInfoController());
    await datingInfoController.goPreviewPageByDatingInfo(datingInfo!);
  }

  Future<void> datingAddPreviewToPublicOnPressed() async {
    if (datingInfo != null) {
      print("datingAddPreviewToPublicOnPressed userId: ${userId}");
      print("datingInfo.userId: ${datingInfo!.userId}");
      print(
          "datingAddPreviewToPublicOnPressed datingInfo.userId: ${datingInfo!.userId}");
      datingService.createDatingInfo(datingInfo!);
      offAllRoutesNamed([
        MainPage.routeName,
      ]);
    }
  }

  initPageDatingAddImages({
    required TextEditingController textTopicController,
    required TextEditingController textContentController,
  }) async {
    textTopic = textTopicController.text;
    textContent = textContentController.text;
    checkDatingAddInfoToNext();
  }

  @override
  void onInit() async {
    userId = await userService.getLoginUserId();
    super.onInit();
  }
}
