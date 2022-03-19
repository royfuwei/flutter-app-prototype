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
import 'package:seeks_app_prototype/infrastructures/util/keep-alive-wrapper.dart';

class MediaGridSelectorCropNotification extends Notification {
  List<CropAssetEntity> cropAssets = [];
  MediaGridSelectorCropNotification({
    required this.cropAssets,
  });
}

class MediaGridSelectorCrop extends StatefulWidget {
  static String routeName = "media/cpt/grid_selector_crop";
  final BoxShape shape;
  final double? cropAspectRatios;
  const MediaGridSelectorCrop({
    Key? key,
    this.shape: BoxShape.rectangle,
    this.cropAspectRatios: ImageCropAspectRatios.ratio1_1,
  }) : super(key: key);

  @override
  _MediaGridSelectorCropState createState() => _MediaGridSelectorCropState();
}

class CropAssetEntity {
  AssetEntity asset;
  EditActionDetails? editAction;
  Rect? cropRect;

  CropAssetEntity({
    required this.asset,
    this.editAction,
    this.cropRect,
  });
}

class CropAssetWidgetEntity extends CropAssetEntity {
  bool isRemove;
  AssetEntity asset;
  Widget widget;
  CropAssetWidgetEntity({
    required this.isRemove,
    required this.asset,
    required this.widget,
  }) : super(
          asset: asset,
        );

  getData() {
    return CropAssetEntity(
      asset: this.asset,
    );
  }
}

class _MediaGridSelectorCropState extends State<MediaGridSelectorCrop> {
  List<AssetEntity> notifySelectAssets = [];
  List<CropAssetWidgetEntity> tempCropAssetWidgets = [];
  List<CropAssetEntity> cropAssets = [];
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
        bool isDispatchNotify = false;
        if (notification.selectAssets.length < cropAssets.length) {
          isDispatchNotify = true;
        }
        _updateNotifySelectAssets(notification);
        _getCropAssetsByNotifySelectAssets(notification);
        _notifySelectAssetWidget(notification);
        print(
            "bodyGridViewNotification cropAssets.length: ${cropAssets.length}");
        print(
            "bodyGridViewNotification notifySelectAssets.length: ${notifySelectAssets.length}");
        if (isDispatchNotify == true) {
          MediaGridSelectorCropNotification(
            cropAssets: cropAssets,
          ).dispatch(context);
        }
        return true;
      }),
      child: Expanded(
        child: mediaAssetSelector,
      ),
    );
  }

  cropAssetWidgetNotification(AssetEntity asset) {
    return NotificationListener<MediaImageCropWidgetNotification>(
      onNotification: (notification) {
        var getCropRect = notification.editorKey.currentState!.getCropRect();
        var editAction = notification.editorKey.currentState!.editAction;
        _updateCropAssetsByCropper(asset, getCropRect, editAction);
        print(
            "cropAssetWidgetNotification cropAssets.length: ${cropAssets.length}");
        print(
            "cropAssetWidgetNotification notifySelectAssets.length: ${notifySelectAssets.length}");
        MediaGridSelectorCropNotification(
          cropAssets: cropAssets,
        ).dispatch(context);
        return true;
      },
      child: KeepAliveWrapper(
        child: MediaImageCropWidget(
          asset: asset,
          key: Key(asset.id),
          shape: widget.shape,
          cropAspectRatios: widget.cropAspectRatios,
        ),
      ),
    );
  }

  _notifySelectAssetWidget(MediaAssetSelectorNotification notification) {
    if (!notification.isSelectMulti) {
      tempCropAssetWidgets = [];
    }
    var _selectAsset = notification.selectAsset;
    var notifySelectAssetIds = notifySelectAssets.map((e) => e.id).toList();
    for (var _cropAssetWidget in tempCropAssetWidgets) {
      var tempCropAssetWidgetId = _cropAssetWidget.asset.id;
      var notifySelectAssetIdx =
          notifySelectAssetIds.indexOf(tempCropAssetWidgetId);
      if (notifySelectAssetIdx < 0) {
        var _idx = tempCropAssetWidgets.indexOf(_cropAssetWidget);
        var _widget = Container(
          color: Colors.black87,
        );
        _cropAssetWidget.isRemove = true;
        _cropAssetWidget.widget = _widget;
        tempCropAssetWidgets[_idx] = _cropAssetWidget;
      }
    }

    var tempCropAssetWidgetIds =
        tempCropAssetWidgets.map((e) => e.asset.id).toList();
    for (var _asset in notifySelectAssets) {
      var notifySelectAssetId = _asset.id;
      var tempCropAssetWidgetIdx =
          tempCropAssetWidgetIds.indexOf(notifySelectAssetId);
      if (tempCropAssetWidgetIdx < 0) {
        var _widget = cropAssetWidgetNotification(_asset);
        var _newCropAssetWidget = new CropAssetWidgetEntity(
            asset: _asset, widget: _widget, isRemove: false);
        tempCropAssetWidgets.add(_newCropAssetWidget);
      } else {
        var tempCropAssetWidget = tempCropAssetWidgets[tempCropAssetWidgetIdx];
        if (tempCropAssetWidget.isRemove) {
          var _widget = cropAssetWidgetNotification(_asset);
          tempCropAssetWidget.isRemove = false;
          tempCropAssetWidget.widget = _widget;
          tempCropAssetWidgets[tempCropAssetWidgetIdx] = tempCropAssetWidget;
        }
      }
    }

    var pageWidgetIds = tempCropAssetWidgets.map((e) => e.asset.id).toList();
    var selectPageIdx = pageWidgetIds.indexOf(_selectAsset.id);

    setState(() {
      _pageController.animateToPage(
        selectPageIdx,
        duration: Duration(milliseconds: 10),
        curve: Curves.easeIn,
      );
    });
  }

  _updateNotifySelectAssets(MediaAssetSelectorNotification notification) {
    notifySelectAssets = [];
    if (notification.selectAssets.length == 0) {
      notifySelectAssets.add(notification.selectAsset);
    } else {
      notifySelectAssets.addAll(notification.selectAssets);
    }
  }

  _updateCropAssetsByCropper(
      AssetEntity asset, Rect? getCropRect, EditActionDetails? editAction) {
    var _cropAssetIds = cropAssets.map((e) => e.asset.id).toList();
    var _cropAssetIdx = _cropAssetIds.indexOf(asset.id);
    if (_cropAssetIdx >= 0) {
      cropAssets[_cropAssetIdx].cropRect = getCropRect;
      cropAssets[_cropAssetIdx].editAction = editAction;
    }
  }

  _getCropAssetsByNotifySelectAssets(
      MediaAssetSelectorNotification notification) {
    if (!notification.isSelectMulti) {
      cropAssets = [];
    }
    List<CropAssetEntity> temp = [];
    if (cropAssets.length > notifySelectAssets.length) {
      // 減少
      var _selectAssetIds = notifySelectAssets.map((e) => e.id).toList();
      for (var cropAsset in cropAssets) {
        var cropAssetId = cropAsset.asset.id;
        if (_selectAssetIds.indexOf(cropAssetId) >= 0) {
          temp.add(cropAsset);
        }
      }
    } else {
      // 增加
      temp = cropAssets;
      var cropAssetIds = cropAssets.map((e) => e.asset.id).toList();
      for (var notifySelectAsset in notifySelectAssets) {
        var notifySelectAssetId = notifySelectAsset.id;
        if (cropAssetIds.indexOf(notifySelectAssetId) < 0) {
          var cropAsset = CropAssetEntity(asset: notifySelectAsset);
          temp.add(cropAsset);
        }
      }
    }
    cropAssets = temp;
  }

  imageCropper() {
    return Expanded(
      child: Container(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Expanded(
              child: PageView.builder(
                physics: NeverScrollableScrollPhysics(),
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
}
