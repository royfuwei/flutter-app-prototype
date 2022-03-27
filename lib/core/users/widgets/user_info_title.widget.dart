import 'package:flutter/material.dart';

class UserInfoTitleWidget extends StatelessWidget {
  static String routeName = "/user_info_title";
  const UserInfoTitleWidget({
    Key? key,
    this.username = "Mk Yu",
    this.age = 24,
    this.city = "桃園市",
    this.description = "你好....",
  }) : super(key: key);

  final String username;
  final int age;
  final String city;
  final String description;

  @override
  Widget build(BuildContext context) {
    return body();
  }

  body() {
    return Center(
      child: bodyUserTitle(),
    );
  }

  bodyUserTitle() {
    return Container(
      color: Colors.grey.shade200,
      width: double.infinity,
      // constraints: BoxConstraints(maxHeight: 150),
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Text(
              username,
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 4),
            child: Text(
              "${age} 歲 ${city}",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          ),
          Container(
            child: Text(
              description,
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
}
