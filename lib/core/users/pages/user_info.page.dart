import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seeks_app_prototype/core/users/components/user_info_body.dart';
import 'package:seeks_app_prototype/core/users/components/user.component.dart';
import 'package:seeks_app_prototype/core/users/controllers/user_controller.dart';

class UserInfoPage extends StatelessWidget {
  static String routeName = "/user_info_page";
  const UserInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserController userController = Get.put(UserController());
    return Scaffold(
      body: body(),
      floatingActionButton: userInfoFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  body() {
    return UserInfoBodyComponent();
  }
}
