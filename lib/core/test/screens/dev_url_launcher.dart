import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:seeks_app_prototype/configs/size_config.dart';
import 'package:seeks_app_prototype/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class DevUrlLauncher extends StatefulWidget {
  static String routeName = "dev/url_launcher";
  const DevUrlLauncher({Key? key}) : super(key: key);

  @override
  _DevUrlLauncherState createState() => _DevUrlLauncherState();
}

class _DevUrlLauncherState extends State<DevUrlLauncher> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  _launchUrl() async {
    var url = "https://www.google.com.tw";
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("url launcher"),
      ),
      body: Container(
        color: Colors.amber,
        width: MediaQuery.of(context).size.width,
        child: Column(
          // mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: TextButton(
                onPressed: () async {
                  _launchUrl();
                },
                child: Container(
                  color: Colors.grey,
                  child: Text("url"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
