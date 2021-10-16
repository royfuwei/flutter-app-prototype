import 'package:flutter/material.dart';
import 'package:seeks_flutter/core/login/screens/login_screen.dart';
import 'package:seeks_flutter/core/splash/screens/splash_screen.dart';
import 'package:seeks_flutter/routes.dart';

class DevEntryPage extends StatefulWidget {
  DevEntryPage({Key key}) : super(key: key);

  _DevEntryState createState() => _DevEntryState();
}

class _DevEntryState extends State {
  final List<Tab> myTabs = <Tab>[
    Tab(text: '開發頁面'),
    Tab(text: '測試頁面'),
  ];
  List<Widget> myTestListView;
  List<Widget> myDevListView;

  void _routePushNamed(String route, {Object arguments}) {
    Navigator.of(context).pushNamed(
      route,
      arguments: arguments,
    );
  }

  void _routePushNamedAndRemoveUntil(String route, {Object arguments}) {
    Navigator.of(context).pushNamedAndRemoveUntil(
      route,
      (route) => false,
      arguments: arguments,
    );
  }

  @override
  Widget build(BuildContext context) {
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
      ListTile(
        leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
        title: Text('ithelp_class1'),
        onTap: () {
          _routePushNamed(SplashScreen.routeName);
        },
      ),
      ListTile(
        leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
        title: Text('ithelp_class2'),
        onTap: () {
          _routePushNamed(LoginScreen.routeName);
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
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.0),
        child: AppBar(
          title: Text('Route Page'),
        ),
      ),
      drawer: _initDrawer(),
      // drawerEdgeDragWidth: 0,
      // body: _initBodyCenter(),
      body: _initTabBarView(),
    );
  }

  Widget _initTabBarView() {
    return DefaultTabController(
      length: myTabs.length,
      initialIndex: 0,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: AppBar(
            automaticallyImplyLeading: false,
            bottom: TabBar(
              isScrollable: true,
              tabs: myTabs,
              // labelColor: Colors.black,
            ),
          ),
        ),
        body: TabBarView(
          children: [
            Center(
              child: ListView(
                children: myDevListView,
              ),
            ),
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

  Widget _initDrawer() {
    return Drawer(
      child: ListView(
        children: <Widget>[
          //設定用户名稱
          UserAccountsDrawerHeader(
            accountName: new Text(
              "Seeks 導覽列",
            ),
            //設定Email
            accountEmail: new Text(
              "royfuwei@gmail.com",
            ),
            //設定大頭照
            currentAccountPicture: new CircleAvatar(
                // backgroundImage: new AssetImage("assets/icon/logo.jpg"),
                ),
          ),
          ListBody(
            children: [
              ListTile(
                title: Text("test"),
              ),
              ...myTestListView,
              ...myDevListView,
            ],
          ),
        ],
      ),
    );
  }

  Widget _initBodyCenter() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          ElevatedButton(
            onPressed: () {
              // print("context $context");
              _routePushNamed(
                DevRoutes.defaultPage,
                arguments: {'title': 'Flutter Default Page'},
              );
            },
            child: Text('default'),
          ),
          ElevatedButton(
            onPressed: () {
              _routePushNamed(DevRoutes.firstPage);
            },
            child: Text('first_page'),
          ),
          ElevatedButton(
            onPressed: () {
              _routePushNamedAndRemoveUntil(DevRoutes.testBottomNav);
            },
            child: Text('test_bottom_nav'),
          ),
        ],
      ),
    );
  }
}
