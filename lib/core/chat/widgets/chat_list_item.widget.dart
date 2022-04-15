import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:seeks_app_prototype/configs/size_config.dart';
import 'package:seeks_app_prototype/constants.dart';

class ChatListItemWidget extends StatelessWidget {
  static String routeName = "/chat_list_item_widget";
  const ChatListItemWidget({
    Key? key,
    this.onPressed,
    this.itemImageOnPressed,
    this.itemImage = const AssetImage("assets/images/male-user.png"),
    this.username = "XXX",
    this.message = "安安你好... ",
    this.latestTime = "3分鐘前",
    this.unReadCount = "999+",
    this.itemStatus,
    this.startDismissible,
    this.startActionPaneChildren,
    this.endDismissible,
    this.endActionPaneChildren,
  }) : super(key: key);

  final void Function()? onPressed;
  final void Function()? itemImageOnPressed;
  final ImageProvider<Object> itemImage;
  final String username;
  final String message;
  final String latestTime;
  final String unReadCount;
  final List<Widget>? itemStatus;
  final List<Widget>? startActionPaneChildren;
  final Widget? startDismissible;
  final List<Widget>? endActionPaneChildren;
  final Widget? endDismissible;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: body(context),
    );
  }

  body(BuildContext context) {
    // return chatListItem(context);
    return itemSlidable(context);
  }

  itemSlidable(BuildContext context) {
    return Slidable(
      key: key,
      startActionPane: startActionPaneChildren != null
          ? ActionPane(
              // A motion is a widget used to control how the pane animates.
              motion: StretchMotion(),
              // A pane can dismiss the Slidable.
              dismissible: startDismissible,
              // All actions are defined in the children parameter.
              // children: startActionPaneChildren!,
              children: startActionPaneChildren!,
            )
          : null,
      endActionPane: endActionPaneChildren != null
          ? ActionPane(
              // A motion is a widget used to control how the pane animates.
              motion: StretchMotion(),
              // A pane can dismiss the Slidable.
              dismissible: endDismissible,
              // All actions are defined in the children parameter.
              children: endActionPaneChildren!,
            )
          : null,
      child: chatListItem(context),
    );
  }

  chatListItem(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        overlayColor: MaterialStateProperty.all(
          Colors.amber,
        ),
        backgroundColor: MaterialStateProperty.all(
          Colors.grey.shade100,
        ),
      ),
      child: Container(
        padding: EdgeInsets.only(left: 8, top: 8, bottom: 8, right: 8),
        // color: Colors.grey.shade100,
        alignment: Alignment.center,
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.width / 4,
        ),
        child: Row(
          children: [
            chatItemUserImage(context),
            Expanded(
              child: chatItemInfo(context),
            ),
          ],
        ),
      ),
    );
  }

  chatItemUserImage(BuildContext context) {
    return GestureDetector(
      onTap: itemImageOnPressed,
      child: CircleAvatar(
        backgroundColor: Colors.white12,
        backgroundImage: itemImage,
        maxRadius: getProportionateScreenWidth(context, 50),
      ),
    );
  }

  chatItemInfo(BuildContext context) {
    return Container(
      // color: Colors.amber.shade100,
      child: Row(
        children: [
          Expanded(
            child: chatItemInfoStart(context),
          ),
          chatItemInfoEnd(context),
        ],
      ),
    );
  }

  chatItemInfoStart(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 8, top: 8, left: 4, right: 8),
      // color: Colors.amber.shade100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          chatItemInfoTitle(context),
          chatItemInfoContent(context),
          // Container(),
        ],
      ),
    );
  }

  chatItemInfoTitle(BuildContext context) {
    return Container(
      child: Row(
        children: [
          chatItemInfoTitleName(context),
          chatItemInfoTitleStatus(context),
        ],
      ),
    );
  }

  chatItemInfoTitleName(BuildContext context) {
    return Container(
      child: Text(
        username,
        style: TextStyle(
          color: colorFont03,
          fontWeight: FontWeight.bold,
          fontSize: getProportionateScreenWidth(context, 16),
        ),
      ),
    );
  }

  chatItemInfoTitleStatus(BuildContext context) {
    /* return Container(
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(context, 10),
            ),
            child: Icon(
              Icons.volume_off,
              size: getProportionateScreenWidth(context, 16),
              color: colorFont03,
            ),
          ),
        ],
      ),
    ); */
    return Container(
      child: Row(
        children: itemStatus != null ? itemStatus! : [],
      ),
    );
  }

  chatItemInfoContent(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(top: 8),
      child: Text(
        message,
        textAlign: TextAlign.start,
        style: TextStyle(
          color: colorFont02,
          fontSize: getProportionateScreenWidth(context, 14),
        ),
      ),
    );
  }

  chatItemInfoEnd(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 8, right: 4),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          chatItemInfoEndTime(context),
          chatItemInfoEndUnReadCount(context),
          // Container(),
        ],
      ),
    );
  }

  chatItemInfoEndTime(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      child: Text(
        latestTime,
        textAlign: TextAlign.end,
        style: TextStyle(
          color: colorFont03,
          fontSize: getProportionateScreenWidth(context, 12),
        ),
      ),
    );
  }

  chatItemInfoEndUnReadCount(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 10,
      ),
      // color: bgMainColor,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.green,
      ),
      child: Text(
        unReadCount,
        style: TextStyle(
          fontSize: 12,
          color: Colors.white,
        ),
      ),
    );
  }
}
