import 'package:get/get.dart';
import 'package:seeks_app_prototype/core/login/pages/login_tel_captcha.page.dart';
import 'package:seeks_app_prototype/core/entry/pages/entry.page.dart';
import 'package:seeks_app_prototype/core/login/pages/login_tel.page.dart';
import 'package:seeks_app_prototype/core/login/repositories/login.repo.dart';
import 'package:seeks_app_prototype/core/signup/controllers/signup.controller.dart';
import 'package:seeks_app_prototype/core/signup/pages/signup_account.page.dart';
import 'package:seeks_app_prototype/core/users/pages/user_create.page.dart';
import 'package:seeks_app_prototype/infrastructures/util/getx_routes.dart';

class LoginController extends GetxController {
  final loginRepo = new LoginRepository();

  final _loginTelGoNext = false.obs;
  set loginTelGoNext(value) => this._loginTelGoNext.value = value;
  get loginTelGoNext => this._loginTelGoNext.value;

  final _telephone = ''.obs;
  set telephone(value) => this._telephone.value = value;
  get telephone => this._telephone.value;

  final _areaCode = '+886'.obs;
  set areaCode(value) => this._areaCode.value = value;
  get areaCode => this._areaCode.value;

  final _loginTelCaptchaGoNext = false.obs;
  set loginTelCaptchaGoNext(value) => this._loginTelCaptchaGoNext.value = value;
  get loginTelCaptchaGoNext => this._loginTelCaptchaGoNext.value;

  final _captcha = ''.obs;
  set captcha(value) => this._captcha.value = value;
  get captcha => this._captcha.value;

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

  loginTelCaptchaFieldCaptchaOnChanged(String text) async {
    if (text.isNotEmpty) {
      captcha = text;
      if (captcha.length == 6) {
        loginTelCaptchaGoNext = true;
      } else {
        loginTelCaptchaGoNext = false;
      }
    } else {
      captcha = '';
    }
  }

  loginTelFieldTelOnChanged(String text) async {
    if (text.isNotEmpty) {
      telephone = text;
      if (telephone[0] == '0' && telephone.length == 10) {
        loginTelGoNext = true;
      } else if (telephone[0] != '0' && telephone.length == 9) {
        loginTelGoNext = true;
      } else {
        loginTelGoNext = false;
      }
    } else {
      telephone = '';
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

  @override
  void onInit() {
    super.onInit();
  }
}
