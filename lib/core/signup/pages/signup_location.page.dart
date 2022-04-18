import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seeks_app_prototype/core/signup/components/signup_location_body.dart';
import 'package:seeks_app_prototype/core/signup/controllers/signup_location.controller.dart';

class SignUpLocationPage extends StatelessWidget {
  static String routeName = "/signup_location";
  const SignUpLocationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SignUpLocationController signUpLocationController =
        Get.put(SignUpLocationController());
    return body(signUpLocationController);
  }

  body(SignUpLocationController signUpLocationController) {
    return Obx(
      () => SignUpLocationBodyComponent(
        goNext: signUpLocationController.goNext,
        goNextOnPressed: signUpLocationController.goNextOnPressed,
        locationPermissionTitle:
            signUpLocationController.locationPermissionTitle,
        locationPermission: signUpLocationController.locationSettingPermission,
        locationPermissionOnPressed:
            signUpLocationController.locationPermissionOnPressed,
      ),
    );
  }
}
