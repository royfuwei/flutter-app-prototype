import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seeks_app_prototype/core/signup/components/signup_push_notification_body.dart';
import 'package:seeks_app_prototype/core/signup/controllers/signup_push_notification.controller.dart';

class SignUpPushNotificationPage extends StatelessWidget {
  static String routeName = "/signup_push_notification";
  const SignUpPushNotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SignUpPushNotificationController signUpPushNotificationController =
        Get.put(SignUpPushNotificationController());
    return body(signUpPushNotificationController);
  }

  body(SignUpPushNotificationController signUpPushNotificationController) {
    return Obx(
      () => SignUpPushNotificationBodyComponent(
        goNext: signUpPushNotificationController.goNext,
        goNextOnPressed: signUpPushNotificationController.goNextOnPressed,
        notificationPermissionTitle:
            signUpPushNotificationController.notificationPermissionTitle,
        notificationPermission:
            signUpPushNotificationController.notificationSettingPermission,
        notificationPermissionOnPressed:
            signUpPushNotificationController.notificationPermissionOnPressed,
      ),
    );
  }
}
