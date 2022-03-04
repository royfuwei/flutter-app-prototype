import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seeks_app_prototype/core/dating/screens/dating_add_screen.dart';
import 'package:seeks_app_prototype/core/main/components/nav_pages.dart';
import 'package:seeks_app_prototype/routes.dart';

class MainScreen extends StatefulWidget {
  static String routeName = "main";
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navPages[currentIndex],
      bottomNavigationBar: CupertinoTabBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            if (index == 2) {
              routePushNamed(context, DatingAddScreen.routeName);
            } else {
              currentIndex = index;
            }
          });
        },
        backgroundColor: Colors.black54,
        activeColor: Colors.white,
        inactiveColor: Colors.grey,
        items: navPagesBottomBarItems,
      ),
    );
  }
}
