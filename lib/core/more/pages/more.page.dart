import 'package:flutter/material.dart';
import 'package:seeks_app_prototype/configs/size_config.dart';
import 'package:seeks_app_prototype/constants.dart';
import 'package:seeks_app_prototype/core/users/pages/user_dating_list.page.dart';
import 'package:seeks_app_prototype/core/users/pages/user_info.page.dart';
import 'package:seeks_app_prototype/infrastructures/util/keep_alive_wrapper.dart';

class MorePage extends StatefulWidget {
  static String routeName = "/more";
  const MorePage({Key? key}) : super(key: key);

  @override
  _MorePageState createState() => _MorePageState();
}

class _MorePageState extends State<MorePage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      pages: [
        MaterialPage(
          child: Scaffold(
            appBar: appBar(),
            body: body(),
          ),
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      vsync: this,
      length: pages.length,
      initialIndex: tabIndex,
    );
    tabController.addListener(() {
      var idx = tabController.index;
      if (idx != tabIndex) {
        setState(() {
          tabIndex = idx;
          // tabTitle = titles[idx];
        });
      }
    });
  }

  int tabIndex = 1;

  String tabTitle = "title";

  final titles = ["個人訊息", "約會", "更多"];

  final pages = [
    UserInfoPage(),
    UserDatingListPage(),
    KeepAliveWrapper(
      child: Center(child: Text("開發中...")),
    ),
  ];
  final tabs = [
    Container(
      child: Tab(icon: Icon(Icons.account_circle)),
      height: 20,
    ),
    Tab(icon: Icon(Icons.date_range)),
    Tab(icon: Icon(Icons.credit_card)),
  ];

  late TabController tabController;

  body() {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            child: TabBar(
              tabs: tabs,
              indicatorWeight: 3,
              controller: tabController,
            ),
            // color: Colors.lightGreen,
          ),
          Expanded(
            child: Container(
              // color: Colors.amber,
              child: TabBarView(
                controller: tabController,
                children: pages,
              ),
            ),
          ),
          /* Expanded(
              child: Container(
                color: Colors.green,
              ),
            ), */
        ],
      ),
      // child: MoreOageTarBarWidget(),
    );
  }

  appBar() {
    return AppBar(
      elevation: 0.2,
      backgroundColor: colorBarWhite,
      title: Text(
        titles[tabIndex],
        style: TextStyle(
          color: colorFont02,
          fontSize: getProportionateScreenWidth(context, 20),
        ),
      ),
    );
  }
}

class MoreOageTarBarWidget extends StatelessWidget {
  // const MoreOageTarBarWidget({ Key? key }) : super(key: key);

  final pages = [
    KeepAliveWrapper(
      child: Center(child: Text("2.1頁")),
    ),
    KeepAliveWrapper(
      child: Center(child: Text("2.2頁")),
    ),
    KeepAliveWrapper(
      child: Center(child: Text("2.3頁")),
    ),
  ];
  final tabs = [
    Tab(icon: Icon(Icons.account_circle)),
    Tab(icon: Icon(Icons.date_range)),
    Tab(icon: Icon(Icons.stars)),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: tabs.length,
      child: Column(
        children: <Widget>[
          Container(
            child: TabBar(tabs: tabs, indicatorWeight: 5),
            // color: Colors.lightGreen,
          ),
          Expanded(child: TabBarView(children: pages))
        ],
      ),
    );
  }
}
