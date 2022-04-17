import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seeks_app_prototype/core/common/widgets/appbar.widget.dart';
import 'package:seeks_app_prototype/core/common/widgets/is_actived_button.widget.dart';
import 'package:seeks_app_prototype/core/users/components/user_info_editor_body.dart';
import 'package:seeks_app_prototype/core/users/controllers/user_info_controller.dart';

class UserInfoEditorPage extends StatefulWidget {
  static String routeName = "/user_info_editor";
  const UserInfoEditorPage({Key? key}) : super(key: key);

  @override
  State<UserInfoEditorPage> createState() => _UserInfoEditorPageState();
}

class _UserInfoEditorPageState extends State<UserInfoEditorPage> {
  UserInfoController userInfoController = Get.put(UserInfoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: body(),
    );
  }

  body() {
    return UserInfoEditorBodyComponent();
  }

  appBar() {
    return AppBarWidget(
      backgroundColor: Colors.white,
      startItems: [
        appBarBackButton(context: context),
      ],
      titleItems: [
        appBarTitleText(
          context: context,
          text: "編輯個人資料",
        ),
      ],
      endItems: [
        Obx(
          () => isActivedTextButtonWidget(
            onPressed: userInfoController.userInfoEditorSaveOnPressed,
            isActived: userInfoController.editorCanSave,
            context: context,
            text: "儲存",
          ),
        ),
      ],
    );
  }
}
