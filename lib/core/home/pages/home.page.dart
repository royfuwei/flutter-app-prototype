import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seeks_app_prototype/configs/size_config.dart';
import 'package:seeks_app_prototype/constants.dart';
import 'package:seeks_app_prototype/core/common/components/default_app_bar.dart';
import 'package:seeks_app_prototype/core/home/components/home_body.dart';
import 'package:seeks_app_prototype/core/home/controllers/home.controller.dart';

class HomePage extends StatelessWidget {
  static String routeName = "/home";
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      pages: [
        MaterialPage(
          key: ValueKey(HomePage.routeName),
          name: HomePage.routeName,
          child: Scaffold(
            appBar: appBar(context),
            // body: bodyOfListItem(),
            body: body(context),
          ),
        ),
      ],
    );
  }

  body(BuildContext context) {
    /* HomeController homeController = Get.put(HomeController());
    return Obx(
      () => HomeBodyComponent(
        scrollListener: homeController.scrollListener,
        onRefresh: homeController.sliverOnRefresh,
        items: homeController.datingItemList,
        enableCupertinoActivityIndicator:
            homeController.enableCupertinoActivityIndicator,
      ),
    ); */
    return HomeBodyComponent();
  }

  appBar(BuildContext context) {
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
        appBarIconButton(context, Icons.map),
        // appBarIconButton(Icons.search),
        appBarIconButton(context, Icons.filter_list),
      ]),
    );
  }

  appBarIconButton(
    BuildContext context,
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
