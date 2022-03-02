import 'package:flutter/material.dart';
import 'package:seeks_app_prototype/core/login/screens/login_screen.dart';
import 'package:seeks_app_prototype/core/splash/screens/splash_screen.dart';
import 'package:seeks_app_prototype/infrastructures/develop/components/listVew.dart';
import 'package:seeks_app_prototype/routes.dart';

class DevEntryPage extends StatefulWidget {
  static String routeName = '/develop';
  DevEntryPage({Key? key}) : super(key: key);

  _DevEntryState createState() => _DevEntryState();
}

class _DevEntryState extends State {
  final List<Tab> myTabs = <Tab>[
    Tab(text: '開發頁面'),
    Tab(text: '測試頁面'),
    // Tab(text: '元件頁面'),
  ];
  late List<Widget> myTestListView;
  late List<Widget> myDevListView;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      initialIndex: 0,
      child: Scaffold(
        /* appBar: PreferredSize(
          child: AppBar(
            // title: Text('Develop'),
            bottom: TabBar(
              tabs: myTabs,
            ),
            actions: [],
          ),
          preferredSize: Size.fromHeight(100),
        ), */
        appBar: AppBar(
          title: TabBar(
            tabs: myTabs,
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(width: 1.0),
              insets: EdgeInsets.symmetric(horizontal: 16.0),
            ),
            padding: EdgeInsets.zero,
          ),
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
            /* Center(
              child: ListView(
                children: getTestView(context),
              ),
            ), */
          ],
        ),
      ),
    );
  }
}
