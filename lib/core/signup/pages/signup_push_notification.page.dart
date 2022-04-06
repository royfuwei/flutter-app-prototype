import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seeks_app_prototype/core/notification/controllers/notification.controller.dart';
import 'package:seeks_app_prototype/core/signup/components/signup_push_notification_body.dart';
import 'package:seeks_app_prototype/core/signup/controllers/signup.controller.dart';

class SignUpPushNotificationPage extends StatelessWidget {
  static String routeName = "/signup_push_notification";
  const SignUpPushNotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SignUpController signUpController = Get.put(SignUpController());
    return body(signUpController);
  }

  body(SignUpController signUpController) {
    return Obx(
      () => SignUpPushNotificationBodyComponent(
        goNext: signUpController.signUpNotificationGoNext,
        goNextOnPressed: signUpController.signUpNotificationGoNextOnPressed,
        notificationPermissionTitle:
            signUpController.signUpNotificationPermissionTitle,
        notificationPermission:
            signUpController.signUpNotificationSettingPermission,
        notificationPermissionOnPressed:
            signUpController.signUpNotificationPermissionOnPressed,
      ),
    );
  }
}
