import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seeks_app_prototype/configs/size_config.dart';
import 'package:seeks_app_prototype/constants.dart';
import 'package:seeks_app_prototype/core/common/components/default_flow_content.dart';
import 'package:seeks_app_prototype/core/common/components/default_title.dart';
import 'package:seeks_app_prototype/core/common/components/status_button.dart';
import 'package:seeks_app_prototype/core/entry/pages/entry.page.dart';
import 'package:seeks_app_prototype/core/media/models/media_asset_image.dart';
import 'package:seeks_app_prototype/core/media/providers/media_image_selector_provider.dart';
import 'package:seeks_app_prototype/core/media/pages/media_image_selector.page.dart';
import 'package:seeks_app_prototype/core/signup/pages/signup_user_info.page.dart';
import 'package:seeks_app_prototype/infrastructures/util/getx_routes.dart';

class ImageUploadPage extends StatefulWidget {
  static String routeName = "/image/upload";
  const ImageUploadPage({Key? key}) : super(key: key);

  @override
  _ImageUploadPageState createState() => _ImageUploadPageState();
}

class _ImageUploadPageState extends State<ImageUploadPage> {
  bool goNext = false;
  List<CropImageInfoModel> selectImageInfoList = [];

  @override
  void initState() {
    super.initState();
    context.read<MediaImageSelectorProvider>().clear();
    genSelectImageInfoList();
  }

  genSelectImageInfoList() {
    if (selectImageInfoList.length == 0) {
      selectImageInfoList.add(
        CropImageInfoModel(
          id: "btn",
          data: Uint8List.fromList([]),
          shape: BoxShape.rectangle,
        ),
      );
    }
  }

  genProviderSelectImageInfoList(
    List<CropImageInfoModel> selectImageInfoList,
  ) {
    List<CropImageInfoModel> temp = [
      CropImageInfoModel(
        id: "btn",
        data: Uint8List.fromList([]),
        shape: BoxShape.rectangle,
      ),
    ];
    temp.addAll(selectImageInfoList);
    return temp;
  }

  @override
  Widget build(BuildContext context) {
    var _widget = buildWidget();
    return _widget;
  }

  buildWidget() {
    return Consumer<MediaImageSelectorProvider>(
      builder: (bc, model, wg) {
        print("Consumer model: ${model.selectImageInfoList}");
        // selectImageInfoList.addAll(model.selectImageInfoList);
        selectImageInfoList =
            genProviderSelectImageInfoList(model.selectImageInfoList);

        return Container(
          child: DefaultFlowPage(
            contentMainAxisAlignment: MainAxisAlignment.start,
            content: [
              DefaultTitle(
                title: "上傳照片",
                subTitle: "請至少上傳一張照片",
              ),
              VerticalSpacing(of: 25),
              Expanded(
                child: Container(
                  // height: MediaQuery.of(context).size.height * 0.6,
                  child: getGirdView(),
                ),
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
                    toRoutesNamed([
                      EntryPage.routeName,
                      SignUpUserInfoPage.routeName,
                    ]);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  genGirdViewItem(CropImageInfoModel cropImageInfo, int idx) {
    Widget _widget;
    if (cropImageInfo.id == "btn") {
      _widget = _selectImagePageBtn();
    } else {
      _widget = _imageGridViewItem(cropImageInfo, idx);
    }
    return _widget;
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
        return genGirdViewItem(selectImageInfoList[idx], idx);
      },
    );
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
            child: MediaImageSelectorPage(),
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
              onPressed: () {
                context
                    .read<MediaImageSelectorProvider>()
                    // .removeItemById(cropImageInfo.id);
                    .removeItemByIndex(idx - 1);
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
