import 'package:flutter/material.dart';

class UserInfoListItemWidget extends StatelessWidget {
  static String routeName = "/user_info_list_item";
  const UserInfoListItemWidget({
    Key? key,
    this.title = "性別",
    this.value = "女",
  }) : super(key: key);

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return body();
  }

  body() {
    return Center(
      child: bodyUserInfoItem(),
    );
  }

  bodyUserInfoItem() {
    return Container(
      padding: EdgeInsets.only(top: 8, left: 16, right: 16, bottom: 8),
      color: Colors.grey.shade100,
      constraints: BoxConstraints(maxHeight: 100),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              child: Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: Text(
                value,
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
