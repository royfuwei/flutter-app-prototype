import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seeks_flutter/configs/size_config.dart';
import 'package:seeks_flutter/constants.dart';

class DevListViewMsg extends StatefulWidget {
  static String routeName = "dev/listview/msg";
  const DevListViewMsg({Key? key}) : super(key: key);

  @override
  _DevListViewMsgState createState() => _DevListViewMsgState();
}

class _DevListViewMsgState extends State<DevListViewMsg> {
  late Widget selector = Container();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  var messages = [];

  final listViewController = ScrollController();
  final textFieldController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      listViewController.jumpTo(listViewController.position.maxScrollExtent);
    });
  }

  getMsgList() {
    return ListView.builder(
      controller: listViewController,
      itemCount: messages.length,
      reverse: true,
      itemBuilder: (ctx, idx) {
        return MessageTitle("${messages[idx]}");
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
      body: Column(
        children: [
          Expanded(
            child: getMsgList(),
          ),
          Container(
            color: Colors.grey,
            padding: EdgeInsets.only(
              top: 5,
              bottom: 25,
              left: 10,
              right: 10,
            ),
            child: textFieldSide(context),
          )
        ],
      ),
    );
  }

  textFieldSide(BuildContext context) {
    return Container(
      /* padding: EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 5,
      ), */
      width: double.infinity,
      height: getProportionateScreenHeight(context, 48),
      child: Card(
        elevation: 0.0,
        color: kPrimaryColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(5.0),
          ),
        ), //设置圆角
        child: TextField(
          controller: textFieldController,
          // keyboardType: keyboardType,
          // textInputAction: textInputAction,
          // textAlign: textAlign,
          onTap: () {
            listViewController
                .jumpTo(listViewController.position.maxScrollExtent); //為何無效??
          },
          onSubmitted: (text) {
            textFieldController.clear(); //放到setState裡反而不會清掉??
            setState(() {
              if (text.length > 0) {
                messages.insert(0, text);
              }
              listViewController
                  .jumpTo(listViewController.position.maxScrollExtent);
            });
          },
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: "輸入訊息",
            hintStyle: TextStyle(
              fontSize: getProportionateScreenWidth(
                context,
                18,
              ),
              color: Colors.grey,
            ),
            contentPadding: EdgeInsets.symmetric(
              vertical: 0,
              horizontal: 16,
            ),
          ),
          style: TextStyle(
            fontSize: getProportionateScreenWidth(
              context,
              18,
            ),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class MessageTitle extends StatelessWidget {
  String message;
  MessageTitle(this.message);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      alignment: Alignment.centerRight,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 200), //如何得到父組件的寬度？
        child: Container(
          padding: EdgeInsets.fromLTRB(24, 16, 32, 16),
          child: Text(
            message,
            style: TextStyle(color: Colors.white),
          ),
          decoration: BoxDecoration(
            color: Colors.grey,
            /* image: DecorationImage(
              image: AssetImage("assets/images/bubble_full_tail.png"),
              fit: BoxFit.fill,
            ), */
          ),
        ),
      ),
    );
  }
}
