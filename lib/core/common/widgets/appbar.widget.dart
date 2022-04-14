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
}) {
  return Text(
    text,
    style: TextStyle(
      color: fontColor,
      fontSize: getProportionateScreenWidth(context, size),
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
