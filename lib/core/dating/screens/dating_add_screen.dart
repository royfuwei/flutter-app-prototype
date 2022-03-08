import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:seeks_app_prototype/configs/size_config.dart';
import 'package:seeks_app_prototype/constants.dart';
import 'package:seeks_app_prototype/core/common/components/default_app_bar.dart';
import 'package:seeks_app_prototype/core/media/components/media_asset_selector.dart';
import 'package:seeks_app_prototype/core/media/components/media_grid_selector.dart';

class DatingAddScreen extends StatefulWidget {
  static String routeName = "dating_add";
  const DatingAddScreen({Key? key}) : super(key: key);

  @override
  _DatingAddScreenState createState() => _DatingAddScreenState();
}

class _DatingAddScreenState extends State<DatingAddScreen> {
  int currentPage = 0;
  int pageLength = 1;
  List<AssetEntity> selectAssets = [];
  MediaAssetSelector mediaAssetSelector = new MediaAssetSelector();

  @override
  Widget build(BuildContext context) {
    return Navigator(
      pages: [
        MaterialPage(
          name: DatingAddScreen.routeName,
          child: Scaffold(
            appBar: appBar(),
            body: MediaGridSelector(),
          ),
        ),
      ],
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
