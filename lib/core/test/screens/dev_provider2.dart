import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:seeks_app_prototype/configs/size_config.dart';
import 'package:seeks_app_prototype/constants.dart';

class DevProvider2 extends StatefulWidget {
  static String routeName = "dev/shared_preference";
  const DevProvider2({Key? key}) : super(key: key);

  @override
  _DevProvider2State createState() => _DevProvider2State();
}

class _DevProvider2State extends State<DevProvider2> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider2"),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
