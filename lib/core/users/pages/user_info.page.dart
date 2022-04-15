import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seeks_app_prototype/core/common/widgets/appbar.widget.dart';
import 'package:seeks_app_prototype/core/users/components/user_info_body.dart';
import 'package:seeks_app_prototype/core/users/components/user.component.dart';
import 'package:seeks_app_prototype/core/users/controllers/user_controller.dart';

class UserInfoPage extends StatelessWidget {
  static String routeName = "/user_info_page";
  const UserInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: appBar(context),
      body: body(),
      floatingActionButton: userInfoFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  body() {
    return UserInfoBodyComponent();
  }

  appBar(BuildContext context) {
    UserController userController = Get.put(UserController());
    return !userController.isUserInfoOwner
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
                  name: userController.userInfo.username,
                  status: userController.userStatus,
                  isOnline: userController.userIsOnline,
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
