import 'package:flutter/material.dart';
import 'package:seeks_app_prototype/core/splash/components/body.dart';
import 'package:seeks_app_prototype/configs/size_config.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "/splash";
  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    SizeConfig(context: context);
    return Scaffold(
      body: Body(),
    );
  }
}
