import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CaptchaController extends GetxController {
  Rx<bool> _goNext = Rx(false);
  set goNext(bool value) => _goNext.value = value;
  bool get goNext => _goNext.value;

  final _captcha = ''.obs;
  set captcha(String value) => this._captcha.value = value;
  String get captcha => this._captcha.value;

  Rx<String> _telephone = Rx("");
  set telephone(String value) => this._telephone.value = value;
  String get telephone => this._telephone.value;

  Future<void> reCaptchaOnPressed() async {
    print("reCaptchaOnPressed(): ");
  }

  captchaFieldOnChanged(String text) async {
    if (text.isNotEmpty) {
      captcha = text;
    } else {
      captcha = '';
    }
    checkLoginTelGoNext();
  }

  checkLoginTelGoNext() {
    print("captcha: ${captcha}");
    if (captcha.isEmpty) {
      goNext = false;
    } else {
      if (captcha.length == 6) {
        goNext = true;
      } else {
        goNext = false;
      }
    }
  }

  initCaptchaTelPage(
    String tel,
    TextEditingController textEditingController,
  ) {
    telephone = tel;
    captchaFieldOnChanged(textEditingController.text);
  }
}
