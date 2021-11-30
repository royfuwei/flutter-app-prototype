import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../routes.dart';

class AccountView extends StatelessWidget {
  final List<Tab> myTabs = <Tab>[
    Tab(text: '開發頁面'),
    Tab(text: '測試頁面'),
  ];
  late List<Widget> myTestListView;
  late List<Widget> myDevListView;

  @override
  Widget build(BuildContext context) {
    void _routePushNamed(String route, {Object? arguments}) {
      Navigator.of(context).pushNamed(
        route,
        arguments: arguments,
      );
    }

    void _routePushNamedAndRemoveUntil(String route, {Object? arguments}) {
      Navigator.of(context).pushNamedAndRemoveUntil(
        route,
        (route) => false,
        arguments: arguments,
      );
    }

    myTestListView = <Widget>[
      ListTile(
        leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
        title: Text('default'),
        onTap: () {
          _routePushNamed(DevRoutes.defaultPage,
              arguments: {'title': 'Flutter Default Page'});
        },
      ),
      ListTile(
        leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
        title: Text('test_bottom_nav'),
        onTap: () {
          _routePushNamedAndRemoveUntil(DevRoutes.testBottomNav);
        },
      ),
    ];
    myDevListView = <Widget>[
      ListTile(
        leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
        title: Text('first_page'),
        onTap: () {
          _routePushNamed(DevRoutes.firstPage);
        },
      ),
    ];
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
        endDrawer: Drawer(
          child: ListView(
            // scrollDirection: Axis.horizontal,
            children: [
              UserAccountsDrawerHeader(
                accountName: new Text("Account Drawer"),
                accountEmail: null,
              ),
              ListBody(
                children: [
                  ListTile(
                    onTap: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        '/',
                        (route) => false,
                      );
                      // Navigator.of(context).popAndPushNamed('/');
                    },
                    title: Text("登出"),
                  ),
                ],
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(
              child: ListView(
                children: myTestListView,
              ),
            ),
          ],
        ),
      ),
    );
  }
  // void _drawerOnClick(int index) {
  //   print("_drawerOnClick: $index");
  //     Navigator.of(context).pushNamedAndRemoveUntil(
  //     route,
  //     (route) => false,
  //     arguments: arguments,
  //   );
  // }
}
