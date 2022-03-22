import 'package:flutter/material.dart';
import 'package:seeks_app_prototype/infrastructures/develop/components/app_listVew.dart';
import 'package:seeks_app_prototype/infrastructures/util/keep_alive_wrapper.dart';

class DevEntryPage extends StatefulWidget {
  static String routeName = '/develop';
  DevEntryPage({Key? key}) : super(key: key);

  _DevEntryState createState() => _DevEntryState();
}

class _DevEntryState extends State {
  final List<Tab> myTabs = <Tab>[
    Tab(text: 'app頁面'),
    Tab(text: 'widget頁面'),
    Tab(text: 'dev頁面'),
  ];

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
            KeepAliveWrapper(
              child: Center(
                child: ListView(
                  children: getAppView(context),
                ),
              ),
            ),
            KeepAliveWrapper(
              child: Center(
                child: ListView(
                  children: getWidgetView(context),
                ),
              ),
            ),
            KeepAliveWrapper(
              child: Center(
                child: ListView(
                  children: getDevView(context),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
