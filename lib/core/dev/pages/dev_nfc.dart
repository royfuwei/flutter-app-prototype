import 'package:flutter/material.dart';

class DevNFC extends StatefulWidget {
  static String routeName = "/dev/nfc";
  const DevNFC({Key? key}) : super(key: key);

  @override
  _DevNFCState createState() => _DevNFCState();
}

class _DevNFCState extends State<DevNFC> {
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
