import 'package:flutter/material.dart';
import 'package:seeks_app_prototype/core/dating/screens/dating_add_screen.dart';
import 'package:seeks_app_prototype/core/home/screens/home_screen.dart';
import 'package:seeks_app_prototype/core/chat/screens/chat_list_screen.dart';
import 'package:seeks_app_prototype/core/more/screens/more_screen.dart';
import 'package:seeks_app_prototype/core/notification/screens/notfication_screen.dart';

List<Widget> navPages = [
  HomeScreen(),
  NotificationScreen(),
  DatingAddScreen(),
  ChatListScreen(),
  MoreScreen(),
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
