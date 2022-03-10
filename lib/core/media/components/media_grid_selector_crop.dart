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

class MediaGridSelectorCrop extends StatefulWidget {
  static String routeName = "media/cpt/grid_selector_crop";
  const MediaGridSelectorCrop({Key? key}) : super(key: key);

  @override
  _MediaGridSelectorCropState createState() => _MediaGridSelectorCropState();
}

class CropAssetEntity {
  String id;
  AssetEntity asset;
  Uint8List? rawImageData;

  CropAssetEntity({
    required this.id,
    required this.asset,
    this.rawImageData,
  });
}

class CropAssetWidgetEntity extends CropAssetEntity {
  String id;
  AssetEntity asset;
  Widget widget;
  Uint8List? rawImageData;
  CropAssetWidgetEntity({
    required this.id,
    required this.asset,
    required this.widget,
    this.rawImageData,
  }) : super(
          id: id,
          asset: asset,
          rawImageData: rawImageData,
        );

  getData() {
    return CropAssetEntity(
      id: this.id,
      asset: this.asset,
      rawImageData: this.rawImageData,
    );
  }
}

class _MediaGridSelectorCropState extends State<MediaGridSelectorCrop> {
  int currentPage = 0;
  int pageLength = 1;
  List<AssetEntity> notifySelectAssets = [];
  // List<AssetEntity> selectAssets = [];
  List<CropAssetWidgetEntity> selectCropAssetWidgets = [];
  List<CropAssetWidgetEntity> cropAssetWidgets = [];
  MediaAssetSelector mediaAssetSelector = new MediaAssetSelector();

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
      child: imageFilesSplash(),
    );
  }

  bodyGridViewNotification() {
    return NotificationListener<MediaAssetSelectorNotification>(
      onNotification: ((notification) {
        _notifySelectAssetWidget(notification);
        setState(() {
          notifySelectAssets = [notification.selectAsset];
          // notifySelectAssets = notification.notifySelectAssets;
        });
        return true;
      }),
      child: Expanded(
        child: mediaAssetSelector,
      ),
    );
  }

  _notifySelectAssetWidget(MediaAssetSelectorNotification notification) {
    List<AssetEntity> thisNotifySelectAssets = [];
    if (notification.selectAssets.isEmpty) {
      thisNotifySelectAssets.add(notification.selectAsset);
    } else {
      thisNotifySelectAssets.addAll(notification.selectAssets);
    }
    var cropAssetIds = cropAssetWidgets.map((e) => e.id).toList();
    List<CropAssetWidgetEntity> temp = [];
    for (var asset in thisNotifySelectAssets) {
      var cropAssetIdx = cropAssetIds.indexOf(asset.id);
      var existCropAsset = cropAssetIdx >= 0;
      CropAssetWidgetEntity _cropAssetWidget;
      if (existCropAsset) {
        _cropAssetWidget = cropAssetWidgets[cropAssetIdx];
      } else {
        var newCropAssetWidget = CropAssetWidgetEntity(
          id: asset.id,
          asset: asset,
          widget: Container(),
        );
        _cropAssetWidget = genCropAssetWedget(newCropAssetWidget);
      }
      temp.add(genCropAssetWedget(_cropAssetWidget));
    }
    cropAssetWidgets = temp;
    _updateSelectCropAssets(notification.selectAsset);
  }

  _updateSelectCropAssets(AssetEntity selectAsset) {
    var cropAssetWidgetIds = cropAssetWidgets.map((e) => e.id).toList();
    var cropAssetWidgetIdx = cropAssetWidgetIds.indexOf(selectAsset.id);
    var cropAssetWidget = cropAssetWidgets[cropAssetWidgetIdx];
    var selectCropAssetWidgetIds =
        selectCropAssetWidgets.map((e) => e.id).toList();
    if (selectCropAssetWidgetIds.indexOf(cropAssetWidget.id) < 0) {
      setState(() {
        selectCropAssetWidgets = [cropAssetWidget];
      });
    }
  }

  genCropAssetWedget(CropAssetWidgetEntity cropAsset) {
    var imageByte = cropAsset.asset.originBytes;
    var _widget = GestureDetector(
      child: FutureBuilder(
        future: imageByte,
        builder: (BuildContext context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Container(
              color: Colors.black87,
              child: ExtendedImage.memory(
                cropAsset.rawImageData != null
                    ? cropAsset.rawImageData as Uint8List
                    : snapshot.data! as Uint8List,
                fit: BoxFit.contain,
                extendedImageEditorKey: editorKey,
                mode: ExtendedImageMode.editor,
                shape: BoxShape.circle,
                initEditorConfigHandler: (state) {
                  return EditorConfig(
                    initCropRectType: InitCropRectType.layoutRect,
                    cropRectPadding: EdgeInsets.all(0),
                    cornerSize: Size(0, 0),
                    cornerColor: Colors.grey,
                    hitTestSize: 0.1,
                    cropAspectRatio: 1,
                    editorMaskColorHandler: (bc, pointDown) {
                      return Colors.black.withOpacity(pointDown ? 0.4 : 0.8);
                    },
                    // lineColor: Colors.black.withOpacity(0.8),
                  );
                },
              ),
            );
          }
          return Container(
            color: Colors.black87,
          );
        },
      ),
    );
    cropAsset.widget = _widget;
    // var rawImageData = editorKey.currentState?.rawImageData;
    // print("rawImageData: ${rawImageData}");
    return cropAsset;
  }

  imageFilesSplash() {
    return Expanded(
      child: Container(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: selectCropAssetWidgets.length,
                itemBuilder: (context, index) {
                  CropAssetWidgetEntity selectCropAssetWidget =
                      selectCropAssetWidgets[index];
                  return selectCropAssetWidget.widget;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(notifySelectAssets.length, (index) {
                  if (notifySelectAssets.length > 1) {
                    return buildDot(index);
                  } else {
                    return Container();
                  }
                }),
              ),
            ),
          ],
        ),
      ),
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
