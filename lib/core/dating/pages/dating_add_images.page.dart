import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seeks_app_prototype/core/common/widgets/appbar.widget.dart';
import 'package:seeks_app_prototype/core/common/widgets/is_actived_button.widget.dart';
import 'package:seeks_app_prototype/core/dating/components/dating_add_images_body.dart';
import 'package:seeks_app_prototype/core/dating/controllers/dating_add.controller.dart';
import 'package:seeks_app_prototype/core/dating/pages/dating_add_info.page.dart';

class DatingAddImagesPage extends StatelessWidget {
  const DatingAddImagesPage({Key? key}) : super(key: key);

  static String routeName = "/dating_add_image";

  @override
  Widget build(BuildContext context) {
    /* return Navigator(
      pages: [
        MaterialPage(
          name: DatingAddImagesPage.routeName,
          child: Scaffold(
            appBar: appBar(),
            body: body(),
          ),
        ),
      ],
    ); */
    return Scaffold(
      appBar: appBar(context),
      body: body(),
    );
  }

  body() {
    return DatingAddImageBodyComponent();
  }

  appBar(BuildContext context) {
    DatingAddController datingAddController = Get.put(DatingAddController());
    return AppBarWidget(
      startItems: [
        appBarBackButton(context: context),
      ],
      titleItems: [
        appBarTitleText(
          context: context,
          text: "新約會",
        ),
      ],
      endItems: [
        Obx(() => isActivedTextButtonWidget(
              // onPressed: () {
              //   Get.to(() => DatingAddInfoPage());
              // },
              onPressed: datingAddController.datingAddImagesToNextOnPressed,
              isActived: datingAddController.datingAddImagesToNext,
              context: context,
              text: "下一步",
            )),
      ],
    );
  }
}
