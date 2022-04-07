import 'dart:typed_data';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:seeks_app_prototype/domain/media.dart';

class MediaImageCropComponentNotification extends Notification {
  GlobalKey<ExtendedImageEditorState> editorKey;
  MediaImageCropComponentNotification({
    required this.editorKey,
  });
}

class MediaImageCropComponent extends StatefulWidget {
  final AssetEntity asset;
  final BoxShape shape;
  final double? cropAspectRatios;
  const MediaImageCropComponent({
    Key? key,
    this.shape: BoxShape.rectangle,
    this.cropAspectRatios: MediaAspectRatios.ratio1_1,
    required this.asset,
  }) : super(key: key);

  @override
  State<MediaImageCropComponent> createState() =>
      _MediaImageCropComponentState();
}

class _MediaImageCropComponentState extends State<MediaImageCropComponent>
    with WidgetsBindingObserver {
  GlobalKey<ExtendedImageEditorState> editorKey =
      GlobalKey<ExtendedImageEditorState>();

  Widget _widget = Container(
    color: Colors.black87,
  );

  @override
  Widget build(BuildContext context) {
    return _widget;
  }

  @override
  void initState() {
    super.initState();
    _widget = GestureDetector(
      key: widget.key,
      child: FutureBuilder(
        future: widget.asset.thumbDataWithSize(1200, 1200),
        builder: (BuildContext bc, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Container(
              color: Colors.black87,
              child: ExtendedImage.memory(
                snapshot.data! as Uint8List,
                fit: BoxFit.contain,
                extendedImageEditorKey: editorKey,
                mode: ExtendedImageMode.editor,
                shape: widget.shape,
                initEditorConfigHandler: (state) {
                  return EditorConfig(
                    cropLayerPainter: EditorCropLayerPainter(),
                    initCropRectType: InitCropRectType.layoutRect,
                    cropRectPadding: EdgeInsets.all(0),
                    cornerSize: Size(0, 0),
                    cornerColor: Colors.grey,
                    hitTestSize: 0.1,
                    cropAspectRatio: widget.cropAspectRatios,
                    editorMaskColorHandler: (bc, pointDown) {
                      return Colors.black.withOpacity(pointDown ? 0.4 : 0.8);
                    },
                    editActionDetailsIsChanged:
                        (EditActionDetails? editActionDetails) {
                      MediaImageCropComponentNotification(
                        editorKey: editorKey,
                      ).dispatch(context);
                    },
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
    initImageCropWidgetNotification();
  }

  initImageCropWidgetNotification() {
    Future.delayed(Duration(milliseconds: 100), () {
      if (editorKey.currentState != null) {
        MediaImageCropComponentNotification(
          editorKey: editorKey,
        ).dispatch(context);
      } else {
        initImageCropWidgetNotification();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance!.removeObserver(this);
    editorKey.currentState?.dispose();
  }
}
