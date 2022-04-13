import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seeks_app_prototype/core/users/components/user_info_editor_image.dart';
import 'package:seeks_app_prototype/core/users/components/user_info_editor_list.dart';
import 'package:seeks_app_prototype/core/users/controllers/user_controller.dart';

class UserInfoEditorBodyComponent extends StatelessWidget {
  const UserInfoEditorBodyComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserController userController = Get.put(UserController());
    return body(context, userController);
  }

  body(BuildContext context, UserController userController) {
    return SafeArea(
      bottom: false,
      child: Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.grey.shade100,
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              bodyUserEditorImages(),
              bodyUserEditorInfoList(userController),
            ],
          ),
        ),
      ),
    );
  }

  bodyUserEditorInfoList(UserController userController) {
    return Obx(
      () => UserInfoEditorListComponent(
        items: userController.userInfo.infoList,
        onPressed: (item) {
          print(
            "item.title: ${item.title}, item.name: ${item.name}, item.dateType: ${item.dateType}",
          );
        },
      ),
    );
  }

  bodyUserEditorImages() {
    return UserInfoEditorImageComponent();
  }
}
