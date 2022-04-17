import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seeks_app_prototype/configs/size_config.dart';
import 'package:seeks_app_prototype/core/media/widgets/media_images_viewer.widget.dart';
import 'package:seeks_app_prototype/core/users/controllers/user_info_controller.dart';
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
    UserInfoController userInfoController = Get.put(UserInfoController());
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(8),
      child: Obx(
        () {
          return userInfoController.userInfoImageProviders.length > 0
              ? MediaImagesViewerWidget(
                  images: userInfoController.userInfoImageProviders,
                )
              : Container(
                  alignment: Alignment.center,
                  color: Colors.grey,
                  child: Icon(
                    Icons.account_box,
                    color: Colors.black,
                    size: getProportionateScreenWidth(context, 60),
                  ),
                );
        },
      ),
    );
  }
}
