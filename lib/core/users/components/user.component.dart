import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seeks_app_prototype/core/users/controllers/user_controller.dart';

userInfoFloatingActionButton() {
  UserController userController = Get.put(UserController());
  return Obx(() {
    var widget = userController.isUserInfoOwner
        ? FloatingActionButton(
            onPressed: userController.floatingActionButtonOnPressed,
            child: Icon(
              Icons.edit,
              color: Colors.grey,
              size: 24,
            ),
            backgroundColor: Colors.amber.shade300,
          )
        : Container();
    return widget;
  });
}
