import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seeks_app_prototype/core/main/pages/main.page.dart';
import 'package:seeks_app_prototype/core/signup/controllers/signup.controller.dart';
import 'package:seeks_app_prototype/core/signup/controllers/signup_account.controller.dart';
import 'package:seeks_app_prototype/core/signup/controllers/signup_images.controller.dart';
import 'package:seeks_app_prototype/core/users/services/user.service.dart';
import 'package:seeks_app_prototype/domain/media.dart';
import 'package:seeks_app_prototype/domain/picker.dart';
import 'package:seeks_app_prototype/domain/user.dart';
import 'package:seeks_app_prototype/infrastructures/util/getx_routes.dart';

class SignUpUserInfoController extends GetxController {
  UserService userService = UserService();
  Rx<String> _nickName = Rx<String>('');
  set nickName(value) => this._nickName.value = value;
  String get nickName => this._nickName.value;

  Rx<String> _nickNameError = Rx<String>('');
  set nickNameError(value) => this._nickNameError.value = value;
  String get nickNameError => this._nickNameError.value;

  Rx<DateTime?> _birth = Rx<DateTime?>(null);
  set birth(value) => this._birth.value = value;
  DateTime? get birth => this._birth.value;

  Rx<String> _sex = Rx<String>('');
  set sex(value) => this._sex.value = value;
  String get sex => this._sex.value;

  Rx<String> _gender = Rx<String>('');
  set gender(value) => this._gender.value = value;
  String get gender => this._gender.value;

  Rx<String> _place = Rx<String>('');
  set place(value) => this._place.value = value;
  String get place => this._place.value;

  Rx<bool> _goNext = Rx<bool>(false);
  set goNext(value) => this._goNext.value = value;
  bool get goNext => this._goNext.value;

  nickNameOnChange(
      String text, TextEditingController controller, BuildContext context) {
    if (text.length > 10) {
      // FocusScope.of(context).unfocus();
      controller.text = text.substring(0, 9);
      controller.selection = TextSelection.fromPosition(
        TextPosition(
          offset: controller.text.length,
        ),
      );
      // nickNameError = "暱稱不可以超過10個字元";
      listerGoNext();
      return;
    }
    nickNameError = "";
    nickName = text;
    listerGoNext();
  }

  setTextEditingControllerValue(
    TextEditingController controller,
    String text,
  ) {
    controller.text = text;
    listerGoNext();
  }

  List<PickerValueEntity> getPlaceSelectItems() {
    return [
      PickerValueEntity(text: "請選擇"),
      PickerValueEntity(text: "台北市", value: "台北市"),
      PickerValueEntity(text: "新北市", value: "新北市"),
      PickerValueEntity(text: "桃園市", value: "桃園市"),
    ];
  }

  List<PickerValueEntity> getGenderSelectItems() {
    return [
      PickerValueEntity(text: "請選擇"),
      PickerValueEntity(text: "喜歡女生", value: "woman"),
      PickerValueEntity(text: "喜歡男生", value: "man"),
      PickerValueEntity(text: "都喜歡", value: "both"),
    ];
  }

  List<PickerValueEntity> getSexSelectItems() {
    return [
      PickerValueEntity(text: "男性", value: "man"),
      PickerValueEntity(text: "女性", value: "woman"),
    ];
  }

  listerGoNext() {
    if (nickName.isNotEmpty &&
        birth != null &&
        sex.isNotEmpty &&
        gender.isNotEmpty &&
        place.isNotEmpty) {
      print("goNext = true");
      goNext = true;
    } else {
      print("goNext = false");
      goNext = false;
    }
  }

  goNextOnPressed() {
    createUserInfo();
    // toRoutesNamed([MainPage.routeName]);
    offAllRoutesNamed([MainPage.routeName]);
  }

  createUserInfo() async {
    var images = getUserInfoImages();
    var infoList = getUserInfoList();
    UserInfoEntity userInfo = UserInfoEntity(
      id: "000",
      username: nickName,
      city: place,
      age: (DateTime.now().difference(birth!).inDays / 365).floor(),
      habbyLabels: UserInfoLabelsEntity(name: "興趣"),
      images: images,
      infoList: infoList,
    );
    await userService.signUpUser(userInfo);
  }

  List<UserInfoListEntity> getUserInfoList() {
    SignUpController signUpController = Get.put(
      SignUpController(),
    );
    SignUpAccountController signUpAccountController = Get.put(
      SignUpAccountController(),
    );
    List<UserInfoListEntity> results = [
      UserInfoListEntity(
        name: "詳細個人資料",
        contents: [
          UserInfoListContentEntity(title: "性別", name: sex),
          UserInfoListContentEntity(title: "居住地", name: place),
          UserInfoListContentEntity(title: "身高", name: ""),
          UserInfoListContentEntity(title: "喜歡的類型", name: gender),
          UserInfoListContentEntity(
            title: "手機號碼",
            name: signUpController.telephone,
          ),
          UserInfoListContentEntity(
            title: "Email",
            name: signUpAccountController.email,
          ),
        ],
      ),
      UserInfoListEntity(
        name: "工作及教育背景",
        contents: [
          UserInfoListContentEntity(title: "學歷", name: ""),
          UserInfoListContentEntity(title: "工作", name: ""),
        ],
      ),
    ];
    return results;
  }

  getUserInfoImages() {
    SignUpImagesController signUpImagesController = Get.put(
      SignUpImagesController(),
    );
    var selectImageList = signUpImagesController.selectImageList;
    List<UserInfoImageEntity> results = [];
    for (var item in selectImageList) {
      UserInfoImageEntity result = UserInfoImageEntity(
        id: "",
        image: item.data,
        imageType: ImageType.MEMORY,
      );
      results.add(result);
    }
    return results;
  }
}
