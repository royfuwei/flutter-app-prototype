import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seeks_app_prototype/core/signup/components/signup_account_body.dart';
import 'package:seeks_app_prototype/core/signup/controllers/signup.controller.dart';

class SignUpAccountPage extends StatelessWidget {
  static String routeName = "/signup_account";
  const SignUpAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SignUpController signUpController = Get.put(SignUpController());
    print("[SignUpAccountPage] telephone: ${signUpController.telephone}");
    return body(signUpController);
  }

  body(SignUpController signUpController) {
    return Obx(
      () => SignUpAccountComponent(
        goNext: signUpController.signUpAccountGoNext,
        goNextOnPressed: signUpController.signUpAccountGoNextOnPressed,
        fieldEmailOnChanged: signUpController.signUpAccountFieldEmailOnChanged,
        fieldReferralCodeOnChanged:
            signUpController.signUpAccountFieldReferralCodeOnChanged,
      ),
    );
  }
}
