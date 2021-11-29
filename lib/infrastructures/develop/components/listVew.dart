import 'package:flutter/material.dart';
import 'package:seeks_flutter/core/captcha/screens/captcha_screen.dart';
import 'package:seeks_flutter/core/dating/screens/dating_add_screen.dart';
import 'package:seeks_flutter/core/entry/screens/entry_screen.dart';
import 'package:seeks_flutter/core/home/screens/home_screen.dart';
import 'package:seeks_flutter/core/image/screens/image_upload.dart';
import 'package:seeks_flutter/core/location/screens/location_open_screen.dart';
import 'package:seeks_flutter/core/login/screens/login_screen.dart';
import 'package:seeks_flutter/core/login/screens/login_splash_screen.dart';
import 'package:seeks_flutter/core/main/screens/main_screen.dart';
import 'package:seeks_flutter/core/message/screens/message_screen.dart';
import 'package:seeks_flutter/core/more/screens/more_screen.dart';
import 'package:seeks_flutter/core/notification/screens/notfication_screen.dart';
import 'package:seeks_flutter/core/notification/screens/notification_open_screen.dart';
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
      title: Text(EntryScreen.routeName),
      onTap: () {
        routePushNamed(context, EntryScreen.routeName);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(LoginScreen.routeName),
      onTap: () {
        routePushNamed(context, LoginScreen.routeName);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(LoginSplashScreen.routeName),
      onTap: () {
        routePushNamed(context, LoginSplashScreen.routeName);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(CaptchaScreen.routeName),
      onTap: () {
        routePushNamed(context, CaptchaScreen.routeName);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(UserCreateScreen.routeName),
      onTap: () {
        routePushNamed(context, UserCreateScreen.routeName);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(LocationOpenScreen.routeName),
      onTap: () {
        routePushNamed(context, LocationOpenScreen.routeName);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(NotificationOpenScreen.routeName),
      onTap: () {
        routePushNamed(context, NotificationOpenScreen.routeName);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(ImageUploadScreen.routeName),
      onTap: () {
        routePushNamed(context, ImageUploadScreen.routeName);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(UserCreateInfoScreen.routeName),
      onTap: () {
        routePushNamed(context, UserCreateInfoScreen.routeName);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(MainScreen.routeName),
      onTap: () {
        routePushNamed(context, MainScreen.routeName);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(HomeScreen.routeName),
      onTap: () {
        routePushNamed(context, HomeScreen.routeName);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(NotificationScreen.routeName),
      onTap: () {
        routePushNamed(context, NotificationScreen.routeName);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(DatingAddScreen.routeName),
      onTap: () {
        routePushNamed(context, DatingAddScreen.routeName);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(MessageScreen.routeName),
      onTap: () {
        routePushNamed(context, MessageScreen.routeName);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(MoreScreen.routeName),
      onTap: () {
        routePushNamed(context, MoreScreen.routeName);
      },
    ),
  ];
}
