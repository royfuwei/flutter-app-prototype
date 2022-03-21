import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seeks_app_prototype/configs/theme.dart';
import 'package:seeks_app_prototype/routes/dev_pages.dart';

class GetxDevelopApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme(),
      initialRoute: DevPages.initPage,
      getPages: DevPages.routes,
      enableLog: true,
    );
    /* return MaterialApp(
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
      // darkTheme: ThemeData.dark(),
      // home: AppRoutesPage(),
      initialRoute: DevEntryPage.routeName,
      routes: routes,
    ); */
  }
}
