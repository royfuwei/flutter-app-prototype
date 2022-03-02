import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:seeks_app_prototype/configs/size_config.dart';
import 'package:seeks_app_prototype/constants.dart';

class DevQRCode extends StatefulWidget {
  static String routeName = "dev/qrcode";
  const DevQRCode({Key? key}) : super(key: key);

  @override
  _DevQRCodeState createState() => _DevQRCodeState();
}

class _DevQRCodeState extends State<DevQRCode> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shared Preference"),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
