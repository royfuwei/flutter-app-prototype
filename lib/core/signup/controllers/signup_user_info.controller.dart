import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seeks_app_prototype/core/main/pages/main.page.dart';
import 'package:seeks_app_prototype/infrastructures/util/getx_routes.dart';

class SignUpUserInfoController extends GetxController {
  Rx<String> _nickName = Rx<String>('');
  set nickName(value) => this._nickName.value = value;
  String get nickName => this._nickName.value;

  Rx<String> _nickNameError = Rx<String>('');
  set nickNameError(value) => this._nickNameError.value = value;
  String get nickNameError => this._nickNameError.value;

  Rx<String> _birth = Rx<String>('');
  set birth(value) => this._birth.value = value;
  String get birth => this._birth.value;

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

  listerGoNext() {
    if (nickName.isNotEmpty &&
        birth.isNotEmpty &&
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
    toRoutesNamed([MainPage.routeName]);
  }
}
