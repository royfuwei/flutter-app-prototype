import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  static String routeName = "notification";
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      pages: [
        MaterialPage(
          child: Scaffold(),
        ),
      ],
    );
  }
}
