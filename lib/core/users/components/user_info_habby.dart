import 'package:flutter/material.dart';
import 'package:seeks_app_prototype/core/users/widgets/user_info_list_title.widget.dart';
import 'package:seeks_app_prototype/domain/user.dart';

class UserInfoLabelsComponent extends StatelessWidget {
  const UserInfoLabelsComponent({
    Key? key,
    this.title = "興趣",
    this.items = const [],
    this.onDeleted,
    this.onTap,
  }) : super(key: key);

  final List<UserInfoLabelsContentEntity> items;
  final void Function(UserInfoLabelsContentEntity item)? onDeleted;
  final void Function(UserInfoLabelsContentEntity item)? onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return body(context);
  }

  body(BuildContext context) {
    return bodyUserInfoHabby(context);
  }

  bodyUserInfoHabby(BuildContext context) {
    return Container(
      child: Column(
        children: [
          UserInfoListTitleWidget(
            title: title,
          ),
          bodyUserInfoLabelWrap(context),
        ],
      ),
    );
  }

  bodyUserInfoLabelWrap(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 8, left: 16, right: 16, bottom: 8),
      constraints: BoxConstraints(minHeight: 100),
      // color: Colors.blue.shade100,
      // constraints: BoxConstraints(maxHeight: 100),
      width: MediaQuery.of(context).size.width,
      child: Wrap(
        spacing: 8,
        runSpacing: 0,
        children: List.generate(
          items.length,
          (index) => genCrapLabel(index, items[index]),
        ),
      ),
    );
  }

  genCrapLabel(int idx, UserInfoLabelsContentEntity item) {
    return GestureDetector(
      onTap: () => onTap != null ? onTap!(item) : {},
      child: Chip(
        label: Text(
          item.name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 14,
          ),
        ),
        onDeleted: onDeleted != null ? () => onDeleted!(item) : null,
      ),
    );
  }
}
