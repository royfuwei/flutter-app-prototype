import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:seeks_app_prototype/configs/size_config.dart';
import 'package:seeks_app_prototype/constants.dart';
import 'package:seeks_app_prototype/core/chat/pages/chat.page.dart';
import 'package:seeks_app_prototype/core/chat/widgets/chat_list_item.widget.dart';
import 'package:seeks_app_prototype/core/users/pages/user_info.page.dart';

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
                ChatListItemWidget(
                  endActionPaneChildren: [
                    SlidableAction(
                      onPressed: (_) {},
                      backgroundColor: Colors.grey,
                      foregroundColor: Colors.white,
                      // icon: Icons.delete,
                      label: '檢舉',
                    ),
                    SlidableAction(
                      onPressed: (_) {},
                      backgroundColor: Color(0xFFFE4A49),
                      foregroundColor: Colors.white,
                      // icon: Icons.delete,
                      label: '刪除',
                    ),
                  ],
                  startActionPaneChildren: [
                    SlidableAction(
                        onPressed: (_) {},
                        backgroundColor: Colors.green.shade100,
                        foregroundColor: Colors.white,
                        icon: Icons.push_pin
                        // label: '',
                        ),
                    SlidableAction(
                      onPressed: (_) {},
                      backgroundColor: Colors.green.shade200,
                      foregroundColor: Colors.white,
                      icon: Icons.volume_off,
                      // label: '刪除',
                    ),
                  ],
                  onPressed: () {
                    Get.to(ChatPage());
                  },
                  itemImageOnTap: () {
                    Get.to(UserInfoPage());
                  },
                ),
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
