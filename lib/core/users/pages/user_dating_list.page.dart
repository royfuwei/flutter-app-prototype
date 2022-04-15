import 'package:flutter/material.dart';
import 'package:seeks_app_prototype/core/users/components/user_dating_list_body.dart';

class UserDatingListPage extends StatelessWidget {
  static String routeName = "/user_dating_list";

  const UserDatingListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(),
    );
  }

  body() {
    return UserDatingListBodyComponent();
  }
}
