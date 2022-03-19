import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:image_crop/image_crop.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:seeks_app_prototype/configs/size_config.dart';
import 'package:seeks_app_prototype/constants.dart';
import 'package:seeks_app_prototype/core/common/components/default_app_bar.dart';
import 'package:seeks_app_prototype/core/media/components/media_asset_selector.dart';
import 'package:extended_image/extended_image.dart';
import 'package:seeks_app_prototype/core/media/widgets/media_view_widget.dart';
import 'package:seeks_app_prototype/infrastructures/util/keep-alive-wrapper.dart';

class MediaGridSelector extends StatefulWidget {
  static String routeName = "media/cpt/grid_selector";
  const MediaGridSelector({Key? key}) : super(key: key);

  @override
  _MediaGridSelectorState createState() => _MediaGridSelectorState();
}

class _MediaGridSelectorState extends State<MediaGridSelector> {
  int currentPage = 0;
  int pageLength = 1;
  late AssetEntity selectAsset;
  List<AssetEntity> selectAssets = [];
  List<Widget> selectAssetWidgets = [];
  MediaAssetSelector mediaAssetSelector = new MediaAssetSelector();
  PageController _pageController = new PageController();

  @override
  Widget build(BuildContext context) {
    return Navigator(
      pages: [
        MaterialPage(
          name: MediaGridSelector.routeName,
          child: Scaffold(
            backgroundColor: Colors.black,
            // appBar: appBar(),
            body: body(),
          ),
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    _fetchGenBodyImage();
  }

  body() {
    return SafeArea(
      bottom: false,
      child: Container(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            bodyImage(),
            bodyGridViewNotification(),
          ],
        ),
      ),
    );
  }

  bodyImageTest() {
    return Container(
      height: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.grey,
        // borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Icon(
          Icons.image,
          size: getProportionateScreenWidth(context, 40),
        ),
      ),
    );
  }

  bodyImage() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width,
      color: colorIconHidden,
      // child: selectAssets.length == 0 ? bodyImageTest() : imageFilesSplash(),
      child: imageFilesSplash(),
    );
  }

  bodyGridViewNotification() {
    return NotificationListener<MediaAssetSelectorNotification>(
      onNotification: ((notification) {
        selectAsset = notification.selectAsset;
        if (notification.isSelectMulti &&
            notification.selectAssets.length != 0) {
          selectAssets = notification.selectAssets;
        } else {
          selectAssetWidgets = [];
          selectAssets = [notification.selectAsset];
        }
        _fetchGenBodyImage();
        return true;
      }),
      child: Expanded(
        child: mediaAssetSelector,
      ),
    );
  }

  _fetchGenBodyImage() {
    setState(() {
      _removeSelectAssetWidget();
      _addSelectAssetWidget();
      if (selectAssetWidgets.length > 1 && selectAsset != null) {
        Future.delayed(Duration(milliseconds: 100), () {
          var _assetKey = Key(selectAsset.id);
          var selectAssetWidgetKeys = selectAssetWidgets
              .map(
                (e) => e.key,
              )
              .toList();
          var page = selectAssetWidgetKeys.indexOf(_assetKey) >= 0
              ? selectAssetWidgetKeys.indexOf(_assetKey)
              : selectAssetWidgetKeys.length;
          _pageController.animateToPage(page,
              duration: Duration(milliseconds: 10), curve: Curves.easeIn);
        });
      }
    });
  }

  _removeSelectAssetWidget() {
    var selectAssetKeys = selectAssets
        .map(
          (e) => Key(e.id),
        )
        .toList();
    for (var selectAssetWidget in selectAssetWidgets) {
      Key? widgetKey = selectAssetWidget.key;
      bool hasWidget = selectAssetKeys.indexOf(widgetKey!) >= 0;
      if (!hasWidget) {
        if (selectAssetWidgets.length == 1) {
          setState(() {
            selectAssetWidgets = [];
          });
        } else {
          setState(() {
            selectAssetWidgets.remove(selectAssetWidget);
          });
        }
      }
    }
  }

  _addSelectAssetWidget() {
    var selectAssetWidgetKeys = selectAssetWidgets
        .map(
          (e) => e.key,
        )
        .toList();
    for (var selectAsset in selectAssets) {
      Key widgetKey = Key(selectAsset.id);
      bool hasWidget = selectAssetWidgetKeys.indexOf(widgetKey) >= 0;
      if (!hasWidget) {
        var _widget = KeepAliveWrapper(
          key: Key(selectAsset.id),
          child: new MediaViewWidget(
            asset: selectAsset,
          ),
        );
        setState(() {
          selectAssetWidgets.add(_widget);
        });
      }
    }
  }

  genBodyImage(AssetEntity asset) {
    return FutureBuilder(
      future: asset.originBytes,
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
  }

  imageFilesSplash() {
    return Expanded(
      child: Container(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: selectAssetWidgets.length,
                key: ObjectKey(selectAssetWidgets),
                // dragStartBehavior: DragStartBehavior.down,
                controller: _pageController,
                itemBuilder: (context, index) {
                  return selectAssetWidgets[index];
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(selectAssets.length, (index) {
                  if (selectAssets.length > 1) {
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

  bodyGridViewBuilder() {
    return Expanded(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          // 子 Widget 寬高比
          childAspectRatio: 1.0,
        ),
        itemCount: 100,
        itemBuilder: (BuildContext context, int index) {
          return ElevatedButton(
            onPressed: null,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                kPrimaryColor,
              ),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  side: BorderSide(
                    color: Colors.grey,
                    width: 0.2,
                  ),
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.image,
                  size: getProportionateScreenWidth(context, 40),
                ),
                Text(
                  "$index",
                  style: TextStyle(
                    color: colorIconHidden,
                    fontSize: getProportionateScreenWidth(
                      context,
                      20,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  bodySelecter() {
    return Container(
      color: Colors.black,
      padding: EdgeInsets.symmetric(
        horizontal: 10,
      ),
      height: getProportionateScreenWidth(context, 56),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          TextButton(
            onPressed: () {},
            child: Row(
              children: [
                Text(
                  "最近項目",
                  style: TextStyle(
                    color: colorIconHidden,
                    fontSize: getProportionateScreenWidth(context, 20),
                  ),
                ),
                Icon(
                  Icons.arrow_drop_down,
                  color: colorIconHidden,
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              children: [
                IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.camera_alt,
                    color: colorIconHidden,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  appBar() {
    return AppBar(
      // elevation: 0,
      // backgroundColor: Colors.white,
      backgroundColor: colorBarWhite,
      title: defaultExpandedAppBarTitle(
        startItems: [
          IconButton(
            onPressed: () {
              Navigator.pop(
                context,
              );
            },
            icon: Icon(
              Icons.close,
              // size: getProportionateScreenWidth(context, 30),
              color: colorFont02,
            ),
          ),
        ],
        titleItems: [
          Text(
            "新約會",
            style: TextStyle(
              color: colorFont02,
              fontSize: getProportionateScreenWidth(context, 20),
            ),
          ),
        ],
        endItems: [
          TextButton(
            onPressed: () {
              print('hihi');
            },
            child: Row(
              children: [
                isActivedButton(false, "下一步"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  isActivedButton(bool isRead, String text) {
    return TextButton(
      onPressed: isRead
          ? () {
              setState(() {
                // 目前沒有效果
                isRead = !isRead;
              });
            }
          : null,
      child: Row(
        children: [
          /* Icon(
            Icons.check,
            color: isRead ? Colors.green : colorFont03,
          ), */
          Text(
            text,
            style: TextStyle(
              color: isRead ? Colors.green : colorFont03,
              fontSize: getProportionateScreenWidth(context, 18),
            ),
          ),
        ],
      ),
    );
  }
}
