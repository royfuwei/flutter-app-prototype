import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seeks_app_prototype/configs/size_config.dart';
import 'package:seeks_app_prototype/constants.dart';
import 'package:seeks_app_prototype/core/entry/components/entry_body.dart';
import 'package:seeks_app_prototype/core/entry/controllers/entry.controller.dart';
import 'package:seeks_app_prototype/core/login/controllers/login_controller.dart';
import 'package:seeks_app_prototype/core/login/pages/login.page.dart';
import 'package:seeks_app_prototype/infrastructures/util/getx_routes.dart';

class EntryPage extends StatelessWidget {
  static String routeName = '/entry';
  const EntryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.put(LoginController());
    final EntryController entryController = Get.put(EntryController());
    return Scaffold(
      backgroundColor: bgMainColor,
      body: body(loginController, entryController),
    );
  }

  body(LoginController loginController, EntryController entryController) {
    return EntryBodyComponent(
      onEnd: () {
        entryController.bodyAnimatedOnEnd();
      },
    );
  }
}
