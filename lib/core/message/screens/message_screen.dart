import 'package:flutter/material.dart';
import 'package:seeks_app_prototype/configs/size_config.dart';
import 'package:seeks_app_prototype/constants.dart';

class MessageScreen extends StatefulWidget {
  static String routeName = "message";
  const MessageScreen({Key? key}) : super(key: key);

  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      pages: [
        MaterialPage(
          child: Scaffold(
            appBar: appBar(),
            body: ListView(
              children: [
                VerticalSpacing(
                  of: 5,
                ),
                messageItem(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  messageItem() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: getProportionateScreenHeight(context, 100),
      color: colorBarWhite,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: getProportionateScreenHeight(context, 12),
          horizontal: getProportionateScreenWidth(context, 16),
        ),
        child: Row(
          children: [
            messageItemImage(),
            messageItemInfo(),
          ],
        ),
      ),
    );
  }

  messageItemImage() {
    return GestureDetector(
      onTap: () {},
      child: CircleAvatar(
        backgroundImage: AssetImage("assets/images/splash_1.jpg"),
        maxRadius: getProportionateScreenWidth(context, 50),
      ),
    );
  }

  messageItemInfo() {
    return Expanded(
      child: GestureDetector(
        onTap: () {},
        /* child: Container(
          color: Colors.amber,
        ), */
        child: Padding(
          padding: EdgeInsets.only(
            top: 5,
            bottom: 8,
            left: 8,
            right: 8,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "XXX",
                        style: TextStyle(
                          color: colorFont03,
                          fontWeight: FontWeight.bold,
                          fontSize: getProportionateScreenWidth(context, 16),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(context, 10),
                        ),
                        child: Icon(
                          Icons.volume_off,
                          size: getProportionateScreenWidth(context, 16),
                          color: colorFont03,
                        ),
                      )
                    ],
                  ),
                  Text(
                    "3分鐘前",
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      color: colorFont03,
                      fontSize: getProportionateScreenWidth(context, 12),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "安安你好 安安",
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      color: colorFont02,
                      fontSize: getProportionateScreenWidth(context, 14),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    // color: bgMainColor,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: bgMainColor,
                    ),
                    child: Text(
                      "2",
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  appBar() {
    return AppBar(
      elevation: 0.5,
      // backgroundColor: colorBarWhite,
      backgroundColor: Colors.white,
      title: Text(
        "聊天室",
        style: TextStyle(
          color: colorFont02,
          fontSize: getProportionateScreenWidth(context, 20),
        ),
      ),
    );
  }
}
