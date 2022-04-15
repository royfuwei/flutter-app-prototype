import 'package:flutter/material.dart';
import 'package:seeks_app_prototype/configs/size_config.dart';
import 'package:seeks_app_prototype/constants.dart';
import 'package:seeks_app_prototype/core/common/components/default_app_bar.dart';

class AppBarWidget extends StatelessWidget with PreferredSizeWidget {
  const AppBarWidget({
    Key? key,
    this.startItems = const [],
    this.titleItems = const [],
    this.endItems = const [],
    this.backgroundColor,
    this.elevation = 0.1,
    this.leading,
  }) : super(key: key);
  final List<Widget> startItems;
  final List<Widget> titleItems;
  final List<Widget> endItems;
  final Color? backgroundColor;
  final double elevation;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    return appBar(context);
  }

  appBar(BuildContext context) {
    return AppBar(
      leading: leading != null ? leading : Container(),
      leadingWidth: leading != null ? null : 0,
      backgroundColor:
          backgroundColor != null ? backgroundColor : Colors.grey.shade100,
      elevation: elevation,
      title: defaultExpandedAppBarTitle(
        startItems: startItems,
        titleItems: titleItems,
        endItems: endItems,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight * 0.78);
}

appBarTitleText({
  required BuildContext context,
  String text = "",
  double size = 20,
  Color fontColor = colorFont02,
  void Function()? onPressed,
}) {
  return TextButton(
    onPressed: onPressed,
    child: Text(
      text,
      style: TextStyle(
        color: fontColor,
        fontSize: getProportionateScreenWidth(context, size),
      ),
    ),
  );
}

appBarBackButton({
  required BuildContext context,
  void Function()? onPressed,
  IconData? icon = Icons.close,
  double size = 24,
}) {
  return TextButton(
    onPressed: onPressed != null
        ? onPressed
        : () {
            Navigator.pop(
              context,
            );
          },
    child: Icon(
      icon,
      size: getProportionateScreenWidth(context, size),
      color: colorFont02,
    ),
  );
}

appBarIconButton({
  required BuildContext context,
  void Function()? onPressed,
  Color color = Colors.blue,
  IconData? icon = Icons.close,
  double size = 28,
}) {
  return TextButton(
    onPressed: onPressed != null ? onPressed : () {},
    child: Icon(
      icon,
      size: getProportionateScreenWidth(context, size),
      color: color,
    ),
  );
}

appBarUserTitle({
  required BuildContext context,
  bool isOnline = true,
  String name = "",
  String status = "狀態未知",
  void Function()? onPressed,
}) {
  return Expanded(
    child: GestureDetector(
      onTap: onPressed,
      child: Container(
        // width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(left: 16),
              child: Text(
                name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(context, 16),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Icon(
                    Icons.circle,
                    size: getProportionateScreenWidth(context, 10),
                    color: isOnline ? Colors.green : Colors.grey,
                  ),
                ),
                Text(
                  status,
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(context, 10),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
