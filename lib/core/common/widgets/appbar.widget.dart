import 'package:flutter/material.dart';
import 'package:seeks_app_prototype/core/common/components/default_app_bar.dart';

class AppBarWidget extends StatelessWidget with PreferredSizeWidget {
  const AppBarWidget({
    Key? key,
    this.startItems = const [],
    this.titleItems = const [],
    this.endItems = const [],
  }) : super(key: key);
  final List<Widget> startItems;
  final List<Widget> titleItems;
  final List<Widget> endItems;

  @override
  Widget build(BuildContext context) {
    return appBar(context);
  }

  appBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.grey.shade100,
      elevation: 0,
      // leading: Container(),
      // leadingWidth: 0,
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
