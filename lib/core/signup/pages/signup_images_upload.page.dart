import 'package:flutter/material.dart';
import 'package:seeks_app_prototype/core/signup/components/signup_images_upload_body.dart';

class SignUpImagesUpload extends StatelessWidget {
  static String routeName = "/signup_images_upload";
  const SignUpImagesUpload({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return body();
  }

  body() {
    return SignUpImagesUploadBodyComponent();
  }
}
