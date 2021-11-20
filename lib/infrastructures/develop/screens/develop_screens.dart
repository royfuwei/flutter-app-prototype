import 'package:flutter/material.dart';
import 'package:seeks_flutter/core/login/screens/login_screen.dart';
import 'package:seeks_flutter/core/splash/screens/splash_screen.dart';
import 'package:seeks_flutter/infrastructures/develop/components/listVew.dart';
import 'package:seeks_flutter/routes.dart';

class DevEntryPage extends StatefulWidget {
  DevEntryPage({Key? key}) : super(key: key);

  _DevEntryState createState() => _DevEntryState();
}

class _DevEntryState extends State {
  final List<Tab> myTabs = <Tab>[
    Tab(text: '開發頁面'),
    Tab(text: '測試頁面'),
  ];
  late List<Widget> myTestListView;
  late List<Widget> myDevListView;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      initialIndex: 0,
      child: Scaffold(
        appBar: PreferredSize(
          child: AppBar(
            title: Text('Develop'),
            bottom: TabBar(
              tabs: myTabs,
            ),
            actions: [],
          ),
          preferredSize: Size.fromHeight(100),
        ),
        body: TabBarView(
          children: [
            Center(
              child: ListView(
                children: getDevView(context),
              ),
            ),
            Center(
              child: ListView(
                children: getTestView(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
