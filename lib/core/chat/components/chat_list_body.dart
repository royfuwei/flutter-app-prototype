import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seeks_app_prototype/core/announcement/widgets/search.widget.dart';
import 'package:seeks_app_prototype/core/chat/components/chat_list_scrollview.dart';
import 'package:seeks_app_prototype/core/chat/controllers/chat_list.controller.dart';

class ChatListBodyComponent extends StatefulWidget {
  const ChatListBodyComponent({Key? key}) : super(key: key);

  @override
  State<ChatListBodyComponent> createState() => _ChatListBodyComponentState();
}

class _ChatListBodyComponentState extends State<ChatListBodyComponent> {
  FocusNode focusNode = FocusNode();
  ChatListController chatListController = Get.put(ChatListController());

  @override
  Widget build(BuildContext context) {
    return body(context, chatListController);
  }

  body(BuildContext context, ChatListController chatListController) {
    return GestureDetector(
      onTap: () {
        if (focusNode.hasFocus) focusNode.unfocus();
      },
      child: Container(
        child: Column(
          children: [
            bodyTopSearchBar(),
            Expanded(
              child: bodySliverScrollView(),
            ),
          ],
        ),
      ),
    );
  }

  bodyTopSearchBar() {
    return commonSearchBarWidget(
      context: context,
      focusNode: focusNode,
    );
  }

  bodySliverScrollView() {
    return Obx(
      () => ChatListScrollViewComponent(
        items: chatListController.chatItemList,
        chatItemImageOnPressed: chatListController.chatItemImageOnPressed,
        chatItemOnPressed: chatListController.chatItemOnPressed,
        onRefresh: chatListController.onRefresh,
      ),
    );
  }
}
