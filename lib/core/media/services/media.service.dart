import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:seeks_app_prototype/core/media/models/media_asset_image.dart';
import 'package:image/image.dart' as DartImageEdit;
import 'package:seeks_app_prototype/domain/media.dart';

class MediaService {
  cropCropAssets(List<CropAssetEntity> cropAssets, BoxShape shape) async {
    print("_cropCropAssets cropAssets.length: ${cropAssets.length}");
    List<CropImageInfoModel> temp = [];
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
      CropImageInfoModel cropImageInfoModel = new CropImageInfoModel(
        data: newData,
        id: asset.id,
        shape: shape,
      );
      temp.add(cropImageInfoModel);
    }
    return temp;
  }

  Future<Uint8List?> cropImageDataWithDartLibrary(
    AssetEntity asset,
    Rect cropRect,
    EditActionDetails editAction,
  ) async {
    print('dart library start cropping');

    print('getCropRect : $cropRect');

    // var data = await asset.thumbDataWithSize(1000, 1000);
    var data = await asset.originBytes;
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

  ImageProvider<Object> getImageProviderByType(
      ImageType imageType, dynamic image) {
    ImageProvider<Object> imageProvider = AssetImage("");
    switch (imageType) {
      case ImageType.ASSET:
        imageProvider = AssetImage(image);
        break;
      case ImageType.URL:
        imageProvider = CachedNetworkImageProvider(image);
        break;
      case ImageType.MEMORY:
        imageProvider = ExtendedImage.memory(image).image;
        break;
    }
    return imageProvider;
  }
}
