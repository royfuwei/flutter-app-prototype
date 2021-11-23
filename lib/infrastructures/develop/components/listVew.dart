import 'package:flutter/material.dart';
import 'package:seeks_flutter/core/captcha/screens/captcha_screen.dart';
import 'package:seeks_flutter/core/entry/screens/entry_screen.dart';
import 'package:seeks_flutter/core/login/screens/login_screen.dart';
import 'package:seeks_flutter/core/login/screens/login_splash_screen.dart';
import 'package:seeks_flutter/core/users/screens/user_create_info_screen.dart';
import 'package:seeks_flutter/core/users/screens/user_create_screen.dart';
import 'package:seeks_flutter/routes.dart';

List<Widget> getTestView(BuildContext context) {
  return <Widget>[
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text('default'),
      onTap: () {
        routePushNamed(context, DevRoutes.defaultPage,
            arguments: {'title': 'Flutter Default Page'});
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text('test_bottom_nav'),
      onTap: () {
        routePushNamedAndRemoveUntil(context, DevRoutes.testBottomNav);
      },
    ),
  ];
}

List<Widget> getDevView(BuildContext context) {
  return <Widget>[
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text('first_page'),
      onTap: () {
        routePushNamed(context, DevRoutes.firstPage);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text('entry_page'),
      onTap: () {
        routePushNamed(context, EntryScreen.routeName);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text('login_page'),
      onTap: () {
        routePushNamed(context, LoginScreen.routeName);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text('login_splash_page'),
      onTap: () {
        routePushNamed(context, LoginSplashScreen.routeName);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text('captcha_page'),
      onTap: () {
        routePushNamed(context, CaptchaScreen.routeName);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text('user_create'),
      onTap: () {
        routePushNamed(context, UserCreateScreen.routeName);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text('user_create_info'),
      onTap: () {
        routePushNamed(context, UserCreateInfoScreen.routeName);
      },
    ),
  ];
}
