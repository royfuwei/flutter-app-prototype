import 'dart:typed_data';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';

class MediaImageCropWidgetNotification extends Notification {
  GlobalKey<ExtendedImageEditorState> editorKey;
  MediaImageCropWidgetNotification({
    required this.editorKey,
  });
}

class ImageCropAspectRatios {
  /// no aspect ratio for crop
  static const Null custom = null;

  /// the same as aspect ratio of image
  /// [cropAspectRatio] is not more than 0.0, it's original
  static const double original = 0.0;

  /// ratio of width and height is 1 : 1
  static const double ratio1_1 = 1.0;

  /// ratio of width and height is 3 : 4
  static const double ratio3_4 = 3.0 / 4.0;

  /// ratio of width and height is 4 : 3
  static const double ratio4_3 = 4.0 / 3.0;

  /// ratio of width and height is 9 : 16
  static const double ratio9_16 = 9.0 / 16.0;

  /// ratio of width and height is 16 : 9
  static const double ratio16_9 = 16.0 / 9.0;
}

class MediaImageCropWidget extends StatefulWidget {
  final AssetEntity asset;
  final BoxShape shape;
  final double? cropAspectRatios;
  const MediaImageCropWidget({
    Key? key,
    this.shape: BoxShape.rectangle,
    this.cropAspectRatios: ImageCropAspectRatios.ratio1_1,
    required this.asset,
  }) : super(key: key);

  @override
  State<MediaImageCropWidget> createState() => _MediaImageCropWidgetState();
}

class _MediaImageCropWidgetState extends State<MediaImageCropWidget>
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
    print('${widget.asset.id}: A1. widget initState');
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
                      MediaImageCropWidgetNotification(
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
        MediaImageCropWidgetNotification(
          editorKey: editorKey,
        ).dispatch(context);
      } else {
        initImageCropWidgetNotification();
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // print("${widget.asset.id}:  A2. widget didChangeDependencies");
  }

  @override
  void didUpdateWidget(MediaImageCropWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    // print("${widget.asset.id}: A3. widget didUpdateWidget");
    // print("oldWidget: ${oldWidget}");
  }

  @override
  void reassemble() {
    super.reassemble();
    // print("${widget.asset.id}: D1. widget reassemble");
  }

  @override
  void deactivate() {
    super.deactivate();
    // print("${widget.asset.id}: Z1. widget deactivate");
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance!.removeObserver(this);
    // print("${widget.asset.id}: Z2. widget dispose");
    editorKey.currentState?.dispose();
  }
}
