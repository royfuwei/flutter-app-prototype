import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:seeks_app_prototype/configs/size_config.dart';
import 'package:seeks_app_prototype/constants.dart';
import 'package:seeks_app_prototype/core/dev/pages/dev_webview.dart';
import 'package:seeks_app_prototype/core/notification/components/splash_data.dart';
import 'package:seeks_app_prototype/core/notification/widgets/notifi_list_item.widget.dart';
import 'package:seeks_app_prototype/infrastructures/util/keep_alive_wrapper.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NotificationPage extends StatefulWidget {
  static String routeName = "/notification";
  const NotificationPage({Key? key}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  final bool isRead = false;
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Navigator(
      pages: [
        MaterialPage(
          child: Scaffold(
            appBar: appBar(),
            body: body(),
          ),
        ),
      ],
    );
    /* return Scaffold(
      appBar: appBar(),
      body: body(),
    ); */
  }

  body() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      // color: Colors.amber,
      child: Column(
        children: [
          messageBoard(),
          Expanded(
            child: bodyNotifiListView(),
          ),
        ],
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

  bodyNotifiListView() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: ListView(
        children: [
          NotifiListItem(
            key: Key("2"),
            startActionPaneChildren: [
              SlidableAction(
                onPressed: (_) {},
                backgroundColor: Colors.grey,
                foregroundColor: Colors.white,
                icon: Icons.archive,
                label: '封存',
              ),
            ],
            endActionPaneChildren: [
              SlidableAction(
                onPressed: (_) {},
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                // icon: Icons.delete,
                label: '已讀',
              ),
            ],
          ),
        ],
      ),
    );
  }

  appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      title: Text(
        "通知",
        style: TextStyle(
          color: colorFont02,
          fontSize: getProportionateScreenWidth(context, 20),
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(
            context,
            16,
          )),
          child: isReadButton(isRead),
        ),
        // VerticalSpacing(
        //   of: 10,
        // ),
      ],
    );
  }

  isReadButton(bool isRead) {
    return TextButton(
      onPressed: () {
        setState(() {
          // 目前沒有效果
          isRead = !isRead;
        });
      },
      style: ButtonStyle(
        padding: MaterialStateProperty.all(EdgeInsets.zero),
      ),
      child: Row(
        children: [
          Icon(
            Icons.check,
            color: isRead ? Colors.green : colorFont03,
          ),
          Text(
            "已讀",
            style: TextStyle(
              color: isRead ? Colors.green : colorFont03,
              fontSize: getProportionateScreenWidth(context, 16),
            ),
          ),
        ],
      ),
    );
  }

  /* splashContent(String image) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  messageBoard() {
    return GestureDetector(
      onTap: () {},
      child: Expanded(
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: getProportionateScreenHeight(context, 8),
            horizontal: getProportionateScreenWidth(context, 16),
          ),
          child: Column(
            children: [
              Expanded(
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
                        itemCount: splashData.length,
                        itemBuilder: (context, index) =>
                            splashContent("${splashData[index]["image"]}"),
                      )),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            splashData.length,
                            (index) => buildDot(index: index),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        // color: currentPage == index ? kPrimaryColor : Color(0xFFD8D8D8),
        color: Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  } */
}
