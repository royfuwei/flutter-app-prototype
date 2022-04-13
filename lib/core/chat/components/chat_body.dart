import 'dart:io';

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seeks_app_prototype/core/chat/components/chat_bubble_scrollview.dart';
import 'package:seeks_app_prototype/core/chat/components/chat_text_field.dart';
import 'package:seeks_app_prototype/core/chat/controllers/chat.controller.dart';

class ChatBodyComponent extends StatefulWidget {
  const ChatBodyComponent({Key? key}) : super(key: key);

  @override
  State<ChatBodyComponent> createState() => _ChatBodyComponentState();
}

class _ChatBodyComponentState extends State<ChatBodyComponent> {
  FocusNode focusNode = FocusNode();
  TextEditingController textEditingController = TextEditingController();
  ScrollController scrollController = new ScrollController();

  ChatController chatController = Get.put(ChatController());

  @override
  void initState() {
    super.initState();
    textEditingController.addListener(
      () => chatController.textEditingListener(
        focusNode: focusNode,
        textEditingController: textEditingController,
        scrollController: scrollController,
      ),
    );
    focusNode.addListener(
      () async => chatController.focusNodeListener(
        focusNode: focusNode,
        textEditingController: textEditingController,
        scrollController: scrollController,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return body();
  }

  body() {
    return SafeArea(
      child: GestureDetector(
        onTap: () => chatController.areaOnTap(focusNode),
        child: Container(
          color: Colors.amber[100],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: bodyChatListView(),
              ),
              bodyChatBottomSide(),
              // bodyEmojiPickerSide(),
            ],
          ),
        ),
      ),
    );
  }

  bodyChatListView() {
    return Obx(
      () => ChatBubbleScrollViewComponent(
        items: chatController.chatBubbleList,
        scrollController: scrollController,
        onRefresh: chatController.scrollOnRefresh,
        scrollListener: (_) async {
          await chatController.scrollListener(
            focusNode: focusNode,
            scrollController: scrollController,
            textEditingController: textEditingController,
          );
        },
      ),
    );
  }

  bodyEmojiPickerSide() {
    return Obx(
      () => Offstage(
        offstage: !chatController.emojiShowing,
        child: SizedBox(
          height: 250,
          child: EmojiPicker(
            onEmojiSelected: (Category category, Emoji emoji) {
              chatController.onEmojiSelected(
                emoji: emoji,
                focusNode: focusNode,
                textEditingController: textEditingController,
                scrollController: scrollController,
              );
            },
            onBackspacePressed: chatController.onBackspacePressed(
              focusNode: focusNode,
              textEditingController: textEditingController,
              scrollController: scrollController,
            ),
            config: Config(
              columns: 7,
              // Issue: https://github.com/flutter/flutter/issues/28894
              emojiSizeMax: 32 * (Platform.isIOS ? 1.30 : 1.0),
              verticalSpacing: 0,
              horizontalSpacing: 0,
              initCategory: Category.RECENT,
              bgColor: const Color(0xFFF2F2F2),
              indicatorColor: Colors.blue,
              iconColor: Colors.grey,
              iconColorSelected: Colors.blue,
              progressIndicatorColor: Colors.blue,
              backspaceColor: Colors.blue,
              skinToneDialogBgColor: Colors.white,
              skinToneIndicatorColor: Colors.grey,
              enableSkinTones: true,
              showRecentsTab: true,
              recentsLimit: 28,
              noRecentsText: 'No Recents',
              tabIndicatorAnimDuration: kTabScrollDuration,
              categoryIcons: const CategoryIcons(),
              buttonMode: ButtonMode.MATERIAL,
            ),
          ),
        ),
      ),
    );
  }

  bodyChatBottomSide() {
    return Obx(
      () => ChatTextFieldComponent(
        bottomSideAlignment: chatController.bottomSideAlignment,
        textFieldMaxHeight: chatController.textFieldMaxHeight,
        textEditingController: textEditingController,
        focusNode: focusNode,
        sendOnPressed: () => chatController.sendOnPressed(
          focusNode: focusNode,
          textEditingController: textEditingController,
          scrollController: scrollController,
        ),
        addOnPressed: () => chatController.addOnPressed(
          focusNode: focusNode,
          textEditingController: textEditingController,
          scrollController: scrollController,
        ),
        emojiOnPressed: () => chatController.emojiOnPressed(
          focusNode: focusNode,
          textEditingController: textEditingController,
          scrollController: scrollController,
        ),
      ),
    );
  }
}
