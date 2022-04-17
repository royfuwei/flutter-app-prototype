import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seeks_app_prototype/core/common/widgets/appbar.widget.dart';
import 'package:seeks_app_prototype/core/users/components/user_info_body.dart';
import 'package:seeks_app_prototype/core/users/controllers/user_info_controller.dart';

class UserInfoViewerPage extends StatelessWidget {
  static String routeName = "/user_info_viewer_page";
  const UserInfoViewerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: body(),
    );
  }

  body() {
    return UserInfoBodyComponent();
  }

  appBar(BuildContext context) {
    UserInfoController userInfoController = Get.put(UserInfoController());
    return AppBarWidget(
      startItems: [
        appBarBackButton(
          context: context,
          icon: Icons.arrow_back_ios,
        ),
      ],
      titleItems: [
        Obx(
          () => appBarUserTitle(
            context: context,
            name: userInfoController.userInfo.username,
            status: userInfoController.userStatus,
            isOnline: userInfoController.userIsOnline,
          ),
        ),
      ],
      endItems: [
        appBarIconButton(
          context: context,
          icon: Icons.more_horiz,
        ),
        // appBarMoreButton(),
      ],
    );
  }
}
