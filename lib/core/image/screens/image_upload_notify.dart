import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:seeks_app_prototype/configs/size_config.dart';
import 'package:seeks_app_prototype/constants.dart';
import 'package:seeks_app_prototype/core/common/components/default_app_bar.dart';
import 'package:seeks_app_prototype/core/common/components/default_flow_content.dart';
import 'package:seeks_app_prototype/core/common/components/default_title.dart';
import 'package:seeks_app_prototype/core/common/components/status_button.dart';
import 'package:seeks_app_prototype/core/media/providers/media_image_selector_provider.dart';
import 'package:seeks_app_prototype/core/media/screens/media_image_selector.dart';
import 'package:seeks_app_prototype/core/test/screens/dev_image_pickers.dart';
import 'package:seeks_app_prototype/core/users/screens/user_create_info_screen.dart';
import 'package:seeks_app_prototype/routes.dart';

class ImageUploadNotifyScreen extends StatefulWidget {
  static String routeName = "image/upload_notify";
  const ImageUploadNotifyScreen({Key? key}) : super(key: key);

  @override
  _ImageUploadNotifyScreenState createState() =>
      _ImageUploadNotifyScreenState();
}

class _ImageUploadNotifyScreenState extends State<ImageUploadNotifyScreen> {
  bool goNext = false;
  List<CropImageInfoEntity> selectImageInfoList = [];

  @override
  void initState() {
    super.initState();
    genSelectImageInfoList();
  }

  genSelectImageInfoList() {
    if (selectImageInfoList.length == 0) {
      selectImageInfoList.add(
        CropImageInfoEntity(
            id: "btn", data: Uint8List.fromList([]), shape: BoxShape.rectangle),
      );
    }
    /* List<CropImageInfoEntity> temp = [];
    for (var selectImageInfo in selectImageInfoList) {
      temp.add(selectImageInfo);
    }
    selectImageInfoList.addAll(temp); */
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DefaultFlowPage(
        // contentMainAxisAlignment: MainAxisAlignment.start,
        content: [
          DefaultTitle(
            title: "上傳照片",
            subTitle: "請至少上傳一張照片",
          ),
          VerticalSpacing(of: 25),
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            // height: MediaQuery.of(context).size.height * 0.3,
            // child: getGirdView(),
            child: getGirdView(),
          ),
        ],
        buttom: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: getProportionateScreenHeight(context, 24),
              // horizontal: getProportionateScreenWidth(context, 100),
            ),
            child: StatusButton(
              text: "下一步",
              isDisabled: selectImageInfoList.length - 1 <= 0,
              press: () {
                routePushNamed(context, UserCreateInfoScreen.routeName);
              },
            ),
          ),
        ],
      ),
    );
  }

  appBar() {
    return AppBar(
      iconTheme: IconThemeData(color: seeksLoginColor01),
      elevation: 0,
      backgroundColor: colorBarWhite,
      title: defaultExpandedAppBarTitle(),
    );
  }

  getGirdView() {
    return GridView.builder(
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
      itemCount: selectImageInfoList.length,
      itemBuilder: (bc, idx) {
        return genGirdViewItem(selectImageInfoList[idx]);
      },
    );
  }

  genGirdViewItem(CropImageInfoEntity cropImageInfo) {
    Widget _widget;
    if (cropImageInfo.id == "btn") {
      _widget = _selectImagePageBtn();
    } else {
      _widget = _imageGridViewItem(cropImageInfo);
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
        backgroundColor: MaterialStateProperty.all(kPrimaryColor),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            // side: BorderSide(color: Colors.red),
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
        return NotificationListener<ImageSelectorNotification>(
          onNotification: (notification) {
            setState(() {
              selectImageInfoList.addAll(notification.selectImageInfoList);
            });
            Navigator.pop(context);
            return true;
          },
          child: SafeArea(
            bottom: false,
            child: ImageSelector(),
          ),
        );
      },
    );
  }

  Container _imageGridViewItem(CropImageInfoEntity cropImageInfo) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 0.1, color: Colors.grey),
        image: DecorationImage(image: Image.memory(cropImageInfo.data).image),
      ),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Transform.translate(
            offset: Offset(0, 0),
            child: TextButton(
              onPressed: () {
                setState(() {
                  selectImageInfoList.removeWhere(
                    (element) => element.id == cropImageInfo.id,
                  );
                });
              },
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
