import 'package:flutter/material.dart';
import 'package:seeks_app_prototype/configs/size_config.dart';
import 'package:seeks_app_prototype/constants.dart';
import 'package:seeks_app_prototype/core/chat/components/chat_body.dart';
import 'package:seeks_app_prototype/core/common/components/default_app_bar.dart';

class ChatPage extends StatelessWidget {
  static String routeName = "/chat";
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: body(),
    );
  }

  body() {
    return ChatBodyComponent();
  }

  appBar(BuildContext context) {
    return AppBar(
      // backgroundColor: Colors.black,
      elevation: 0,
      leading: Container(),
      leadingWidth: 0,
      title: defaultExpandedAppBarTitle(
        startItems: [
          TextButton(
            onPressed: () {
              Navigator.pop(
                context,
              );
            },
            child: Icon(
              Icons.arrow_back_ios,
              // size: getProportionateScreenWidth(context, 30),
              color: colorFont02,
            ),
          ),
        ],
        titleItems: [
          appBarUserTitle(context, "Username", "正在線上"),
        ],
        endItems: [
          appBarMoreButton(),
        ],
      ),
    );
  }

  appBarMoreButton() {
    return Container(
      // color: Colors.blueGrey,
      child: TextButton(
        onPressed: () {},
        child: Row(
          children: [
            Icon(
              Icons.more_horiz,
              color: Colors.blue,
            )
          ],
        ),
      ),
    );
  }

  appBarUserTitle(BuildContext context, String name, status) {
    return Expanded(
      child: Container(
        // color: Colors.amber,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Icon(
                    Icons.circle,
                    size: getProportionateScreenWidth(context, 10),
                    color: Colors.green,
                  ),
                ),
                Text(
                  name,
                  style: TextStyle(
                      fontSize: getProportionateScreenWidth(context, 16)),
                ),
              ],
            ),
            Text(
              status,
              style: TextStyle(
                fontSize: getProportionateScreenWidth(context, 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
