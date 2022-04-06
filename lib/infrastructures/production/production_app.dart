import 'package:flutter/material.dart';
import 'package:seeks_app_prototype/configs/theme.dart';
import 'package:seeks_app_prototype/core/login/pages/login.page.dart';

class ProductionApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    String title;
    return MaterialApp(
      title: 'Flutter Demo',
      //拿掉畫面右上角的debug
      debugShowCheckedModeBanner: false,
      // dev themeData
      // theme: ThemeData(
      //   primarySwatch: Colors.teal,
      //   visualDensity: VisualDensity.adaptivePlatformDensity,
      //   highlightColor: Color.fromRGBO(0, 0, 0, 0),
      //   splashColor: Color.fromRGBO(0, 0, 0, 0),
      // ),
      theme: theme(),
      // home: AppRoutesPage(),
      initialRoute: LoginPage.routeName,
      // routes: routes,
    );
  }
}
