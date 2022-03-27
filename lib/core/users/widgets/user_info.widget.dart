import 'package:flutter/material.dart';

class UserInfoWidget extends StatelessWidget {
  static String routeName = "/user_info_widget";
  const UserInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(),
    );
  }

  body() {
    return SafeArea(
      child: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              bodyUserTitle(),
              bodyUserInfoTitle(),
              bodyUserInfoItem(),
            ],
          ),
        ),
      ),
    );
  }

  bodyUserTitle() {
    return Container(
      // color: Colors.grey.shade200,
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Text(
              "Mk Yu",
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 4),
            child: Text(
              "26 歲 桃園市",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          ),
          Container(
            child: Text(
              "你好....",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }

  bodyUserInfoTitle() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      color: Colors.green.shade100,
      child: Row(
        children: [
          Container(
            child: Text(
              "詳細個人資料",
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

  bodyUserInfoItem() {
    return Container(
      padding: EdgeInsets.only(top: 8, left: 16, right: 16, bottom: 8),
      // color: Colors.grey.shade100,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              child: Text(
                "性別",
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
                "女",
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
