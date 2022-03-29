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
  @override
  Widget build(BuildContext context) {
    return Navigator(
      pages: [
        MaterialPage(
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
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: false,
          // pinned: true,
          expandedHeight: MediaQuery.of(context).size.width / 2.2,
          flexibleSpace: FlexibleSpaceBar(
            // title: Text("CustomScrollView"),
            /* background: Image.asset(
              "assets/logo/seeks_logo.png",
              fit: BoxFit.cover,
            ), */
            background: messageBoard(),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((ctx, idx) {
            return DatingListItem(
              onPressed: () {
                Get.to(() => DatingInfoPage());
              },
            );
          }, childCount: 10),
        )
      ],
    );
  }

  bodyOfListItem() {
    return SafeArea(
      child: Container(
        child: ListView(
          children: [
            DatingListItem(
              onPressed: () {
                Get.to(() => DatingInfoPage());
              },
            ),
          ],
        ),
        // child: SingleChildScrollView(),
      ),
    );
  }

  messageBoard() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width / 2.2,
      color: colorBarWhite,
      child: messageBoardSwiper(),
    );
  }

  messageBoardSwiper() {
    return Swiper(
      itemBuilder: (BuildContext context, int index) {
        return KeepAliveWrapper(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage("${splashData[index]["image"]}"),
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
      layout: SwiperLayout.DEFAULT,
      scale: 0.8,
      autoplay: true,
      itemCount: splashData.length,
      duration: 2000,
      autoplayDelay: 10000,
      // itemWidth: MediaQuery.of(context).size.width * .9,
      pagination: SwiperPagination(
        builder: DotSwiperPaginationBuilder(
          color: Colors.grey,
          activeColor: Colors.white,
          activeSize: 8,
          size: 5,
        ),
      ),
      control: SwiperControl(color: Colors.transparent),
      onTap: (index) {
        var text = splashData[index]["text"];
        print("onTap ${text}");
        // _webviewUrl();
        Get.to(() => DevWebView());
      },
    );
  }

  appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      // actions: [Text("hihi")],
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
        appBarIconButton(Icons.location_on),
        appBarIconButton(Icons.search),
        appBarIconButton(Icons.filter_list),
      ]),
    );
  }

  appBarIconButton(
    IconData icon, {
    Color color = colorFont02,
  }) {
    return IconButton(
      iconSize: getProportionateScreenWidth(context, 32),
      onPressed: () {},
      padding: EdgeInsets.all(0),
      icon: Icon(
        icon,
        color: color,
        size: getProportionateScreenWidth(context, 32),
      ),
    );
  }
}
