import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seeks_app_prototype/core/chat/widgets/chat_bubble.widget.dart';
import 'package:seeks_app_prototype/domain/chat.dart';

class ChatController extends GetxController {
  Rx<List<ChatBubbleWidget>> _chatBubbleWidgetList = Rx<List<ChatBubbleWidget>>(
    [
      ChatBubbleWidget(
        text: 'How was the concert?',
        isCurrentUser: false,
      ),
      ChatBubbleWidget(
        text: 'Awesome! Next time you gotta come as well!',
        isCurrentUser: true,
      ),
      ChatBubbleWidget(
        text: 'Ok, when is the next date?',
        isCurrentUser: false,
      ),
      ChatBubbleWidget(
        text: 'They\'re playing on the 20th of November',
        isCurrentUser: true,
      ),
      ChatBubbleWidget(
        text: 'Let\'s do it!',
        isCurrentUser: false,
      ),
    ],
  );

  set chatBubbleWidgetList(value) => _chatBubbleWidgetList.value = value;
  List<ChatBubbleWidget> get chatBubbleWidgetList =>
      _chatBubbleWidgetList.value;

  Rx<List<ChatBubbleEntity>> _chatBubbleList = Rx<List<ChatBubbleEntity>>(
    [
      ChatBubbleEntity(
        id: "01",
        message: 'How was the concert?',
        isCurrentUser: false,
      ),
      ChatBubbleEntity(
        id: "02",
        message: 'Awesome! Next time you gotta come as well!',
        isCurrentUser: true,
      ),
      ChatBubbleEntity(
        id: "03",
        message: 'Ok, when is the next date?',
        isCurrentUser: false,
      ),
      ChatBubbleEntity(
        id: "04",
        message: 'They\'re playing on the 20th of November',
        isCurrentUser: true,
      ),
      ChatBubbleEntity(
        id: "05",
        message: 'Let\'s do it!',
        isCurrentUser: false,
      ),
    ],
  );

  set chatBubbleList(value) => _chatBubbleList.value = value;
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
    textEditingController.selection = TextSelection.fromPosition(
      TextPosition(
        offset: textEditingController.text.length,
      ),
    );
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
          milliseconds: 400,
        ),
        () {
          scrollController.animateTo(
            scrollController.position.maxScrollExtent + 10,
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
      var chatBubbleWidget = ChatBubbleWidget(
        isCurrentUser: true,
        text: text,
      );
      var chatBubble = ChatBubbleEntity(
        id: "00",
        isCurrentUser: true,
        message: text,
      );
      chatBubbleList.add(chatBubble);

      textEditingController.clear();
      scrollController.jumpTo(scrollController.position.maxScrollExtent);
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

  Future<void> scrollOnRefresh() async {}
}
