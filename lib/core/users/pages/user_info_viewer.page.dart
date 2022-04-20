import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seeks_app_prototype/core/common/widgets/appbar.widget.dart';
import 'package:seeks_app_prototype/core/users/components/user_info_body.dart';
import 'package:seeks_app_prototype/core/users/controllers/user_info_controller.dart';

class UserInfoViewerPage extends StatefulWidget {
  static String routeName = "/user_info_viewer_page";
  const UserInfoViewerPage({Key? key}) : super(key: key);

  @override
  State<UserInfoViewerPage> createState() => _UserInfoViewerPageState();
}

class _UserInfoViewerPageState extends State<UserInfoViewerPage> {
  UserInfoController userInfoController = Get.put(UserInfoController());

  @override
  void initState() {
    super.initState();
    print("initState userInfoController.userId: ${userInfoController.userId}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: body(),
    );
  }

  body() {
    return UserInfoBodyComponent();
  }

  appBar() {
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

/* class UserInfoViewerPage extends StatelessWidget {
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
} */
