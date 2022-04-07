import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seeks_app_prototype/core/signup/components/signup_user_info_body.dart';
import 'package:seeks_app_prototype/core/signup/controllers/signup.controller.dart';

class SignUpUserInfoPage extends StatelessWidget {
  static String routeName = "/signup_user_info";
  const SignUpUserInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SignUpController signUpController = Get.put(SignUpController());
    return body(signUpController);
  }

  body(SignUpController signUpController) {
    return SignUpUserInfoBodyComponent();
  }
}
