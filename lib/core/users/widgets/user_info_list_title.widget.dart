import 'package:flutter/material.dart';

class UserInfoListTitleWidget extends StatelessWidget {
  static String routeName = "/user_info_list_title";
  const UserInfoListTitleWidget({
    Key? key,
    this.title = "詳細個人資料",
    this.color,
  }) : super(key: key);

  final String title;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return body();
  }

  body() {
    return Center(
      child: bodyUserInfoTitle(),
    );
  }

  bodyUserInfoTitle() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      color: color != null ? color : Colors.green.shade100,
      child: Row(
        children: [
          Container(
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
