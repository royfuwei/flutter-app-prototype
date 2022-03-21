import 'package:flutter/material.dart';
import 'package:seeks_app_prototype/core/forgot_password/component/body.dart';

class ForgotPasswordPage extends StatelessWidget {
  static String routeName = "/forgot_password";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forgot Password"),
      ),
      body: Body(),
    );
  }
}
