import 'package:flutter/material.dart';
import 'package:seeks_app_prototype/configs/size_config.dart';
import 'package:seeks_app_prototype/constants.dart';
import 'package:seeks_app_prototype/core/common/components/default_app_bar.dart';
import 'package:seeks_app_prototype/core/media/components/media_grid_selector.dart';
import 'package:seeks_app_prototype/core/media/components/media_grid_selector_crop.dart';
import 'package:seeks_app_prototype/core/media/widgets/media_image_crop_widget.dart';

class ImageSelector extends StatefulWidget {
  static String routeName = "media/image_selector";
  final String title;
  final BoxShape shape;
  final double? cropAspectRatios;
  const ImageSelector({
    Key? key,
    this.title: "",
    this.shape: BoxShape.rectangle,
    this.cropAspectRatios: ImageCropAspectRatios.ratio1_1,
  }) : super(key: key);

  @override
  State<ImageSelector> createState() => _ImageSelectorState();
}

class _ImageSelectorState extends State<ImageSelector> {
  List<CropAssetEntity> cropAssets = [];

  @override
  Widget build(BuildContext context) {
    return Navigator(
      pages: [
        MaterialPage(
          name: ImageSelector.routeName,
          child: Scaffold(
            appBar: appBar(),
            body: body(),
          ),
        ),
      ],
    );
  }

  body() {
    return NotificationListener<MediaGridSelectorCropNotification>(
      onNotification: (notification) {
        cropAssets = notification.cropAssets;
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
            widget.title,
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
                    for (var cropAsset in cropAssets) {
                      debugPrint(
                          "cropAsset.asset.id: ${cropAsset.asset.id}, longitude: ${cropAsset.asset.longitude}, latitude: ${cropAsset.asset.latitude}");
                    }
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
