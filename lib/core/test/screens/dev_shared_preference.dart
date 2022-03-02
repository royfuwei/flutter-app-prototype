import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:seeks_app_prototype/configs/size_config.dart';
import 'package:seeks_app_prototype/constants.dart';

class DevSharedPreference extends StatefulWidget {
  static String routeName = "dev/shared_preference";
  const DevSharedPreference({Key? key}) : super(key: key);

  @override
  _DevSharedPreferenceState createState() => _DevSharedPreferenceState();
}

class _DevSharedPreferenceState extends State<DevSharedPreference> {
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
