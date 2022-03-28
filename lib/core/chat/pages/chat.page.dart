import 'package:flutter/material.dart';
import 'package:seeks_app_prototype/configs/size_config.dart';
import 'package:seeks_app_prototype/constants.dart';
import 'package:seeks_app_prototype/core/chat/widgets/chat_bubble.widget.dart';
import 'package:seeks_app_prototype/core/common/components/default_app_bar.dart';

class ChatPage extends StatefulWidget {
  static String routeName = "/chat";
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  FocusNode focusNode = FocusNode();
  TextEditingController textEditingController = TextEditingController();
  ScrollController scrollController = new ScrollController();

  var messages = [
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
  ];
  CrossAxisAlignment bottomSideAlignment = CrossAxisAlignment.center;

  double unfocusTextFieldMaxHeight = 36;
  double focusTextFieldMaxHeight = (16 + 8) * 6 * .9;

  late double textFieldMaxHeight = unfocusTextFieldMaxHeight;

  @override
  void initState() {
    super.initState();
    /* scrollController.addListener(() {
      print(scrollController.offset);
    }); */
    textEditingController.addListener(() {
      textEditingController.selection = TextSelection.fromPosition(
        TextPosition(
          offset: textEditingController.text.length,
        ),
      );
    });
    focusNode.addListener(() async {
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
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: body(),
    );
  }

  body() {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          focusNode.unfocus();
          bottomSideAlignmentCenter();
        },
        child: Container(
          color: Colors.amber[100],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              bodyChatListView(),
              bodyChatBottomSide(),
            ],
          ),
        ),
      ),
    );
  }

  bodyChatListView() {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(
          top: 8,
        ),
        child: ListView.builder(
          physics: AlwaysScrollableScrollPhysics(),
          controller: scrollController,
          itemCount: messages.length,
          itemBuilder: (bc, idx) {
            return messages[idx];
          },
        ),
      ),
    );
  }

  bottomSideAlignmentCenter() {
    setState(() {
      bottomSideAlignment = CrossAxisAlignment.center;
      textFieldMaxHeight = unfocusTextFieldMaxHeight;
    });
  }

  bottomSideAlignmentEnd() {
    setState(() {
      bottomSideAlignment = CrossAxisAlignment.end;
      textFieldMaxHeight = focusTextFieldMaxHeight;
    });
  }

  bodyChatBottomSide() {
    return Align(
      alignment: Alignment.center,
      child: Container(
        padding: EdgeInsets.only(left: 10, bottom: 5, top: 5, right: 10),
        width: double.infinity,
        color: Colors.white,
        child: Row(
          crossAxisAlignment: bottomSideAlignment,
          children: <Widget>[
            bodyChatBottomIconButton(
              icon: Icon(
                Icons.add,
                color: Colors.blue,
                size: getProportionateScreenHeight(context, 34),
              ),
              onPressed: () {
                focusNode.unfocus();
                bottomSideAlignmentCenter();
              },
            ),
            bodyChatBottomTextField(),
            bodyChatBottomIconButton(
              icon: Icon(
                Icons.send,
                color: Colors.blue,
                size: getProportionateScreenHeight(context, 34),
              ),
              onPressed: () {
                sendChat();
                bottomSideAlignmentCenter();
              },
            ),
          ],
        ),
      ),
    );
  }

  sendChat() {
    focusNode.unfocus();
    print("textEditingController.text: ${textEditingController.text}");
    if (textEditingController.text.isNotEmpty) {
      var text = textEditingController.text;
      print("sendChat text: ${text}");
      var chatBubble = ChatBubbleWidget(
        isCurrentUser: true,
        text: text,
      );
      messages.add(chatBubble);
      textEditingController.clear();
      setState(() {});
      scrollController.jumpTo(scrollController.position.maxScrollExtent);
    }
  }

  bodyChatBottomIconButton({Icon? icon, void Function()? onPressed}) {
    return Container(
      height: 40,
      child: TextButton(
        onPressed: onPressed,
        child: icon != null
            ? icon
            : Icon(
                Icons.send,
                color: Colors.blue,
                size: getProportionateScreenHeight(context, 40),
              ),
      ),
    );
  }

  bodyChatBottomTextField() {
    return Expanded(
      child: Container(
        constraints: BoxConstraints(
          minHeight: 36,
          maxHeight: textFieldMaxHeight,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 5,
        ),
        child: TextField(
          controller: textEditingController,
          maxLines: null,
          focusNode: focusNode,
          textInputAction: TextInputAction.newline,
          decoration: InputDecoration(
            isDense: true,
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.grey),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: Colors.grey),
            ),
            hintText: "輸入訊息",
            hintStyle: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
            contentPadding: EdgeInsets.only(
              left: 16,
              top: 8,
              bottom: 8,
              right: 16,
            ),
          ),
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  appBar() {
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
              Icons.close,
              // size: getProportionateScreenWidth(context, 30),
              color: colorFont02,
            ),
          ),
        ],
        titleItems: [
          appBarUserTitle("Username", "正在線上"),
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

  appBarUserTitle(String name, status) {
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
