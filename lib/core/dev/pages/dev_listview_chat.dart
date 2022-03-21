import 'package:flutter/material.dart';

class DevListViewChat extends StatefulWidget {
  static String routeName = "/dev/listview/chat";
  const DevListViewChat({Key? key}) : super(key: key);

  @override
  _DevListViewChatState createState() => _DevListViewChatState();
}

class _DevListViewChatState extends State<DevListViewChat> {
  late Widget selector = Container();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  var messages = [
    ChatBubble(
      text: 'How was the concert?',
      isCurrentUser: false,
    ),
    ChatBubble(
      text: 'Awesome! Next time you gotta come as well!',
      isCurrentUser: true,
    ),
    ChatBubble(
      text: 'Ok, when is the next date?',
      isCurrentUser: false,
    ),
    ChatBubble(
      text: 'They\'re playing on the 20th of November',
      isCurrentUser: true,
    ),
    ChatBubble(
      text: 'Let\'s do it!',
      isCurrentUser: false,
    ),
  ];

  final listViewController = ScrollController();
  final textFieldController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      listViewController.jumpTo(listViewController.position.maxScrollExtent);
    });
  }

  getChatItemList() {
    return ListView.builder(
      controller: listViewController,
      itemCount: messages.length,
      // reverse: true,
      itemBuilder: (ctx, idx) {
        return messages[idx];
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text("list view msg"),
      ),
      // body: getChatItemList(),
      body: ListView(
        children: const [
          ChatBubble(
            text: 'How was the concert?',
            isCurrentUser: false,
          ),
          ChatBubble(
            text: 'Awesome! Next time you gotta come as well!',
            isCurrentUser: true,
          ),
          ChatBubble(
            text: 'Ok, when is the next date?',
            isCurrentUser: false,
          ),
          ChatBubble(
            text: 'They\'re playing on the 20th of November',
            isCurrentUser: true,
          ),
          ChatBubble(
            text: 'Let\'s do it!',
            isCurrentUser: false,
          ),
        ],
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final bool isCurrentUser;
  final String text;

  const ChatBubble({
    Key? key,
    required this.text,
    required this.isCurrentUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      // padding: EdgeInsets.symmetric(
      //   horizontal: 16,
      //   vertical: 8,
      // ),
      padding: EdgeInsets.fromLTRB(
        isCurrentUser ? 88.0 : 16.0,
        4,
        isCurrentUser ? 16.0 : 88.0,
        4,
      ),
      child: Align(
        alignment: isCurrentUser ? Alignment.centerRight : Alignment.centerLeft,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: isCurrentUser ? Colors.blue : Colors.grey[300],
            // borderRadius: BorderRadius.circular(16),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
              bottomLeft: isCurrentUser ? Radius.circular(16) : Radius.zero,
              bottomRight: isCurrentUser ? Radius.zero : Radius.circular(16),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(12),
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: isCurrentUser ? Colors.white : Colors.black87,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
