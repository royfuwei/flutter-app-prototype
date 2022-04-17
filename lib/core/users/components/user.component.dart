import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seeks_app_prototype/core/users/controllers/user_info_controller.dart';

userInfoFloatingActionButton() {
  UserInfoController userInfoController = Get.put(UserInfoController());
  return Obx(() {
    var widget = userInfoController.isUserInfoOwner
        ? FloatingActionButton(
            onPressed: userInfoController.floatingActionButtonOnPressed,
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
