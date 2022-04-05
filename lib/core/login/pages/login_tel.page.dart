import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seeks_app_prototype/core/login/components/login_tel_body.dart';
import 'package:seeks_app_prototype/core/login/controllers/login_controller.dart';

class LoginTelPage extends StatelessWidget {
  static String routeName = '/login_tel';
  const LoginTelPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.put(LoginController());
    return body(loginController);
  }

  body(LoginController loginController) {
    return Obx(
      () => LoginTelBodyComponent(
        fieldTelOnChanged: loginController.loginTelFieldTelOnChanged,
        goNextOnPressed: loginController.loginTelGoNextOnPressed,
        goNext: loginController.loginTelGoNext,
        areaCode: loginController.areaCode,
      ),
    );
  }
}
