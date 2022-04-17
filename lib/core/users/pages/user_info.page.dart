import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seeks_app_prototype/core/common/widgets/appbar.widget.dart';
import 'package:seeks_app_prototype/core/users/components/user_info_body.dart';
import 'package:seeks_app_prototype/core/users/components/user.component.dart';
import 'package:seeks_app_prototype/core/users/controllers/user_info_controller.dart';

class UserInfoPage extends StatefulWidget {
  static String routeName = "/user_info_page";
  const UserInfoPage({Key? key}) : super(key: key);

  @override
  State<UserInfoPage> createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
  UserInfoController userInfoController = Get.put(UserInfoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(),
      floatingActionButton: userInfoFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  @override
  void initState() {
    super.initState();
    userInfoController.refreshOwnerUserInfo();
  }

  body() {
    return UserInfoBodyComponent();
  }

  appBar(BuildContext context) {
    return !userInfoController.isUserInfoOwner
        ? AppBarWidget(
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
          )
        : null;
  }
}
