import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seeks_app_prototype/core/signup/components/signup_images_upload_body.dart';
import 'package:seeks_app_prototype/core/signup/controllers/signup.controller.dart';

class SignUpImagesUpload extends StatelessWidget {
  static String routeName = "/signup_images_upload";
  const SignUpImagesUpload({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SignUpController signUpController = Get.put(SignUpController());
    return body(signUpController);
  }

  body(SignUpController signUpController) {
    return SignUpImagesUploadBodyComponent(
      goNextOnPressed: signUpController.signUpImagesUploadGoNextOnPressed,
    );
  }
}
