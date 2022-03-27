import 'package:flutter/material.dart';
import 'package:seeks_app_prototype/core/dating/widgets/dating_list_item.widget.dart';
import 'package:sticky_headers/sticky_headers.dart';

class UserDatingListPage extends StatefulWidget {
  static String routeName = "/user_dating_list";
  const UserDatingListPage({Key? key}) : super(key: key);

  @override
  State<UserDatingListPage> createState() => _UserDatingListPageState();
}

class _UserDatingListPageState extends State<UserDatingListPage> {
  final _controller = ScrollController();
  bool showToTopBtn = false;

  @override
  void dispose() {
    //为了避免内存泄露，需要调用_controller.dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(),
    );
  }

  body() {
    return SafeArea(
      bottom: false,
      child: Container(
        color: Colors.amber.shade100,
        child: ListView(
          children: [
            // userDatingListTitle(),
            userDatingProcessList(),
            userDatingHistoryList(),
          ],
        ),
      ),
    );
  }

  userDatingProcessList() {
    return StickyHeader(
      header: userDatingListTitle(),
      content: Column(
        children: [
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
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /* userDatingListTitle({
    String title = "進行中的約會",
  }) {
    return Container(
      color: Colors.green.shade100,
      child: ListTile(
        title: Row(
          children: [
            Container(
              child: Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
        onTap: () {
          print("title: ${title}");
          // _controller.jumpTo(offset);
          /* _controller.animateTo(
                    offset * 1,
                    duration: Duration(seconds: 2),
                    curve: Curves.fastOutSlowIn,
                  ); */
          // _animateToIndex(items);
        },
      ),
    );
  } */
}
