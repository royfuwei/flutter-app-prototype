import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seeks_app_prototype/core/signup/components/signup_images_upload_body.dart';
import 'package:seeks_app_prototype/core/signup/controllers/signup_images.controller.dart';

class SignUpImagesUpload extends StatelessWidget {
  static String routeName = "/signup_images_upload";
  const SignUpImagesUpload({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SignUpImagesController signUpImagesController = Get.put(
      SignUpImagesController(),
    );
    return body(signUpImagesController);
  }

  body(SignUpImagesController signUpImagesController) {
    return SignUpImagesUploadBodyComponent(
      goNextOnPressed: signUpImagesController.goNextOnPressed,
    );
  }
}
