import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:seeks_app_prototype/configs/size_config.dart';
import 'package:seeks_app_prototype/constants.dart';

class DevFirebaseFCM extends StatefulWidget {
  static String routeName = "dev/firebase/fcm";
  const DevFirebaseFCM({Key? key}) : super(key: key);

  @override
  _DevFirebaseFCMState createState() => _DevFirebaseFCMState();
}

class _DevFirebaseFCMState extends State<DevFirebaseFCM> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  late Future<FirebaseApp> firebaesFuture;

  @override
  void initState() {
    super.initState();
    firebaesFuture = Firebase.initializeApp();
    print("firebaesFuture: ${firebaesFuture}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Firebase FCM"),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
