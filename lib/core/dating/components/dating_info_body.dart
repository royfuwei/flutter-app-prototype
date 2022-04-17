import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seeks_app_prototype/configs/size_config.dart';
import 'package:seeks_app_prototype/core/common/components/status_button.dart';
import 'package:seeks_app_prototype/core/dating/components/dating_info_buttom.dart';
import 'package:seeks_app_prototype/core/dating/components/dating_info_images.dart';
import 'package:seeks_app_prototype/core/dating/components/dating_info_list.dart';
import 'package:seeks_app_prototype/core/dating/controllers/dating_info.controller.dart';

class DatingInfoBodyComponent extends StatelessWidget {
  static String routeName = "/dating_info_body_component";
  const DatingInfoBodyComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: body(context),
      ),
    );
  }

  body(BuildContext context) {
    DatingInfoController datingInfoController = Get.put(
      DatingInfoController(),
    );
    return SafeArea(
      child: Container(
        child: Column(
          children: [
            Expanded(
              child: bodyDatingScrollView(context),
            ),
            Obx(
              () => datingInfoController.showButton
                  ? DatingInfoButtomComponent(
                      title: datingInfoController.buttonTitle,
                      isDisabled: !datingInfoController.isActiveButton,
                      onPressed: datingInfoController.statusButtonOnPressed,
                    )
                  : Container(),
            ),
          ],
        ),
      ),
    );
  }

  bodyDatingScrollView(BuildContext context) {
    return Container(
      // color: Colors.amber,
      child: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: bodyDatingWidget(),
      ),
    );
  }

  bodyDatingWidget() {
    return Container(
      child: Column(
        children: [
          bodyDatingImages(),
          bodyDatingInfo(),
        ],
      ),
    );
  }

  bodyDatingImages() {
    return DatingInfoImagesComponent();
  }

  bodyDatingInfo() {
    DatingInfoController datingInfoController = Get.put(
      DatingInfoController(),
    );
    return Obx(
      () => DatingInfoListComponent(
        title: datingInfoController.datingInfo.title,
        location: datingInfoController.datingInfo.location,
        city: datingInfoController.datingInfo.city,
        description: datingInfoController.datingInfo.description,
        labelWidgets: datingInfoController.datingLabelWidgets,
        datingDate: datingInfoController.datingInfo.datingInfoTime.datingDate,
        datingWeek: datingInfoController.datingInfo.datingInfoTime.datingWeek,
        datingRange: datingInfoController.datingInfo.datingInfoTime.datingRange,
        deadlineDate:
            datingInfoController.datingInfo.datingInfoTime.deadlineDate,
        deadlineTime:
            datingInfoController.datingInfo.datingInfoTime.deadlineTime,
        deadlineWeek:
            datingInfoController.datingInfo.datingInfoTime.deadlineWeek,
      ),
    );
  }
}
