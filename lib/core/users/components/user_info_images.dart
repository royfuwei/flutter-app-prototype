import 'package:flutter/material.dart';
import 'package:seeks_app_prototype/core/media/components/media_image.component.dart';
import 'package:seeks_app_prototype/core/media/widgets/media_images_viewer.widget.dart';
import 'package:seeks_app_prototype/domain/user.dart';

class UserInfoImagesComponent extends StatelessWidget {
  const UserInfoImagesComponent({
    Key? key,
    this.items = const [],
  }) : super(key: key);

  final List<UserInfoImageEntity> items;

  @override
  Widget build(BuildContext context) {
    return body(context);
  }

  body(BuildContext context) {
    return bodyUserImages(context);
  }

  bodyUserImages(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width,
      child: MediaImagesViewerWidget(
        images: List.generate(
          items.length,
          (index) => getImageByImageType(items[index]),
        ),
      ),
    );
  }

  getImageByImageType(UserInfoImageEntity item) {
    return getImageProviderByType(item.imageType, item.image);
  }
}
