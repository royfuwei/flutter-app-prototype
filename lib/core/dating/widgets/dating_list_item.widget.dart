import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:seeks_app_prototype/configs/size_config.dart';
import 'package:seeks_app_prototype/constants.dart';
import 'package:seeks_app_prototype/core/dating/widgets/dating_label.widget.dart';

class DatingListItem extends StatelessWidget {
  static String routeName = "/dating_list_item";
  const DatingListItem({
    Key? key,
    this.username = "username",
    this.title = "一起讀書",
    this.datingDate = "週四, 6月10日",
    this.datingRange = "12:00-14:00",
    this.status = "配對中",
    this.startDismissible,
    this.startActionPaneChildren,
    this.endDismissible,
    this.endActionPaneChildren,
    this.itemColor,
    this.userImage = const AssetImage("assets/images/female-user.png"),
    this.infoImage = const AssetImage("assets/images/splash_2.jpg"),
    this.labelWidgets = const [],
    this.onPressed,
  }) : super(key: key);
  final String username;
  final String title;
  final String datingDate;
  final String datingRange;
  final String status;
  final ImageProvider<Object> userImage;
  final ImageProvider<Object> infoImage;
  final List<Widget>? startActionPaneChildren;
  final Widget? startDismissible;
  final List<Widget>? endActionPaneChildren;
  final Widget? endDismissible;
  final Color? itemColor;
  final void Function()? onPressed;
  final List<Widget> labelWidgets;

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
      child: datingListItem(context),
    );
  }

  datingListItem(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        color: itemColor != null ? itemColor : Colors.grey.shade100,
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        child: Row(
          children: [
            datingItemImage(context),
            Expanded(
              child: datingItemInfo(context),
            ),
          ],
        ),
      ),
    );
  }

  datingItemImage(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(),
      child: Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.width / 4,
          maxWidth: MediaQuery.of(context).size.width / 4,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 0.1, color: Colors.grey),
          image: DecorationImage(
            image: infoImage,
            fit: BoxFit.cover,
          ),
        ),
        alignment: Alignment.bottomLeft,
        child: datingItemImageUser(context),
      ),
    );
  }

  datingItemImageUser(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, 0),
      child: Container(
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.width / 4 / 3,
          minWidth: MediaQuery.of(context).size.width / 4,
        ),
        decoration: BoxDecoration(
          // color: Colors.grey,
          borderRadius: BorderRadius.circular(8),
          gradient: const LinearGradient(
            colors: [
              Colors.transparent,
              Colors.black45,
              Colors.black87,
            ],
            stops: [
              0.0,
              0.4,
              1.0,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.width / 4 / 3,
                maxWidth: MediaQuery.of(context).size.width / 4 / 3,
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white,
                ),
                image: DecorationImage(
                  image: userImage,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(
                  top: 2,
                  left: 3,
                  bottom: 3,
                  right: 2,
                ),
                child: Text(
                  username,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: getProportionateScreenHeight(
                      context,
                      12,
                    ),
                    // overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  datingItemInfo(BuildContext context) {
    return Container(
      // color: Colors.green.shade100,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.width / 4,
      ),
      padding: EdgeInsets.only(left: 10, right: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          datingItemInfoHead(context),
          datingItemInfoBottom(context),
        ],
      ),
    );
  }

  datingItemInfoHead(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 1, left: 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: colorFont02,
                    fontWeight: FontWeight.bold,
                    fontSize: getProportionateScreenWidth(context, 18),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 2),
                  child: Text(
                    "${datingDate} ${datingRange}",
                    style: TextStyle(
                      color: colorFont03,
                      fontWeight: FontWeight.bold,
                      fontSize: getProportionateScreenWidth(context, 14),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              children: [
                Icon(
                  Icons.more_vert,
                  color: colorFont02,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  datingItemInfoBottom(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          bodyDatingInfoStatus(context),
          bodyDatingInfoLabel(context),
        ],
      ),
    );
  }

  bodyDatingInfoStatus(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 5, right: 2),
      child: DatingLabelWidget(
        icon: Icons.update,
        title: status,
        textStyle: TextStyle(
          fontSize: 14,
          color: colorFont02,
        ),
      ),
    );
  }

  bodyDatingInfoLabel(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Wrap(
          spacing: 8,
          // runSpacing: 2,
          children: labelWidgets,
        ),
      ),
    );
  }
}
