import 'package:flutter/material.dart';
import 'package:seeks_app_prototype/core/users/widgets/user_info_list_item.widget.dart';
import 'package:seeks_app_prototype/core/users/widgets/user_info_list_title.widget.dart';
import 'package:seeks_app_prototype/domain/user.dart';

class UserInfoEditorListComponent extends StatelessWidget {
  const UserInfoEditorListComponent({
    Key? key,
    this.items = const [],
    required this.onPressed,
  }) : super(key: key);
  final List<UserInfoListEntity> items;
  final void Function(UserInfoListContentEntity) onPressed;

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
        var _subWidget = UserInfoListItemWidget(
          onPressed: () => onPressed(_subItem),
        );
        _temp.add(_subWidget);
      }
    }
    return _temp;
  }
}
