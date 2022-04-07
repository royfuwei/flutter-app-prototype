import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seeks_app_prototype/configs/size_config.dart';
import 'package:seeks_app_prototype/constants.dart';
import 'package:seeks_app_prototype/core/media/models/media_asset_image.dart';
import 'package:seeks_app_prototype/core/media/pages/media_image_selector.page.dart';
import 'package:seeks_app_prototype/core/signup/controllers/signup_images.controller.dart';

class SignUpImagesUploadGridViewCompnent extends StatefulWidget {
  const SignUpImagesUploadGridViewCompnent({Key? key}) : super(key: key);

  @override
  State<SignUpImagesUploadGridViewCompnent> createState() =>
      _SignUpImagesUploadGridViewCompnentState();
}

class _SignUpImagesUploadGridViewCompnentState
    extends State<SignUpImagesUploadGridViewCompnent> {
  SignUpImagesController signUpImagesController = Get.put(
    SignUpImagesController(),
  );

  @override
  Widget build(BuildContext context) {
    return body();
  }

  body() {
    return Container(
      child: getGridView(),
    );
  }

  getGridView() {
    return Obx(
      () => GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          // 每行
          crossAxisCount: 3,
          // 子 Widget 寬高比
          childAspectRatio: 1.0,
          // 非滾動方向間距
          crossAxisSpacing: 24.0,
          // 滾動方向間距
          mainAxisSpacing: 24.0,
        ),
        itemCount: signUpImagesController.selectImagesList.length,
        itemBuilder: (bc, idx) {
          return genGridViewItem(
            signUpImagesController.selectImagesList[idx],
            idx,
          );
        },
      ),
    );
  }

  genGridViewItem(CropImageInfoModel cropImageInfo, int idx) {
    Widget _widget;
    if (cropImageInfo.id == "btn") {
      _widget = _selectImagePageBtn();
    } else {
      _widget = _imageGridViewItem(cropImageInfo, idx);
    }
    return _widget;
  }

  Widget _selectImagePageBtn() {
    return ElevatedButton(
      onPressed: () {
        showModalMediaBottomSheet(context);
        // routePushNamed(context, ImageSelector.routeName);
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(colorTextField),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
        ),
      ),
      child: Icon(
        Icons.add,
        size: getProportionateScreenWidth(context, 40),
      ),
    );
  }

  showModalMediaBottomSheet(context) {
    showDialog(
      barrierColor: Colors.black,
      context: context,
      useSafeArea: false,
      builder: (BuildContext bc) {
        return NotificationListener<MediaImageSelectorPageNotification>(
          onNotification: (notification) {
            Navigator.pop(context);
            return true;
          },
          child: SafeArea(
            bottom: false,
            child: ImageSelectorPage(),
          ),
        );
      },
    );
  }

  Container _imageGridViewItem(CropImageInfoModel cropImageInfo, int idx) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 0.1, color: Colors.grey),
        image: DecorationImage(
          image: Image.memory(cropImageInfo.data).image,
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Transform.translate(
            offset: Offset(1, -1),
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                backgroundColor: Colors.black54,
                shape: CircleBorder(),
                padding: EdgeInsets.all(0),
              ),
              child: Icon(
                Icons.cancel,
                size: getProportionateScreenWidth(context, 24),
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
