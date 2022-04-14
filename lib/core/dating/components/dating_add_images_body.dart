import 'package:flutter/material.dart';
import 'package:seeks_app_prototype/core/media/components/media_grid_selector.dart';
import 'package:seeks_app_prototype/core/media/components/media_grid_selector_crop.dart';

class DatingAddImageBodyComponent extends StatelessWidget {
  const DatingAddImageBodyComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return body(context);
  }

  body(BuildContext context) {
    return MediaGridSelectorCrop();
  }
}
