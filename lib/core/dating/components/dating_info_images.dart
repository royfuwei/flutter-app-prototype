import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seeks_app_prototype/configs/size_config.dart';
import 'package:seeks_app_prototype/core/dating/controllers/dating_info.controller.dart';
import 'package:seeks_app_prototype/core/media/widgets/media_images_viewer.widget.dart';

class DatingInfoImagesComponent extends StatelessWidget {
  const DatingInfoImagesComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return body(context);
  }

  body(BuildContext context) {
    return bodyDatingImages(context);
  }

  bodyDatingImages(BuildContext context) {
    DatingInfoController datingInfoController = Get.put(DatingInfoController());
    return Container(
      height: MediaQuery.of(context).size.width,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(8),
      // decoration: BoxDecoration(color: Colors.grey),
      child: Obx(
        () {
          return datingInfoController.datingInfoImageProviders.length > 0
              ? MediaImagesViewerWidget(
                  images: datingInfoController.datingInfoImageProviders,
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
