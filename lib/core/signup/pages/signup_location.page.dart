import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seeks_app_prototype/core/signup/components/signup_location_body.dart';
import 'package:seeks_app_prototype/core/signup/controllers/signup.controller.dart';

class SignUpLocationPage extends StatelessWidget {
  static String routeName = "/signup_location";
  const SignUpLocationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SignUpController signUpController = Get.put(SignUpController());
    return body(signUpController);
  }

  body(SignUpController signUpController) {
    return Obx(
      () => SignUpLocationBodyComponent(
        goNext: signUpController.signUpLocationGoNext,
        goNextOnPressed: signUpController.signUpLocationGoNextOnPressed,
        locationPermissionTitle: signUpController.signUpLocationPermissionTitle,
        locationPermission: signUpController.signUpLocationSettingPermission,
        locationPermissionOnPressed:
            signUpController.signUpLocationPermissionOnPressed,
      ),
    );
  }
}
