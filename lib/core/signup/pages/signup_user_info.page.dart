import 'package:flutter/material.dart';
import 'package:seeks_app_prototype/core/signup/components/signup_user_info_body.dart';

class SignUpUserInfoPage extends StatelessWidget {
  static String routeName = "/signup_user_info";
  const SignUpUserInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return body();
  }

  body() {
    return SignUpUserInfoBodyComponent();
  }
}
