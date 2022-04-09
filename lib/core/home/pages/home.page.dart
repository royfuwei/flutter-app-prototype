import 'dart:typed_data';

import 'package:card_swiper/card_swiper.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:seeks_app_prototype/configs/size_config.dart';
import 'package:seeks_app_prototype/constants.dart';
import 'package:seeks_app_prototype/core/common/components/default_app_bar.dart';
import 'package:seeks_app_prototype/core/dating/pages/dating_info.page.dart';
import 'package:seeks_app_prototype/core/dating/widgets/dating_list_item.widget.dart';
import 'package:seeks_app_prototype/core/dev/pages/dev_webview.dart';
import 'package:seeks_app_prototype/core/home/components/home_body.dart';
import 'package:seeks_app_prototype/core/home/controllers/home.controller.dart';
import 'package:seeks_app_prototype/core/media/pages/media_image_selector.page.dart';
import 'package:seeks_app_prototype/core/notification/components/splash_data.dart';
import 'package:seeks_app_prototype/infrastructures/util/keep_alive_wrapper.dart';

class DatingItemEntity {
  String username;
  Uint8List userImage;
  Uint8List coverImage;
  String title;
  DateTime startTime;
  DateTime endTime;
  int signupCount;
  int payment;
  String paymentType;

  DatingItemEntity({
    required this.username,
    required this.userImage,
    required this.coverImage,
    required this.title,
    required this.startTime,
    required this.endTime,
    required this.signupCount,
    required this.paymentType,
    required this.payment,
  });
}

class HomePage extends StatefulWidget {
  static String routeName = "/home";
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Navigator(
      pages: [
        MaterialPage(
          key: ValueKey(HomePage.routeName),
          name: HomePage.routeName,
          child: Scaffold(
            appBar: appBar(),
            // body: bodyOfListItem(),
            body: body(),
          ),
        ),
      ],
    );
  }

  body() {
    return HomeBodyComponent(
      scrollListener: homeController.scrollListener,
      onRefresh: homeController.sliverOnRefresh,
      datingItemList: homeController.datingItemList,
      enableCupertinoActivityIndicator:
          homeController.enableCupertinoActivityIndicator,
    );
  }

  appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      title: defaultAppBarTitle(startItems: [
        TextButton(
          onPressed: () {},
          style: ButtonStyle(),
          child: Row(
            children: [
              Text(
                "台灣",
                style: TextStyle(
                  color: colorFont02,
                  fontSize: getProportionateScreenWidth(context, 24),
                ),
              ),
              Icon(
                Icons.arrow_drop_down,
                color: colorFont02,
              )
            ],
          ),
        ),
      ], endItems: [
        appBarIconButton(Icons.map),
        // appBarIconButton(Icons.search),
        appBarIconButton(Icons.filter_list),
      ]),
    );
  }

  appBarIconButton(
    IconData icon, {
    Color color = colorFont02,
    void Function()? onPressed,
  }) {
    return IconButton(
      iconSize: getProportionateScreenWidth(context, 32),
      onPressed: onPressed,
      padding: EdgeInsets.all(0),
      icon: Icon(
        icon,
        color: color,
        size: getProportionateScreenWidth(context, 32),
      ),
    );
  }
}
