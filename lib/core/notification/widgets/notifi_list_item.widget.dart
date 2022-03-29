import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:seeks_app_prototype/configs/size_config.dart';
import 'package:seeks_app_prototype/constants.dart';

class NotifiListItem extends StatelessWidget {
  static String routeName = "/notifi_list_item";
  const NotifiListItem({
    Key? key,
    this.title = "XXX 報名'一起讀書'的約會",
    this.notifiTime = "3分鐘前",
    this.color,
    this.image = const AssetImage("assets/images/male-user.png"),
    this.startDismissible,
    this.startActionPaneChildren,
    this.endDismissible,
    this.endActionPaneChildren,
    this.onTap,
  }) : super(key: key);

  final String title;
  final String notifiTime;
  final Color? color;
  final ImageProvider<Object> image;
  final void Function()? onTap;
  final List<Widget>? startActionPaneChildren;
  final Widget? startDismissible;
  final List<Widget>? endActionPaneChildren;
  final Widget? endDismissible;

  @override
  Widget build(BuildContext context) {
    return body(context);
  }

  body(BuildContext context) {
    return Center(
      child: itemSlidable(context),
    );
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
      child: notifiListItemButton(context),
    );
  }

  notifiListItemButton(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: notifiListItem(context),
    );
  }

  notifiListItem(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: color != null ? color : colorBarWhite,
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenHeight(context, 8),
        horizontal: getProportionateScreenWidth(context, 16),
      ),
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.width / 4,
      ),
      child: Row(
        children: [
          notifiListItemImage(context),
          Expanded(
            child: notifiListItemInfo(context),
          ),
        ],
      ),
    );
  }

  notifiListItemImage(BuildContext context) {
    return Container(
      child: CircleAvatar(
        backgroundImage: image,
        maxRadius: getProportionateScreenWidth(context, 50),
      ),
    );
  }

  notifiListItemInfo(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            child: Text(
              title,
              style: TextStyle(
                color: colorFont03,
                fontWeight: FontWeight.bold,
                fontSize: getProportionateScreenWidth(context, 16),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Text(
              notifiTime,
              textAlign: TextAlign.end,
              style: TextStyle(
                color: Colors.grey.shade400,
                fontSize: getProportionateScreenWidth(context, 14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
