import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seeks_app_prototype/core/captcha/components/captcha_tel_body.dart';
import 'package:seeks_app_prototype/core/login/controllers/login_controller.dart';

class LoginTelCaptchaPage extends StatelessWidget {
  static String routeName = "/login_tel_captcha";
  const LoginTelCaptchaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.put(LoginController());
    return body(loginController);
  }

  body(LoginController loginController) {
    return CaptchaTelBodyComponent(
      telephone: loginController.telephone,
      goNextOnPressed: loginController.loginTelCaptchaGoNextOnPressed,
    );
  }
}
