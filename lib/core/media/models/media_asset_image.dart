import 'dart:typed_data';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';

class CropImageInfoModel {
  final String id;
  final BoxShape shape;
  Uint8List data;
  // final File file;
  CropImageInfoModel({
    required this.id,
    required this.shape,
    required this.data,
    // required this.file,
  });
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
