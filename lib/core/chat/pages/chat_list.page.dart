import 'package:flutter/material.dart';
import 'package:seeks_app_prototype/configs/size_config.dart';
import 'package:seeks_app_prototype/constants.dart';
import 'package:seeks_app_prototype/core/chat/widgets/chat_list_item.widget.dart';

class ChatListPage extends StatefulWidget {
  static String routeName = "/chat_list";
  const ChatListPage({Key? key}) : super(key: key);

  @override
  _ChatListPageState createState() => _ChatListPageState();
}

class _ChatListPageState extends State<ChatListPage> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      pages: [
        MaterialPage(
          child: Scaffold(
            appBar: appBar(),
            body: ListView(
              children: [
                ChatListItemWidget(),
              ],
            ),
          ),
        ),
      ],
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
