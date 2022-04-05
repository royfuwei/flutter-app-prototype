import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seeks_app_prototype/constants.dart';
import 'package:seeks_app_prototype/core/entry/pages/entry.page.dart';
import 'package:seeks_app_prototype/core/login/components/login_body.dart';
import 'package:seeks_app_prototype/core/login/controllers/login_controller.dart';
import 'package:seeks_app_prototype/core/login/pages/login_tel.page.dart';
import 'package:seeks_app_prototype/core/users/models/user_status_model.dart';
import 'package:seeks_app_prototype/infrastructures/util/getx_routes.dart';

class LoginPage extends StatelessWidget {
  static String routeName = '/login';
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.put(LoginController());
    return Scaffold(
      backgroundColor: bgMainColor,
      body: body(loginController),
    );
  }

  body(
    LoginController loginController,
  ) {
    return LoginBodyComponent(
      onPressedLoginRegister: () {
        loginController.onPressedLoginRegister();
      },
    );
  }
}
