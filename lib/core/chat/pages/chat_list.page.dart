import 'package:flutter/material.dart';
import 'package:seeks_app_prototype/configs/size_config.dart';
import 'package:seeks_app_prototype/constants.dart';
import 'package:seeks_app_prototype/core/chat/components/chat_list_body.dart';

class ChatListPage extends StatelessWidget {
  static String routeName = "/chat_list";
  const ChatListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      pages: [
        MaterialPage(
          child: Scaffold(
            appBar: appBar(context),
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
    return ChatListBodyComponent();
  }

  appBar(BuildContext context) {
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
