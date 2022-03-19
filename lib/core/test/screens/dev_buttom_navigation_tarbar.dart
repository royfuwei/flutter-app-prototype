import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:seeks_app_prototype/configs/size_config.dart';
import 'package:seeks_app_prototype/constants.dart';
import 'package:seeks_app_prototype/infrastructures/util/keep-alive-wrapper.dart';

class DevBottomNavigationTabBar extends StatefulWidget {
  static String routeName = "dev/buttom_navigation_tarbar";
  const DevBottomNavigationTabBar({Key? key}) : super(key: key);

  @override
  _DevBottomNavigationTabBarState createState() =>
      _DevBottomNavigationTabBarState();
}

class _DevBottomNavigationTabBarState extends State<DevBottomNavigationTabBar> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  int currentIndex = 1;
  final pages = [
    KeepAliveWrapper(
      child: CenterMessageWidget(
        centerMessage: "首頁",
        backgroundColor: Colors.lightGreenAccent,
      ),
      keepAlive: true,
    ),
    LessonPageTabBar(),
    KeepAliveWrapper(
      child: CenterMessageWidget(
        centerMessage: "第三頁",
        backgroundColor: Colors.lightBlueAccent,
      ),
    ),
    KeepAliveWrapper(
      child: CenterMessageWidget(
        centerMessage: "第四頁",
        backgroundColor: Colors.grey,
      ),
    ),
    KeepAliveWrapper(
      child: CenterMessageWidget(
          centerMessage: "第五頁", backgroundColor: Colors.grey),
    ),
  ];
  final items = [
    BottomNavigationBarItem(
        label: "首頁", icon: Icon(Icons.home), backgroundColor: Colors.red),
    BottomNavigationBarItem(
        label: "第二頁", icon: Icon(Icons.star), backgroundColor: Colors.orange),
    BottomNavigationBarItem(
        label: "第三頁",
        icon: Icon(Icons.account_box),
        backgroundColor: Colors.yellowAccent),
    BottomNavigationBarItem(
        label: "第四頁",
        icon: Icon(Icons.local_airport),
        backgroundColor: Colors.blue),
    BottomNavigationBarItem(
        label: "第五頁",
        icon: Icon(Icons.local_airport),
        backgroundColor: Colors.purple),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("buttom navigation tarbar"),
      ),
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        items: items,
        currentIndex: currentIndex,
        backgroundColor: Colors.pinkAccent,
        fixedColor: Colors.green,
        unselectedItemColor: Colors.deepPurpleAccent,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}

class LessonPageTabBar extends StatelessWidget {
  final pages = [
    // CenterMessageWidget("2.1頁", Colors.redAccent),
    // CenterMessageWidget("2.2頁", Colors.yellow),
    // CenterMessageWidget("2.3頁", Colors.pinkAccent),
    KeepAliveWrapper(
      child: CenterMessageWidget(
        centerMessage: "2.1頁",
        backgroundColor: Colors.redAccent,
      ),
    ),
    KeepAliveWrapper(
      child: CenterMessageWidget(
        centerMessage: "2.2頁",
        backgroundColor: Colors.yellow,
      ),
    ),
    KeepAliveWrapper(
      child: CenterMessageWidget(
        centerMessage: "2.3頁",
        backgroundColor: Colors.pinkAccent,
      ),
    ),
  ];
  final tabs = [Tab(text: "第2.1頁"), Tab(text: "第2.2頁"), Tab(text: "第2.3頁")];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: tabs.length,
      child: Column(
        children: <Widget>[
          Container(
            child: TabBar(tabs: tabs, indicatorWeight: 5),
            color: Colors.lightGreen,
          ),
          Expanded(child: TabBarView(children: pages))
        ],
      ),
    );
  }
}

class CenterMessageWidget extends StatefulWidget {
  final String centerMessage;
  final Color backgroundColor;
  const CenterMessageWidget({
    Key? key,
    this.centerMessage = "",
    this.backgroundColor = Colors.white,
  }) : super(key: key);

  @override
  State<CenterMessageWidget> createState() => _CenterMessageWidgetState();
}

class _CenterMessageWidgetState extends State<CenterMessageWidget> {
  bool istap = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          istap = !istap;
        });
      },
      child: Container(
        color: widget.backgroundColor,
        alignment: Alignment.center,
        child: Text(
          widget.centerMessage,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: istap ? 50 : 100),
        ),
      ),
    );
  }
}
/* class CenterMessageWidget extends StatelessWidget {
  String centerMessage = "";
  Color backgroundColor = Colors.white;

  CenterMessageWidget(this.centerMessage, this.backgroundColor);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      alignment: Alignment.center,
      child: Text(
        centerMessage,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 100),
      ),
    );
  }
} */
