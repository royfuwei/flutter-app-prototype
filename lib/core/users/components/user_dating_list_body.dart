import 'package:flutter/material.dart';
import 'package:seeks_app_prototype/configs/size_config.dart';
import 'package:seeks_app_prototype/core/common/widgets/smart_refresh.widget.dart';
import 'package:seeks_app_prototype/core/dating/widgets/dating_list_item.widget.dart';
import 'package:sticky_headers/sticky_headers.dart';

class UserDatingListBodyComponent extends StatelessWidget {
  const UserDatingListBodyComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return body(context);
  }

  body(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: userDatingRefreshListView(),
    );
  }

  userDatingRefreshListView() {
    return CommonSmartRefreshWidget(
      child: userDatingListView(),
    );
  }

  userDatingListView() {
    return ListView(
      children: [
        userDatingProcessList(),
        VerticalSpacing(of: 10),
        userDatingHistoryList(),
      ],
    );
  }

  userDatingProcessList() {
    return StickyHeader(
      header: userDatingListTitle(),
      content: Column(
        children: [
          DatingListItem(),
          DatingListItem(),
          DatingListItem(),
        ],
      ),
    );
  }

  userDatingHistoryList() {
    return StickyHeader(
      header: userDatingListTitle(title: "約會紀錄"),
      content: Column(
        children: [
          DatingListItem(),
          DatingListItem(),
          DatingListItem(),
          DatingListItem(),
          DatingListItem(),
          DatingListItem(),
          DatingListItem(),
          DatingListItem(),
        ],
      ),
    );
  }

  userDatingListTitle({
    String title = "進行中的約會",
  }) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      color: Colors.green.shade100,
      child: Row(
        children: [
          Container(
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.normal,
                color: Colors.black,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
