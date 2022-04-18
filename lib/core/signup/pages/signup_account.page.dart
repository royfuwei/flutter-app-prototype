import 'package:flutter/material.dart';
import 'package:seeks_app_prototype/core/signup/components/signup_account_body.dart';

class SignUpAccountPage extends StatelessWidget {
  static String routeName = "/signup_account";
  const SignUpAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return body();
  }

  body() {
    return SignUpAccountComponent();
  }
}
