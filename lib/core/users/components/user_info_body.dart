import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seeks_app_prototype/core/users/components/user_info_habby.dart';
import 'package:seeks_app_prototype/core/users/components/user_info_images.dart';
import 'package:seeks_app_prototype/core/users/components/user_info_list.dart';
import 'package:seeks_app_prototype/core/users/controllers/user_controller.dart';
import 'package:seeks_app_prototype/core/users/widgets/user_info_title.widget.dart';

/* class UserInfoBodyComponent extends StatefulWidget {
  const UserInfoBodyComponent({Key? key}) : super(key: key);

  @override
  State<UserInfoBodyComponent> createState() => _UserInfoBodyComponentState();
}

class _UserInfoBodyComponentState extends State<UserInfoBodyComponent> {
  @override
  Widget build(BuildContext context) {
    UserController userController = Get.put(UserController());
    return body(context, userController);
  }

  body(BuildContext context, UserController userController) {
    return SafeArea(
      bottom: false,
      child: bodyListView(context, userController),
    );
  }

  bodyListView(BuildContext context, UserController userController) {
    return Container(
      child: ListView(
        children: [
          bodyUserImages(context, userController),
          bodyUserInfoTitle(userController),
          bodyUserInfoList(userController),
          bodyUserInfoHabby(context, userController),
        ],
      ),
    );
  }

  bodyUserImages(BuildContext context, UserController userController) {
    return Obx(
      () => UserInfoImagesComponent(
        items: userController.userInfo.images,
        // items: userController.userInfoImages,
      ),
    );
  }

  bodyUserInfoTitle(UserController userController) {
    return Container(
      child: Obx(
        () => UserInfoTitleWidget(
          username: userController.userInfo.username,
          age: userController.userInfo.age,
          description: userController.userInfo.description,
          city: userController.userInfo.city,
        ),
      ),
      // child: UserInfoWidget(),
    );
  }

  bodyUserInfoList(UserController userController) {
    return Obx(
      () => UserInfoListComponent(
        items: userController.userInfo.infoList,
      ),
    );
  }

  bodyUserInfoHabby(BuildContext context, UserController userController) {
    return Obx(
      () => UserInfoLabelsComponent(
        title: userController.userInfo.habbyLabels.name,
        items: userController.userInfo.habbyLabels.contents,
      ),
    );
  }
} */

class UserInfoBodyComponent extends StatelessWidget {
  const UserInfoBodyComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserController userController = Get.put(UserController());
    return body(context, userController);
  }

  body(BuildContext context, UserController userController) {
    return SafeArea(
      bottom: false,
      child: bodyListView(context, userController),
    );
  }

  bodyListView(BuildContext context, UserController userController) {
    return Container(
      child: ListView(
        children: [
          bodyUserImages(context, userController),
          bodyUserInfoTitle(userController),
          bodyUserInfoList(userController),
          bodyUserInfoHabby(context, userController),
        ],
      ),
    );
  }

  bodyUserImages(BuildContext context, UserController userController) {
    return UserInfoImagesComponent();
  }

  bodyUserInfoTitle(UserController userController) {
    return Container(
      child: Obx(
        () => UserInfoTitleWidget(
          username: userController.userInfo.username,
          age: userController.userInfo.age,
          description: userController.userInfo.description,
          city: userController.userInfo.city,
        ),
      ),
      // child: UserInfoWidget(),
    );
  }

  bodyUserInfoList(UserController userController) {
    return Obx(
      () => UserInfoListComponent(
        items: userController.userInfo.infoList,
      ),
    );
  }

  bodyUserInfoHabby(BuildContext context, UserController userController) {
    return Obx(
      () => UserInfoLabelsComponent(
        title: userController.userInfo.habbyLabels.name,
        items: userController.userInfo.habbyLabels.contents,
      ),
    );
  }
}
