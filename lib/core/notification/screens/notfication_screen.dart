import 'package:flutter/material.dart';
import 'package:seeks_flutter/configs/size_config.dart';
import 'package:seeks_flutter/constants.dart';
import 'package:seeks_flutter/core/common/components/default_app_bar.dart';
import 'package:seeks_flutter/core/notification/components/splash_data.dart';

class NotificationScreen extends StatefulWidget {
  static String routeName = "notification";
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final bool isRead = false;
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Navigator(
      pages: [
        MaterialPage(
          child: Scaffold(
            appBar: appBar(),
            body: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              // color: Colors.amber,
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width / 2.2,
                    color: colorBarWhite,
                    // alignment: Alignment.centerLeft,
                    child: messageBoard(),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.55,
                    // color: Colors.blue,
                    child: ListView(
                      children: [
                        VerticalSpacing(
                          of: 10,
                        ),
                        notificationItem(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  splashContent(String image) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  messageBoard() {
    return GestureDetector(
      onTap: () {},
      child: Expanded(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: getProportionateScreenHeight(context, 8),
            horizontal: getProportionateScreenWidth(context, 16),
          ),
          child: Container(
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
  }

  notificationItem() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: getProportionateScreenWidth(context, 100),
        color: colorBarWhite,
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: getProportionateScreenHeight(context, 8),
            horizontal: getProportionateScreenWidth(context, 16),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              notificationItemImage(),
              notificationItemInfo(),
            ],
          ),
        ),
      ),
    );
  }

  notificationItemImage() {
    return CircleAvatar(
      backgroundImage: AssetImage("assets/images/splash_1.jpg"),
      maxRadius: getProportionateScreenWidth(context, 50),
    );
  }

  notificationItemInfo() {
    return Expanded(
      /* child: Container(
        color: Colors.amber,
      ), */
      child: Padding(
        padding: EdgeInsets.only(
          top: 5,
          left: 8,
          right: 8,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("XXX 報名'一起讀書'的約會"),
            Text("3分鐘前"),
          ],
        ),
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
          fontSize: getProportionateScreenWidth(context, 24),
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
              fontSize: getProportionateScreenWidth(context, 18),
            ),
          ),
        ],
      ),
    );
  }
}
