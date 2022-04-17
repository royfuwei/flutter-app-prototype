import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seeks_app_prototype/core/users/components/user_info_editor_image.dart';
import 'package:seeks_app_prototype/core/users/components/user_info_editor_list.dart';
import 'package:seeks_app_prototype/core/users/controllers/user_info_controller.dart';

class UserInfoEditorBodyComponent extends StatelessWidget {
  const UserInfoEditorBodyComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserInfoController userInfoController = Get.put(UserInfoController());
    return body(context, userInfoController);
  }

  body(BuildContext context, UserInfoController userInfoController) {
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
              bodyUserEditorInfoList(userInfoController),
            ],
          ),
        ),
      ),
    );
  }

  bodyUserEditorInfoList(UserInfoController userInfoController) {
    return Obx(
      () => UserInfoEditorListComponent(
        items: userInfoController.userInfo.infoList,
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
