import 'package:flutter/material.dart';

class MoreScreen extends StatefulWidget {
  static String routeName = "more";
  const MoreScreen({Key? key}) : super(key: key);

  @override
  _MoreScreenState createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
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
