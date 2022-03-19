import 'dart:typed_data';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';

class MediaViewWidget extends StatefulWidget {
  final AssetEntity asset;
  const MediaViewWidget({
    Key? key,
    required this.asset,
  }) : super(key: key);

  @override
  State<MediaViewWidget> createState() => _MediaViewWidgetState();
}

class _MediaViewWidgetState extends State<MediaViewWidget>
    with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget.asset.originBytes,
      builder: (BuildContext context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Container(
            color: Colors.black87,
            child: ExtendedImage(
              key: UniqueKey(),
              image: Image.memory(
                snapshot.data! as Uint8List,
              ).image,
              fit: BoxFit.contain,
              mode: ExtendedImageMode.gesture,
              initGestureConfigHandler: (state) {
                return GestureConfig(
                  minScale: 1.0,
                  animationMinScale: 0.7,
                  maxScale: 50.0,
                  animationMaxScale: 50.0,
                  speed: 1.0,
                  inertialSpeed: 100.0,
                  initialScale: 1.0,
                  inPageView: false,
                  initialAlignment: InitialAlignment.center,
                );
              },
            ),
          );
        }
        return Container(
          color: Colors.black87,
        );
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // print('${widget.asset.id}: A1. widget initState');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // print("${widget.asset.id}:  A2. widget didChangeDependencies");
  }

  @override
  void didUpdateWidget(MediaViewWidget oldWidget) {
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
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
