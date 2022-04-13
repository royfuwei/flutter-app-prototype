import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seeks_app_prototype/configs/size_config.dart';
import 'package:seeks_app_prototype/core/media/components/media_image.component.dart';
import 'package:seeks_app_prototype/core/media/widgets/media_images_viewer.widget.dart';
import 'package:seeks_app_prototype/core/users/controllers/user_controller.dart';
import 'package:seeks_app_prototype/domain/user.dart';

class UserInfoImagesComponent extends StatefulWidget {
  const UserInfoImagesComponent({
    Key? key,
    this.items = const [],
  }) : super(key: key);
  final List<UserInfoImageEntity> items;

  @override
  State<UserInfoImagesComponent> createState() =>
      _UserInfoImagesComponentState();
}

class _UserInfoImagesComponentState extends State<UserInfoImagesComponent> {
  @override
  Widget build(BuildContext context) {
    return body();
  }

  body() {
    return bodyUserImages();
  }

  bodyUserImages() {
    UserController userController = Get.put(UserController());
    return Container(
      color: Colors.grey,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width,
      child: Obx(
        () {
          return userController.userInfoImageProviders.length > 0
              ? MediaImagesViewerWidget(
                  images: userController.userInfoImageProviders,
                )
              : Center(
                  child: Icon(
                    Icons.image,
                    color: Colors.black,
                    size: getProportionateScreenWidth(context, 40),
                  ),
                );
        },
      ),
    );
  }
}
