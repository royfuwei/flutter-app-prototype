import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seeks_app_prototype/core/dating/pages/dating_add_images.page.dart';
import 'package:seeks_app_prototype/core/main/components/nav_pages.dart';
import 'package:seeks_app_prototype/infrastructures/util/getx_routes.dart';

class MainPage extends StatefulWidget {
  static String routeName = "/main";
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navPages[currentIndex],
      /* body: IndexedStack(
        index: currentIndex,
        children: navPages,
      ), */
      bottomNavigationBar: CupertinoTabBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            if (index == 2) {
              toRoutesNamed([
                MainPage.routeName,
                DatingAddImagesPage.routeName,
              ]);
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
