import 'dart:typed_data';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as DartImageEdit;
import 'package:photo_manager/photo_manager.dart';
import 'package:provider/provider.dart';
import 'package:seeks_app_prototype/configs/size_config.dart';
import 'package:seeks_app_prototype/constants.dart';
import 'package:seeks_app_prototype/core/common/components/default_app_bar.dart';
import 'package:seeks_app_prototype/core/common/widgets/appbar.widget.dart';
import 'package:seeks_app_prototype/core/common/widgets/is_actived_button.widget.dart';
import 'package:seeks_app_prototype/core/media/components/media_grid_selector_crop.dart';
import 'package:seeks_app_prototype/core/media/models/media_asset_image.dart';
import 'package:seeks_app_prototype/core/media/providers/media_image_selector_provider.dart';
import 'package:seeks_app_prototype/core/media/services/media.service.dart';
import 'package:seeks_app_prototype/domain/media.dart';

class MediaImageSelectorPageNotification extends Notification {
  List<CropImageInfoModel> selectImageInfoList;
  MediaImageSelectorPageNotification({
    required this.selectImageInfoList,
  });
}

class MediaImageSelectorPage extends StatefulWidget {
  static String routeName = "/media/image_selector";
  final String title;
  final String endTitle;
  final BoxShape? shape;
  final double? cropAspectRatios;
  const MediaImageSelectorPage({
    Key? key,
    this.title: "",
    this.endTitle: "下一步",
    this.shape: BoxShape.rectangle,
    this.cropAspectRatios: MediaAspectRatios.ratio1_1,
  }) : super(key: key);

  @override
  State<MediaImageSelectorPage> createState() => _MediaImageSelectorPageState();
}

class _MediaImageSelectorPageState extends State<MediaImageSelectorPage> {
  List<CropAssetEntity> cropAssets = [];
  MediaService mediaService = MediaService();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      pages: [
        MaterialPage(
          name: MediaImageSelectorPage.routeName,
          child: Scaffold(
            appBar: appBar(),
            body: body(),
          ),
        ),
      ],
    );
  }

  _cropCropAssets() async {
    print("_cropCropAssets cropAssets.length: ${cropAssets.length}");
    List<CropImageInfoModel> temp = await mediaService.cropCropAssets(
      cropAssets,
      widget.shape!,
    );

    MediaImageSelectorPageNotification(selectImageInfoList: temp)
        .dispatch(context);

    var selectImageInfoList =
        context.read<MediaImageSelectorProvider>().selectImageInfoList;
    print("context.read selectImageInfoList: ${selectImageInfoList}");

    // context.read<MediaImageSelectorProvider>().setSelectImageInfoList(temp);
    context.read<MediaImageSelectorProvider>().addItemByList(temp);
  }

  body() {
    return NotificationListener<MediaGridSelectorCropNotification>(
      onNotification: (notification) {
        cropAssets = notification.cropAssets;
        print("media_image_selector cropAssets: ${cropAssets.length}");
        setState(() {});
        return true;
      },
      child: MediaGridSelectorCrop(
        shape: BoxShape.rectangle,
        cropAspectRatios: widget.cropAspectRatios,
      ),
    );
  }

  appBar() {
    return AppBarWidget(
      backgroundColor: Colors.black,
      startItems: [
        appBarBackButton(
          context: context,
        ),
      ],
      titleItems: [
        appBarTitleText(
          context: context,
          text: widget.title,
        ),
      ],
      endItems: [
        isActivedTextButtonWidget(
          onPressed: cropAssets.length > 0
              ? () {
                  _cropCropAssets();
                }
              : null,
          isActived: cropAssets.length > 0,
          context: context,
          text: widget.endTitle,
        ),
      ],
    );
  }
}
