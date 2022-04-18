import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:seeks_app_prototype/core/login/pages/login_tel_captcha.page.dart';
import 'package:seeks_app_prototype/core/entry/pages/entry.page.dart';
import 'package:seeks_app_prototype/core/login/pages/login_tel.page.dart';
import 'package:seeks_app_prototype/core/login/repositories/login.repo.dart';
import 'package:seeks_app_prototype/core/signup/controllers/signup.controller.dart';
import 'package:seeks_app_prototype/core/signup/pages/signup_account.page.dart';
import 'package:seeks_app_prototype/infrastructures/util/getx_routes.dart';

class LoginController extends GetxController {
  final loginRepo = new LoginRepository();

  final _loginTelGoNext = false.obs;
  set loginTelGoNext(bool value) => this._loginTelGoNext.value = value;
  bool get loginTelGoNext => this._loginTelGoNext.value;

  final _telephone = ''.obs;
  set telephone(String value) => this._telephone.value = value;
  String get telephone => this._telephone.value;

  final _areaCode = '+886'.obs;
  set areaCode(String value) => this._areaCode.value = value;
  String get areaCode => this._areaCode.value;

  initIsLoginStatus() async {
    var thisLoginModel = await loginRepo.getLocalStorage();
    print("thisLoginModel.isLogin: ${thisLoginModel.isLogin}");
  }

  // api 會回傳資訊，決定要登入還是註冊
  loginTelCaptchaGoNextOnPressed() async {
    SignUpController signUpController = Get.put(SignUpController());
    signUpController.telephone = telephone;
    toRoutesNamed([
      EntryPage.routeName,
      SignUpAccountPage.routeName,
    ]);
  }

  loginTelFieldTelOnChanged(String text) async {
    if (text.isNotEmpty) {
      telephone = text;
    } else {
      telephone = '';
    }
    checkLoginTelGoNext();
  }

  checkLoginTelGoNext() {
    if (telephone.isEmpty) {
      loginTelGoNext = false;
    } else {
      if (telephone[0] == '0' && telephone.length == 10) {
        loginTelGoNext = true;
      } else if (telephone[0] != '0' && telephone.length == 9) {
        loginTelGoNext = true;
      } else {
        loginTelGoNext = false;
      }
    }
  }

  loginTelGoNextOnPressed() async {
    toRoutesNamed([
      EntryPage.routeName,
      LoginTelCaptchaPage.routeName,
    ]);
  }

  // 按下登入註冊 按鈕 到登入頁面
  onPressedLoginRegister() async {
    toRoutesNamed([
      EntryPage.routeName,
      LoginTelPage.routeName,
    ]);
  }

  initLoginTelPage({
    required TextEditingController textEditingController,
  }) async {
    loginTelFieldTelOnChanged(textEditingController.text);
  }

  @override
  void onInit() {
    super.onInit();
  }
}
