import 'dart:typed_data';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as DartImageEdit;
import 'package:photo_manager/photo_manager.dart';
import 'package:provider/provider.dart';
import 'package:seeks_app_prototype/configs/size_config.dart';
import 'package:seeks_app_prototype/constants.dart';
import 'package:seeks_app_prototype/core/common/components/default_app_bar.dart';
import 'package:seeks_app_prototype/core/media/components/media_grid_selector_crop.dart';
import 'package:seeks_app_prototype/core/media/providers/media_image_selector_provider.dart';
import 'package:seeks_app_prototype/core/media/widgets/media_image_crop_widget.dart';

class ImageSelectorPageNotification extends Notification {
  List<CropImageInfoEntity> selectImageInfoList;
  ImageSelectorPageNotification({
    required this.selectImageInfoList,
  });
}

class CropImageInfoEntity {
  final String id;
  final BoxShape shape;
  Uint8List data;
  // final File file;
  CropImageInfoEntity({
    required this.id,
    required this.shape,
    required this.data,
    // required this.file,
  });
}

class ImageSelectorPage extends StatefulWidget {
  static String routeName = "/media/image_selector";
  final String? title;
  final BoxShape? shape;
  final double? cropAspectRatios;
  const ImageSelectorPage({
    Key? key,
    this.title: "",
    this.shape: BoxShape.rectangle,
    this.cropAspectRatios: ImageCropAspectRatios.ratio1_1,
  }) : super(key: key);

  @override
  State<ImageSelectorPage> createState() => _ImageSelectorPageState();
}

class _ImageSelectorPageState extends State<ImageSelectorPage> {
  List<CropAssetEntity> cropAssets = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // context.read<MediaImageSelectorPageProvider>().clear();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      pages: [
        MaterialPage(
          name: ImageSelectorPage.routeName,
          child: Scaffold(
            appBar: appBar(),
            body: body(),
          ),
        ),
      ],
    );
  }

  Future<Uint8List?> cropImageDataWithDartLibrary(
      AssetEntity asset, Rect cropRect, EditActionDetails editAction) async {
    print('dart library start cropping');

    print('getCropRect : $cropRect');

    var data = await asset.thumbDataWithSize(1000, 1000);
    if (data != null) {
      DartImageEdit.Image? src = DartImageEdit.decodeImage(data);
      if (src != null) {
        src = DartImageEdit.bakeOrientation(src);
        if (editAction.needCrop)
          src = DartImageEdit.copyCrop(
              src,
              cropRect.left.toInt(),
              cropRect.top.toInt(),
              cropRect.width.toInt(),
              cropRect.height.toInt());

        if (editAction.needFlip) {
          DartImageEdit.Flip mode;
          if (editAction.flipY && editAction.flipX) {
            mode = DartImageEdit.Flip.both;
            src = DartImageEdit.flip(src, mode);
          } else if (editAction.flipY) {
            mode = DartImageEdit.Flip.horizontal;
            src = DartImageEdit.flip(src, mode);
          } else if (editAction.flipX) {
            mode = DartImageEdit.Flip.vertical;
            src = DartImageEdit.flip(src, mode);
          }
        }
        if (editAction.hasRotateAngle)
          src = DartImageEdit.copyRotate(
            src,
            editAction.rotateAngle,
          );
        var fileData = DartImageEdit.encodeJpg(src);
        data = fileData as Uint8List?;
      }
    }
    return data;
  }

  _cropCropAssets() async {
    print("_cropCropAssets cropAssets.length: ${cropAssets.length}");
    List<CropImageInfoEntity> temp = [];
    for (var cropAsset in cropAssets) {
      debugPrint("id: ${cropAsset.asset.id}");
      debugPrint(
          "lon ${cropAsset.asset.longitude}, lat: ${cropAsset.asset.latitude}");
      var asset = cropAsset.asset;
      var data = await asset.originBytes;
      debugPrint("data: ${data!.length}");
      var cropRect = cropAsset.cropRect!;
      var editAction = cropAsset.editAction!;
      Uint8List? newData =
          await cropImageDataWithDartLibrary(asset, cropRect, editAction);
      debugPrint("newData: ${newData!.length}");
      CropImageInfoEntity cropImageInfoEntity = new CropImageInfoEntity(
        data: newData,
        id: asset.id,
        shape: widget.shape!,
      );
      temp.add(cropImageInfoEntity);
    }
    print("temp.length: ${temp.length}");
    ImageSelectorPageNotification(selectImageInfoList: temp).dispatch(context);

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
    return AppBar(
      backgroundColor: Colors.black,
      title: defaultExpandedAppBarTitle(
        startItems: [
          TextButton(
            onPressed: () {
              Navigator.pop(
                context,
              );
            },
            child: Icon(
              Icons.close,
              // size: getProportionateScreenWidth(context, 30),
              color: colorFont02,
            ),
          ),
        ],
        titleItems: [
          Text(
            widget.title!,
            style: TextStyle(
              color: colorFont02,
              fontSize: getProportionateScreenWidth(context, 20),
            ),
          ),
        ],
        endItems: [
          TextButton(
            onPressed: cropAssets.length > 0
                ? () {
                    _cropCropAssets();
                  }
                : null,
            child: Row(
              children: [
                Text(
                  "下一步",
                  style: TextStyle(
                    color: cropAssets.length > 0 ? Colors.blue : colorFont03,
                    fontSize: getProportionateScreenWidth(context, 18),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  isActivedButton(bool isRead, String text) {
    return TextButton(
      onPressed: isRead
          ? () {
              setState(() {
                // 目前沒有效果
                isRead = !isRead;
              });
            }
          : null,
      child: Row(
        children: [
          /* Icon(
            Icons.check,
            color: isRead ? Colors.green : colorFont03,
          ), */
          Text(
            text,
            style: TextStyle(
              color: isRead ? Colors.green : colorFont03,
              fontSize: getProportionateScreenWidth(context, 18),
            ),
          ),
        ],
      ),
    );
  }
}
