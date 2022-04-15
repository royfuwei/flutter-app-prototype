import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:seeks_app_prototype/core/chat/pages/chat.page.dart';
import 'package:seeks_app_prototype/core/chat/services/chat.service.dart';
import 'package:seeks_app_prototype/core/main/pages/main.page.dart';
import 'package:seeks_app_prototype/core/users/controllers/user_controller.dart';
import 'package:seeks_app_prototype/core/users/services/user.service.dart';
import 'package:seeks_app_prototype/domain/chat.dart';
import 'package:seeks_app_prototype/infrastructures/util/getx_routes.dart';

class ChatController extends GetxController {
  ChatService chatService = ChatService();
  UserService userService = UserService();
  String chatId = "chat001";
  String userId = "001";
  bool isInit = false;
  bool isInitScroll = false;

  initScrollToMax(ScrollController scrollController) {
    if (isInit && !isInitScroll) {
      Future.delayed(
        Duration(
          milliseconds: 10,
        ),
        () {
          scrollController.jumpTo(
            scrollController.position.maxScrollExtent,
          );
        },
      );
      // scrollController.jumpTo(
      //   scrollController.position.maxScrollExtent + 10,
      // );
      isInitScroll = true;
    }
  }

  Rx<String> _username = Rx<String>("username");
  set username(String value) => _username.value = value;
  String get username => _username.value;

  Rx<String> _userStatus = Rx<String>("正在線上");
  set userStatus(String value) => _userStatus.value = value;
  String get userStatus => _userStatus.value;

  Rx<bool> _userIsOnline = Rx<bool>(true);
  set userIsOnline(bool value) => _userIsOnline.value = value;
  bool get userIsOnline => _userIsOnline.value;

  Rx<List<ChatBubbleEntity>> _chatBubbleList = Rx<List<ChatBubbleEntity>>([]);
  set chatBubbleList(List<ChatBubbleEntity> value) =>
      _chatBubbleList.value = value;
  List<ChatBubbleEntity> get chatBubbleList => _chatBubbleList.value;

  double unfocusTextFieldMaxHeight = 36;
  double focusTextFieldMaxHeight = (16 + 8) * 6 * .9;
  Rx<double> _textFieldMaxHeight = Rx<double>(36);
  set textFieldMaxHeight(value) => _textFieldMaxHeight.value = value;
  double get textFieldMaxHeight => _textFieldMaxHeight.value;

  Rx<CrossAxisAlignment> _bottomSideAlignment =
      Rx<CrossAxisAlignment>(CrossAxisAlignment.center);
  set bottomSideAlignment(value) => _bottomSideAlignment.value = value;
  CrossAxisAlignment get bottomSideAlignment => _bottomSideAlignment.value;

  Rx<bool> _emojiShowing = Rx<bool>(false);
  set emojiShowing(value) => _emojiShowing.value = value;
  bool get emojiShowing => _emojiShowing.value;

  bottomSideAlignmentEnd() {
    bottomSideAlignment = CrossAxisAlignment.end;
    textFieldMaxHeight = focusTextFieldMaxHeight;
  }

  bottomSideAlignmentCenter() {
    bottomSideAlignment = CrossAxisAlignment.center;
    textFieldMaxHeight = unfocusTextFieldMaxHeight;
  }

  Future<void> textEditingListener({
    required FocusNode focusNode,
    required TextEditingController textEditingController,
    required ScrollController scrollController,
  }) async {
    if (bottomSideAlignment == CrossAxisAlignment.center) {
      textEditingController.selection = TextSelection.fromPosition(
        TextPosition(
          offset: textEditingController.text.length,
        ),
      );
    }
  }

  Future<void> focusNodeListener({
    required FocusNode focusNode,
    required TextEditingController textEditingController,
    required ScrollController scrollController,
  }) async {
    if (focusNode.hasFocus) {
      bottomSideAlignmentEnd();
      Future.delayed(
        Duration(
          milliseconds: 500,
        ),
        () {
          scrollController.animateTo(
            scrollController.position.maxScrollExtent + 10,
            // 0,
            duration: Duration(milliseconds: 100),
            curve: Curves.easeIn,
          );
        },
      );
    } else {
      bottomSideAlignmentCenter();
    }
  }

  Future<void> scrollListener({
    required FocusNode focusNode,
    required TextEditingController textEditingController,
    required ScrollController scrollController,
  }) async {}

  sendChat({
    required FocusNode focusNode,
    required TextEditingController textEditingController,
    required ScrollController scrollController,
  }) {
    focusNode.unfocus();
    print("textEditingController.text: ${textEditingController.text}");
    if (textEditingController.text.isNotEmpty) {
      var text = textEditingController.text;
      print("sendChat text: ${text}");
      var chatBubble = ChatBubbleEntity(
        id: "00",
        isCurrentUser: true,
        message: text,
      );
      chatBubbleList.add(chatBubble);
      // chatBubbleList.insert(0, chatBubble);

      textEditingController.clear();
      scrollController.jumpTo(scrollController.position.maxScrollExtent);
      // scrollController.jumpTo(0);
    }
  }

  areaOnTap(FocusNode focusNode) {
    if (focusNode.hasFocus) {
      focusNode.unfocus();
      bottomSideAlignmentCenter();
    }
  }

  sendOnPressed({
    required FocusNode focusNode,
    required TextEditingController textEditingController,
    required ScrollController scrollController,
  }) {
    sendChat(
      focusNode: focusNode,
      textEditingController: textEditingController,
      scrollController: scrollController,
    );
    bottomSideAlignmentCenter();
  }

  addOnPressed({
    required FocusNode focusNode,
    required TextEditingController textEditingController,
    required ScrollController scrollController,
  }) {
    if (focusNode.hasFocus) focusNode.unfocus();
    bottomSideAlignmentCenter();
  }

  emojiOnPressed({
    required FocusNode focusNode,
    required TextEditingController textEditingController,
    required ScrollController scrollController,
  }) {
    focusNode.unfocus();
    print("before emojiShowing: ${emojiShowing}");
    emojiShowing = !emojiShowing;
    print("after emojiShowing: ${emojiShowing}");
  }

  onEmojiSelected({
    required Emoji emoji,
    required FocusNode focusNode,
    required TextEditingController textEditingController,
    required ScrollController scrollController,
  }) {
    textEditingController
      ..text += emoji.emoji
      ..selection = TextSelection.fromPosition(
        TextPosition(
          offset: textEditingController.text.length,
        ),
      );
  }

  onBackspacePressed({
    required FocusNode focusNode,
    required TextEditingController textEditingController,
    required ScrollController scrollController,
  }) {
    print("onBackspacePressed");
    textEditingController
      ..text = textEditingController.text.characters.skipLast(1).toString()
      ..selection = TextSelection.fromPosition(
        TextPosition(
          offset: textEditingController.text.length,
        ),
      );
  }

  appBarUserTitleOnPressed() {
    UserController userController = Get.put(UserController());
    print("appBarUserTitleOnPressed userId: ${userId}");
    userController.goPageByDatingId(userId);
  }

  Future<void> scrollOnRefresh(RefreshController refreshController) async {
    print(
      "Future<void> scrollOnRefresh(RefreshController refreshController) async",
    );
    refreshController.refreshCompleted();
  }

  goPageByChatId(String id) async {
    chatId = id;
    print("goPageByChatId id: ${id}, before chatId: ${chatId}");
    chatBubbleList = await chatService.getChatBubbleListById(chatId);
    var chatItem = await chatService.getChatItemById(chatId);
    print("goPageByChatId chatItem.userId: ${chatItem.userId}");
    var userInfo = await userService.getUserInfoById(chatItem.userId!);
    print("goPageByDatingId userInfo.username: ${userInfo.username}");
    username = userInfo.username;
    userId = userInfo.id;
    isInitScroll = false;
    toRoutesNamed([MainPage.routeName, ChatPage.routeName]);
  }

  onInitChatBubbleList() async {
    print(
      "onInitChatBubbleList before chatBubbleList.length: ${chatBubbleList.length}",
    );
    chatBubbleList = await chatService.getChatBubbleListById(chatId);
    print(
      "onInitChatBubbleList after chatBubbleList.length: ${chatBubbleList.length}",
    );
  }

  @override
  void onInit() async {
    await onInitChatBubbleList();
    isInit = true;
    super.onInit();
  }
}
