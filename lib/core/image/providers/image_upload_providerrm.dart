import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seeks_app_prototype/core/image/pages/image_upload.page.dart';
import 'package:seeks_app_prototype/core/media/providers/media_image_selector_provider.dart';

class ImageUploadProvider extends StatelessWidget {
  static String routeName = "/image/upload_provider";
  const ImageUploadProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MediaImageSelectorProvider(),
        ),
      ],
      child: ImageUploadPage(),
    );
  }
}
