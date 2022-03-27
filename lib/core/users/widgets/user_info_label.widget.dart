import 'package:flutter/material.dart';

class UserInfoLabelWidget extends StatefulWidget {
  static String routeName = "/user_info_label";
  const UserInfoLabelWidget({Key? key}) : super(key: key);

  @override
  State<UserInfoLabelWidget> createState() => _UserInfoLabelWidgetState();
}

class _UserInfoLabelWidgetState extends State<UserInfoLabelWidget> {
  @override
  Widget build(BuildContext context) {
    // return Container(child: genCrapLabel());
    return Scaffold(
      body: body(),
    );
    // return body();
  }

  // List<>

  body() {
    /* return Column(
      children: [Expanded(child: bodyUserInfoLabelWrap())],
    ); */
    return SafeArea(
      child: Container(
        child: Column(
          children: [
            bodyUserInfoTitle(),
            bodyUserInfoLabelWrap(),
          ],
        ),
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
              "興趣",
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

  bodyUserInfoLabelWrap() {
    return Container(
      padding: EdgeInsets.only(top: 8, left: 16, right: 16, bottom: 8),
      // color: Colors.blue.shade100,
      // constraints: BoxConstraints(maxHeight: 100),
      width: MediaQuery.of(context).size.width,
      child: Wrap(
        spacing: 2,
        runSpacing: 0,
        children: [
          genCrapLabel(),
          genCrapLabel(title: "label"),
        ],
      ),
    );
  }

  genCrapLabel({
    String title = "label",
    void Function()? onDeleted,
    void Function()? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Chip(
        label: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 14,
          ),
        ),
        onDeleted: onDeleted,
      ),
    );
  }
}
