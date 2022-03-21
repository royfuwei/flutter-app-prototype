import 'package:flutter/material.dart';
import 'package:seeks_app_prototype/core/dating/pages/dating_add.page.dart';
import 'package:seeks_app_prototype/core/home/pages/home.page.dart';
import 'package:seeks_app_prototype/core/chat/pages/chat_list.page.dart';
import 'package:seeks_app_prototype/core/more/pages/more.page.dart';
import 'package:seeks_app_prototype/core/notification/pages/notfication.page.dart';

List<Widget> navPages = [
  HomePage(),
  NotificationPage(),
  DatingAddPage(),
  ChatListPage(),
  MorePage(),
];

List<BottomNavigationBarItem> navPagesBottomBarItems = [
  BottomNavigationBarItem(
    icon: Icon(Icons.home),
    label: "首頁",
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.notifications),
    label: "通知",
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.add_box_rounded),
    label: "新增約會",
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.message),
    label: "聊天",
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.more_vert),
    label: "更多",
  ),
];
