import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_crop/image_crop.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:seeks_app_prototype/configs/size_config.dart';
import 'package:seeks_app_prototype/constants.dart';
import 'package:seeks_app_prototype/core/common/components/default_app_bar.dart';
import 'package:seeks_app_prototype/core/media/components/media_asset_selector.dart';
import 'package:extended_image/extended_image.dart';
import 'package:seeks_app_prototype/core/media/widgets/media_image_crop_widget.dart';

class MediaGridSelectorCrop extends StatefulWidget {
  static String routeName = "media/cpt/grid_selector_crop";
  const MediaGridSelectorCrop({Key? key}) : super(key: key);

  @override
  _MediaGridSelectorCropState createState() => _MediaGridSelectorCropState();
}

class CropAssetEntity {
  AssetEntity asset;
  Rect? cropRect;

  CropAssetEntity({
    required this.asset,
    this.cropRect,
  });
}

class CropAssetWidgetEntity extends CropAssetEntity {
  AssetEntity asset;
  Widget widget;
  Rect? cropRect;
  CropAssetWidgetEntity({
    required this.asset,
    required this.widget,
    this.cropRect,
  }) : super(
          asset: asset,
          cropRect: cropRect,
        );

  getData() {
    return CropAssetEntity(
      asset: this.asset,
      cropRect: this.cropRect,
    );
  }
}

class _MediaGridSelectorCropState extends State<MediaGridSelectorCrop> {
  int currentPage = 0;
  int pageLength = 1;
  List<AssetEntity> notifySelectAssets = [];
  List<CropAssetWidgetEntity> tempCropAssetWidgets = [];
  List<CropAssetEntity> cropAsset = [];
  MediaAssetSelector mediaAssetSelector = new MediaAssetSelector();
  PageController _pageController = new PageController();

  GlobalKey<ExtendedImageEditorState> editorKey =
      GlobalKey<ExtendedImageEditorState>();

  @override
  Widget build(BuildContext context) {
    return Navigator(
      pages: [
        MaterialPage(
          name: MediaGridSelectorCrop.routeName,
          child: Scaffold(
            backgroundColor: Colors.black,
            body: body(),
          ),
        ),
      ],
    );
  }

  body() {
    return SafeArea(
      bottom: false,
      child: Container(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            bodyImageCropper(),
            bodyGridViewNotification(),
          ],
        ),
      ),
    );
  }

  bodyImageCropper() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width,
      color: colorIconHidden,
      child: imageCropper(),
    );
  }

  bodyGridViewNotification() {
    return NotificationListener<MediaAssetSelectorNotification>(
      onNotification: ((notification) {
        _notifySelectAssetWidget(notification);
        return true;
      }),
      child: Expanded(
        child: mediaAssetSelector,
      ),
    );
  }

  _notifySelectAssetWidget(MediaAssetSelectorNotification notification) {
    setState(() {
      if (!notification.isSelectMulti) {
        tempCropAssetWidgets = [];
      }
      notifySelectAssets = [];
      var _selectAsset = notification.selectAsset;

      if (notification.selectAssets.length == 0) {
        notifySelectAssets.add(notification.selectAsset);
      } else {
        notifySelectAssets.addAll(notification.selectAssets);
      }

      if (tempCropAssetWidgets.length > notifySelectAssets.length) {
        var _selectAssetIds = notifySelectAssets.map((e) => e.id).toList();
        // 減少
        for (var tempCropAssetWidget in tempCropAssetWidgets) {
          var _asset = tempCropAssetWidget.asset;
          var _id = _asset.id;
          if (_selectAssetIds.indexOf(_id) < 0) {
            var _idx = tempCropAssetWidgets.indexOf(tempCropAssetWidget);
            var _widget = new MediaImageCropWidget(
              asset: _asset,
              key: Key(_asset.id),
            );
            tempCropAssetWidget.widget = _widget;
            tempCropAssetWidgets[_idx] = tempCropAssetWidget;
          }
        }
      } else {
        // 增加
        for (var _asset in notifySelectAssets) {
          var _tempCropAssetWidgetIds =
              tempCropAssetWidgets.map((e) => e.asset.id).toList();
          var _tempCropAssetWidgetIdx =
              _tempCropAssetWidgetIds.indexOf(_asset.id);
          if (_tempCropAssetWidgetIdx < 0) {
            var _widget = new MediaImageCropWidget(
              asset: _asset,
              key: Key(_asset.id),
            );
            var _tempCropAssetWidgetIdx =
                new CropAssetWidgetEntity(asset: _asset, widget: _widget);
            tempCropAssetWidgets.add(_tempCropAssetWidgetIdx);
          }
        }
      }
      var tempCropAssetWidgetIds =
          tempCropAssetWidgets.map((e) => e.asset.id).toList();
      var selectTempIdx = tempCropAssetWidgetIds.indexOf(_selectAsset.id);
      _pageController.animateToPage(
        selectTempIdx,
        duration: Duration(milliseconds: 10),
        curve: Curves.easeIn,
      );
    });
  }

  imageCropper() {
    return Expanded(
      child: Container(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            /* Expanded(
              child: PageView.builder(
                physics: NeverScrollableScrollPhysics(),
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: tempWidgets.length,
                controller: _pageController,
                itemBuilder: (context, index) {
                  return tempWidgets[index];
                },
              ),
            ), */
            Expanded(
              child: PageView.builder(
                physics: NeverScrollableScrollPhysics(),
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: tempCropAssetWidgets.length,
                controller: _pageController,
                itemBuilder: (context, index) {
                  return tempCropAssetWidgets[index].widget;
                },
              ),
            ),
            // imageCropperStackIcon(),
          ],
        ),
      ),
    );
  }

  imageCropperStackIcon() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        TextButton(
          onPressed: () {},
          style: ButtonStyle(
            padding: MaterialStateProperty.all(
              EdgeInsets.only(right: 2, left: 5),
            ),
          ),
          child: Container(
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: Colors.black45,
              shape: BoxShape.circle,
              border: Border.all(
                color: colorIconHidden,
              ),
            ),
            child: Icon(
              Icons.crop_free_outlined,
              color: colorIconHidden,
              size: getProportionateScreenWidth(context, 20),
            ),
          ),
        ),
      ]),
    );
  }

  AnimatedContainer buildDot(int? index) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
