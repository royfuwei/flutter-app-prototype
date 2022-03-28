import 'package:flutter/material.dart';
import 'package:seeks_app_prototype/configs/size_config.dart';
import 'package:seeks_app_prototype/constants.dart';

class ChatListItemWidget extends StatelessWidget {
  static String routeName = "/chat_list_item_widget";
  const ChatListItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: body(context),
    );
  }

  body(BuildContext context) {
    return chatListItem(context);
  }

  chatListItem(BuildContext context) {
    return TextButton(
      onPressed: () {
        print("body");
      },
      child: Container(
        padding: EdgeInsets.only(left: 8, top: 8, bottom: 8, right: 8),
        color: Colors.grey.shade100,
        alignment: Alignment.center,
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.width / 4,
        ),
        child: Row(
          children: [
            chatItemUserImage(context),
            Expanded(
              child: chatItemInfo(context),
            ),
          ],
        ),
      ),
    );
  }

  chatItemUserImage(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("chatItemUserImage");
      },
      child: CircleAvatar(
        backgroundImage: AssetImage("assets/images/splash_1.jpg"),
        maxRadius: getProportionateScreenWidth(context, 50),
      ),
    );
  }

  chatItemInfo(BuildContext context) {
    return Container(
      // color: Colors.amber.shade100,
      child: Row(
        children: [
          Expanded(
            child: chatItemInfoStart(context),
          ),
          chatItemInfoEnd(context),
        ],
      ),
    );
  }

  chatItemInfoStart(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 8, top: 8, left: 4, right: 8),
      // color: Colors.amber.shade100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          chatItemInfoTitle(context),
          chatItemInfoContent(context),
          // Container(),
        ],
      ),
    );
  }

  chatItemInfoTitle(BuildContext context) {
    return Container(
      child: Row(
        children: [
          chatItemInfoTitleName(context),
          chatItemInfoTitleStatus(context),
        ],
      ),
    );
  }

  chatItemInfoTitleName(BuildContext context) {
    return Container(
      child: Text(
        "XXX",
        style: TextStyle(
          color: colorFont03,
          fontWeight: FontWeight.bold,
          fontSize: getProportionateScreenWidth(context, 16),
        ),
      ),
    );
  }

  chatItemInfoTitleStatus(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(context, 10),
            ),
            child: Icon(
              Icons.volume_off,
              size: getProportionateScreenWidth(context, 16),
              color: colorFont03,
            ),
          ),
        ],
      ),
    );
  }

  chatItemInfoContent(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Text(
        "安安你好 安安你好安安你好安安你好安安你好安安你好 安安你好... ",
        textAlign: TextAlign.start,
        style: TextStyle(
          color: colorFont02,
          fontSize: getProportionateScreenWidth(context, 14),
        ),
      ),
    );
  }

  chatItemInfoEnd(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 8, right: 4),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          chatItemInfoEndTime(context),
          chatItemInfoEndUnReadCount(context),
          Container(),
        ],
      ),
    );
  }

  chatItemInfoEndTime(BuildContext context) {
    return Container(
      child: Text(
        "3分鐘前",
        textAlign: TextAlign.end,
        style: TextStyle(
          color: colorFont03,
          fontSize: getProportionateScreenWidth(context, 12),
        ),
      ),
    );
  }

  chatItemInfoEndUnReadCount(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 10,
      ),
      // color: bgMainColor,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.green,
      ),
      child: Text(
        "999+",
        style: TextStyle(
          fontSize: 12,
          color: Colors.white,
        ),
      ),
    );
  }
}
