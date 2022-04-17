import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:seeks_app_prototype/core/users/components/user_dating_listview.dart';
import 'package:seeks_app_prototype/core/users/controllers/user_dating.controller.dart';

class UserDatingListBodyComponent extends StatefulWidget {
  const UserDatingListBodyComponent({Key? key}) : super(key: key);

  @override
  State<UserDatingListBodyComponent> createState() =>
      _UserDatingListBodyComponentState();
}

class _UserDatingListBodyComponentState
    extends State<UserDatingListBodyComponent> {
  UserDatingController userDatingController = Get.put(UserDatingController());
  RefreshController refreshController = RefreshController();

  @override
  Widget build(BuildContext context) {
    return body();
  }

  @override
  void initState() {
    super.initState();
    userDatingController.onInit();
  }

  body() {
    UserDatingController userDatingController = Get.put(UserDatingController());
    RefreshController refreshController = RefreshController();
    return Obx(
      () => UserDatingListviewComponent(
        userHistoryDating: userDatingController.userHistoryDating,
        userProcessDating: userDatingController.userProcessDating,
        userSignUpDating: userDatingController.userSignUpDating,
        refreshController: refreshController,
        onRefresh: () => userDatingController.onRefreshUserDatingList(
          refreshController,
        ),
        itemOnPressed: userDatingController.datingInfoOnPressed,
      ),
    );
  }
}
