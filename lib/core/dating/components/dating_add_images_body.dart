import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seeks_app_prototype/core/dating/controllers/dating_add.controller.dart';
import 'package:seeks_app_prototype/core/media/components/media_grid_selector_crop.dart';

class DatingAddImageBodyComponent extends StatelessWidget {
  const DatingAddImageBodyComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return body(context);
  }

  body(BuildContext context) {
    DatingAddController datingAddController = Get.put(DatingAddController());
    return NotificationListener<MediaGridSelectorCropNotification>(
      onNotification: (notificaiton) {
        datingAddController.getSelectImageInfoList(notificaiton.cropAssets);
        print(
          "notificaiton.cropAssets.length: ${notificaiton.cropAssets.length}",
        );
        return true;
      },
      child: MediaGridSelectorCrop(),
    );
  }
}
