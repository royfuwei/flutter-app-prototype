import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:seeks_app_prototype/domain/media.dart';

ImageProvider<Object> getImageProviderByType(
    ImageType imageType, String image) {
  ImageProvider<Object> imageProvider = AssetImage("");
  switch (imageType) {
    case ImageType.ASSET:
      imageProvider = AssetImage(image);
      break;
    case ImageType.URL:
      imageProvider = CachedNetworkImageProvider(image);
      break;
  }
  return imageProvider;
}
