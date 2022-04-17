import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seeks_app_prototype/core/users/components/user_info_habby.dart';
import 'package:seeks_app_prototype/core/users/components/user_info_images.dart';
import 'package:seeks_app_prototype/core/users/components/user_info_list.dart';
import 'package:seeks_app_prototype/core/users/controllers/user_info_controller.dart';
import 'package:seeks_app_prototype/core/users/widgets/user_info_title.widget.dart';

/* class UserInfoBodyComponent extends StatefulWidget {
  const UserInfoBodyComponent({Key? key}) : super(key: key);

  @override
  State<UserInfoBodyComponent> createState() => _UserInfoBodyComponentState();
}

class _UserInfoBodyComponentState extends State<UserInfoBodyComponent> {
  @override
  Widget build(BuildContext context) {
    UserInfoController userInfoController = Get.put(UserInfoController());
    return body(context, userInfoController);
  }

  body(BuildContext context, UserInfoController userInfoController) {
    return SafeArea(
      bottom: false,
      child: bodyListView(context, userInfoController),
    );
  }

  bodyListView(BuildContext context, UserInfoController userInfoController) {
    return Container(
      child: ListView(
        children: [
          bodyUserImages(context, userInfoController),
          bodyUserInfoTitle(userInfoController),
          bodyUserInfoList(userInfoController),
          bodyUserInfoHabby(context, userInfoController),
        ],
      ),
    );
  }

  bodyUserImages(BuildContext context, UserInfoController userInfoController) {
    return Obx(
      () => UserInfoImagesComponent(
        items: userInfoController.userInfo.images,
        // items: userInfoController.userInfoImages,
      ),
    );
  }

  bodyUserInfoTitle(UserInfoController userInfoController) {
    return Container(
      child: Obx(
        () => UserInfoTitleWidget(
          username: userInfoController.userInfo.username,
          age: userInfoController.userInfo.age,
          description: userInfoController.userInfo.description,
          city: userInfoController.userInfo.city,
        ),
      ),
      // child: UserInfoWidget(),
    );
  }

  bodyUserInfoList(UserInfoController userInfoController) {
    return Obx(
      () => UserInfoListComponent(
        items: userInfoController.userInfo.infoList,
      ),
    );
  }

  bodyUserInfoHabby(BuildContext context, UserInfoController userInfoController) {
    return Obx(
      () => UserInfoLabelsComponent(
        title: userInfoController.userInfo.habbyLabels.name,
        items: userInfoController.userInfo.habbyLabels.contents,
      ),
    );
  }
} */

class UserInfoBodyComponent extends StatelessWidget {
  const UserInfoBodyComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserInfoController userInfoController = Get.put(UserInfoController());
    return body(context, userInfoController);
  }

  body(BuildContext context, UserInfoController userInfoController) {
    return SafeArea(
      bottom: false,
      child: SingleChildScrollView(
        child: bodyListView(context, userInfoController),
      ),
    );
  }

  bodyListView(BuildContext context, UserInfoController userInfoController) {
    return Container(
      child: Column(
        children: [
          bodyUserImages(context, userInfoController),
          bodyUserInfoTitle(userInfoController),
          bodyUserInfoList(userInfoController),
          bodyUserInfoHabby(context, userInfoController),
        ],
      ),
    );
  }

  bodyUserImages(BuildContext context, UserInfoController userInfoController) {
    return UserInfoImagesComponent();
  }

  bodyUserInfoTitle(UserInfoController userInfoController) {
    return Container(
      child: Obx(
        () => UserInfoTitleWidget(
          username: userInfoController.userInfo.username,
          age: userInfoController.userInfo.age,
          description: userInfoController.userInfo.description,
          city: userInfoController.userInfo.city,
        ),
      ),
      // child: UserInfoWidget(),
    );
  }

  bodyUserInfoList(UserInfoController userInfoController) {
    return Obx(
      () => UserInfoListComponent(
        items: userInfoController.userInfo.infoList,
      ),
    );
  }

  bodyUserInfoHabby(BuildContext context, UserInfoController userInfoController) {
    return Obx(
      () => UserInfoLabelsComponent(
        title: userInfoController.userInfo.habbyLabels.name,
        items: userInfoController.userInfo.habbyLabels.contents,
      ),
    );
  }
}
