import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seeks_app_prototype/core/entry/pages/entry.page.dart';
import 'package:seeks_app_prototype/core/signup/pages/signup_location.page.dart';
import 'package:seeks_app_prototype/infrastructures/util/getx_routes.dart';

class SignUpAccountController extends GetxController {
  final _email = ''.obs;
  set email(String value) => this._email.value = value;
  String get email => this._email.value;

  final _referralCode = ''.obs;
  set referralCode(String value) => this._referralCode.value = value;
  String get referralCode => this._referralCode.value;

  @override
  void onInit() {
    // onInitSignUpLocationSetting();
    // onInitSignUpNotificationSetting();
    super.onInit();
  }

  // sign up account
  final _goNext = false.obs;
  set goNext(value) => this._goNext.value = value;
  get goNext => this._goNext.value;

  // api 檢查email 是否已被使用
  goNextOnPressed() async {
    // onInitSignUpLocationSetting();
    toRoutesNamed([
      EntryPage.routeName,
      SignUpLocationPage.routeName,
    ]);
  }

  // 檢查email 格式
  fieldEmailOnChanged(String text) async {
    if (text.isNotEmpty) {
      email = text;
      bool emailValid = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
      ).hasMatch(email);
      goNext = emailValid;
    } else {
      goNext = false;
    }
  }

  fieldReferralCodeOnChanged(String text) async {}

  initSignUpAccountPage({
    required TextEditingController emailEditingController,
    required TextEditingController referralCodeEditingController,
  }) {
    fieldEmailOnChanged(emailEditingController.text);
  }
}
