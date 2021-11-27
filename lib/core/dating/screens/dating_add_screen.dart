import 'package:flutter/material.dart';

class DatingAddScreen extends StatefulWidget {
  static String routeName = "dating/add";
  const DatingAddScreen({Key? key}) : super(key: key);

  @override
  _DatingAddScreenState createState() => _DatingAddScreenState();
}

class _DatingAddScreenState extends State<DatingAddScreen> {
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
