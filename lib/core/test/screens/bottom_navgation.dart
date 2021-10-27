import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:seeks_flutter/core/test/screens/default_page.dart';
import 'package:seeks_flutter/view/page/first_page.dart';

import 'account_page.dart';

class TestBottomNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: TestBottomNavigationController(),
      ),
    );
  }
}

class TestBottomNavigationController extends StatefulWidget {
  TestBottomNavigationController({Key? key}) : super(key: key);

  _TestBottomNavigationControllerState createState() =>
      _TestBottomNavigationControllerState();
}

class _TestBottomNavigationControllerState extends State
    with WidgetsBindingObserver {
  //目前選擇頁索引值
  int _currentIndex = 0; //預設值
  final pages = [
    DefaultPage(
      title: "bottom gen default1",
    ),
    FirstPageWidget(),
    FirstPageWidget(),
    FirstPageWidget(),
    AccountView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('bottom navigation'),
      // ),
      body: pages[_currentIndex],
      bottomNavigationBar: SizedBox(
        height: 90,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          // showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: _currentIndex, //目前選擇頁索引值
          fixedColor: Colors.amber, //選擇頁顏色
          onTap: _onItemClick, //BottomNavigationBar 按下處理事件
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.message),
              label: "message",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_box),
              label: "add",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: "notification",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_box),
              label: "account",
            ),
          ],
        ),
      ),
    );

    // return Container();
  }

  @override
  void initState() {
    super.initState();
    //註冊監聽事件
    WidgetsBinding.instance!.addObserver(this);
  }

  void navPop(int index) {
    print("context: $context");

    if (index == 3) {
      // Flutter Navigator 高级用法
      // https://blog.csdn.net/u013894711/article/details/100729879?utm_medium=distribute.pc_relevant.none-task-blog-2%7Edefault%7EBlogCommendFromMachineLearnPai2%7Edefault-1.baidujsUnder6&depth_1-utm_source=distribute.pc_relevant.none-task-blog-2%7Edefault%7EBlogCommendFromMachineLearnPai2%7Edefault-1.baidujsUnder6
      /* Navigator.of(context).pushReplacementNamed('/app'); */
      /* Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => AppRoutesPage()),
        ModalRoute.withName('/'),
      ); */
      /* Navigator.of(context).pushNamedAndRemoveUntil(
        '/',
        ModalRoute.withName('/'),
      ); */
      // 回上層
      /* Navigator.pop(context); */
      // 回跳兩層
      /* Navigator.of(context)..pop()..pop(); */
      // 回去指定，但是會有堆疊紀錄
      /* Navigator.pushNamed(
        context,
        '/',
      ); */
    }
  }

  void _onItemClick(int index) {
    setState(() {
      navPop(index);
      _currentIndex = index;
    });
  }
}
