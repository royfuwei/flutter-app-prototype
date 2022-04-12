import 'package:flutter/material.dart';
import 'package:seeks_app_prototype/core/media/widgets/media_images_viewer.widget.dart';
import 'package:seeks_app_prototype/core/users/widgets/user_info_list_item.widget.dart';
import 'package:seeks_app_prototype/core/users/widgets/user_info_list_title.widget.dart';
import 'package:seeks_app_prototype/core/users/widgets/user_info_title.widget.dart';
import 'package:seeks_app_prototype/domain/user.dart';

class UserInfoListComponent extends StatelessWidget {
  const UserInfoListComponent({
    Key? key,
    this.items = const [],
  }) : super(key: key);
  final List<UserInfoListEntity> items;

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = getListLength(items);
    return body(context, widgets);
  }

  body(BuildContext context, List<Widget> widgets) {
    return bodyUserInfoList(widgets);
  }

  bodyUserInfoList(List<Widget> widgets) {
    return Container(
      child: Column(
        children: List.generate(
          widgets.length,
          (index) => widgets[index],
        ),
      ),
    );
  }

  List<Widget> getListLength(List<UserInfoListEntity> _items) {
    List<Widget> _temp = [];
    for (var _item in _items) {
      var _widget = UserInfoListTitleWidget();
      _temp.add(_widget);
      for (var _subItem in _item.contents!) {
        var _subWidget = UserInfoListItemWidget();
        _temp.add(_subWidget);
      }
    }
    return _temp;
  }
}
