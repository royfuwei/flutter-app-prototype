import 'dart:typed_data';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';

class MediaImageCropWidgetNotification extends Notification {
  final Rect cropRect;
  MediaImageCropWidgetNotification({required this.cropRect});
}

class MediaImageCropWidget extends StatefulWidget {
  final AssetEntity asset;
  const MediaImageCropWidget({
    Key? key,
    required this.asset,
  }) : super(key: key);

  @override
  State<MediaImageCropWidget> createState() => _MediaImageCropWidgetState();
}

class _MediaImageCropWidgetState extends State<MediaImageCropWidget>
    with WidgetsBindingObserver, AutomaticKeepAliveClientMixin {
  GlobalKey<ExtendedImageEditorState> editorKey =
      GlobalKey<ExtendedImageEditorState>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: Key(widget.asset.id),
      child: FutureBuilder(
        future: widget.asset.originBytes,
        builder: (BuildContext bc, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Container(
              color: Colors.black87,
              child: ExtendedImage.memory(
                snapshot.data! as Uint8List,
                fit: BoxFit.contain,
                extendedImageEditorKey: editorKey,
                mode: ExtendedImageMode.editor,
                shape: BoxShape.circle,
                initEditorConfigHandler: (state) {
                  return EditorConfig(
                    cropLayerPainter: EditorCropLayerPainter(),
                    initCropRectType: InitCropRectType.layoutRect,
                    cropRectPadding: EdgeInsets.all(0),
                    cornerSize: Size(0, 0),
                    cornerColor: Colors.grey,
                    hitTestSize: 0.1,
                    cropAspectRatio: 1,
                    editorMaskColorHandler: (bc, pointDown) {
                      return Colors.black.withOpacity(pointDown ? 0.4 : 0.8);
                    },
                    editActionDetailsIsChanged:
                        (EditActionDetails? editActionDetails) {
                      var getCropRect = editorKey.currentState!.getCropRect();
                      MediaImageCropWidgetNotification(cropRect: getCropRect!)
                          .dispatch(context);
                      // print("widget.asset.id: ${widget.asset.id}");
                      // print("getCropRect: ${getCropRect}");
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
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('${widget.asset.id}: A1. widget initState');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("${widget.asset.id}:  A2. widget didChangeDependencies");
  }

  @override
  void didUpdateWidget(MediaImageCropWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("${widget.asset.id}: A3. widget didUpdateWidget");
    print("oldWidget: ${oldWidget}");
  }

  @override
  void reassemble() {
    super.reassemble();
    print("${widget.asset.id}: D1. widget reassemble");
  }

  @override
  void deactivate() {
    super.deactivate();
    print("${widget.asset.id}: Z1. widget deactivate");
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance!.removeObserver(this);
    print("${widget.asset.id}: Z2. widget dispose");
    editorKey.currentState?.dispose();
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
