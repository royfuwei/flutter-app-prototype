import 'dart:typed_data';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:seeks_app_prototype/configs/size_config.dart';
import 'package:seeks_app_prototype/constants.dart';
import 'package:seeks_app_prototype/infrastructures/util/keep_alive_wrapper.dart';

class ImagesViewerWidget extends StatefulWidget {
  static String routeName = "/widget/images_viewer";
  const ImagesViewerWidget({
    Key? key,
    this.images,
  }) : super(key: key);
  final List<ImageProvider<Object>>? images;

  @override
  State<ImagesViewerWidget> createState() => _ImagesViewerWidgetState();
}

class _ImagesViewerWidgetState extends State<ImagesViewerWidget> {
  int currentPage = 0;
  List<Widget> imageWidgets = [];
  List<ImageProvider<Object>> images = [];
  PageController _pageController = new PageController();

  @override
  void initState() {
    super.initState();
    asyncInitState();
  }

  asyncInitState() async {
    images = (widget.images != null ? widget.images : [])!;
    for (var image in images) {
      var _widget = genBodyImage(image);
      imageWidgets.add(_widget);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.width,
          color: Colors.grey,
          child: imageWidgets.length == 0
              ? Center(
                  child: Icon(
                    Icons.image,
                    color: Colors.black,
                    size: getProportionateScreenWidth(context, 40),
                  ),
                )
              : imagesViewerSide(),
        ),
      ),
    );
  }

  AnimatedContainer buildDot(int? index) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }

  genBodyImage(ImageProvider<Object> image) {
    return KeepAliveWrapper(
      child: Container(
        color: Colors.black87,
        child: ExtendedImage(
          image: image,
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
      ),
    );
  }
  /* genBodyImageByByte(Future<Uint8List> image) {
    return FutureBuilder(
      future: image,
      builder: (BuildContext context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Container(
            color: Colors.black87,
            child: ExtendedImage(
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
  } */

  imagesViewerSide() {
    return Expanded(
      child: Container(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Expanded(
              child: PageView.builder(
                physics: ClampingScrollPhysics(),
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: imageWidgets.length,
                key: ObjectKey(imageWidgets),
                controller: _pageController,
                itemBuilder: (context, index) {
                  return imageWidgets[index];
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(images.length, (index) {
                  if (images.length > 1) {
                    return buildDot(index);
                  } else {
                    return Container();
                  }
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
