import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seeks_app_prototype/core/chat/components/chat_body.dart';
import 'package:seeks_app_prototype/core/chat/controllers/chat.controller.dart';
import 'package:seeks_app_prototype/core/common/widgets/appbar.widget.dart';

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
    ChatController chatController = Get.put(ChatController());
    return AppBarWidget(
      startItems: [
        appBarBackButton(
          context: context,
          icon: Icons.arrow_back_ios,
        ),
      ],
      titleItems: [
        Obx(
          () => appBarUserTitle(
            context: context,
            name: chatController.username,
            status: chatController.userStatus,
            isOnline: chatController.userIsOnline,
            onPressed: chatController.appBarUserTitleOnPressed,
          ),
        ),
      ],
      endItems: [
        appBarIconButton(
          context: context,
          icon: Icons.more_horiz,
        ),
        // appBarMoreButton(),
      ],
    );
  }
}
