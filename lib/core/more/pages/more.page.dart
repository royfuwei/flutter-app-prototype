import 'package:flutter/material.dart';
import 'package:seeks_app_prototype/configs/size_config.dart';
import 'package:seeks_app_prototype/constants.dart';

class MorePage extends StatefulWidget {
  static String routeName = "/more";
  const MorePage({Key? key}) : super(key: key);

  @override
  _MorePageState createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      pages: [
        MaterialPage(
          child: Scaffold(
            appBar: appBar(),
          ),
        ),
      ],
    );
  }

  appBar() {
    return AppBar(
      elevation: 0.2,
      // backgroundColor: colorBarWhite,
      backgroundColor: Colors.white,
      title: Text(
        "個人訊息",
        style: TextStyle(
          color: colorFont02,
          fontSize: getProportionateScreenWidth(context, 20),
        ),
      ),
    );
  }
}
