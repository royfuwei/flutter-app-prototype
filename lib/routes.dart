import 'package:flutter/material.dart';
import 'package:seeks_flutter/core/captcha/screens/captcha_screen.dart';
import 'package:seeks_flutter/core/dating/screens/dating_add_screen.dart';
import 'package:seeks_flutter/core/entry/screens/entry_screen.dart';
import 'package:seeks_flutter/core/forgot_password/screens/forgot_password_screen.dart';
import 'package:seeks_flutter/core/home/screens/home_screen.dart';
import 'package:seeks_flutter/core/image/screens/image_picker.dart';
import 'package:seeks_flutter/core/image/screens/image_upload.dart';
import 'package:seeks_flutter/core/location/screens/location_open_screen.dart';
import 'package:seeks_flutter/core/login/screens/login_screen.dart';
import 'package:seeks_flutter/core/main/screens/main_screen.dart';
import 'package:seeks_flutter/core/message/screens/message_screen.dart';
import 'package:seeks_flutter/core/more/screens/more_screen.dart';
import 'package:seeks_flutter/core/notification/screens/notfication_screen.dart';
import 'package:seeks_flutter/core/notification/screens/notification_open_screen.dart';
import 'package:seeks_flutter/core/splash/screens/splash_screen.dart';
import 'package:seeks_flutter/core/test/screens/bottom_navgation.dart';
import 'package:seeks_flutter/core/test/screens/default_page.dart';
import 'package:seeks_flutter/core/test/screens/dev_carousel_silder.dart';
import 'package:seeks_flutter/core/test/screens/dev_image_cropper.dart';
import 'package:seeks_flutter/core/test/screens/dev_image_picker.dart';
import 'package:seeks_flutter/core/test/screens/dev_image_ig_picker.dart';
import 'package:seeks_flutter/core/test/screens/dev_image_pickers.dart';
import 'package:seeks_flutter/core/users/screens/user_create_info_screen.dart';
import 'package:seeks_flutter/core/users/screens/user_create_screen.dart';

import 'core/login/screens/login_splash_screen.dart';
import 'infrastructures/develop/screens/develop_screens.dart';

class DevRoutes {
  static final home = '/';
  static final defaultPage = '/default';
  static final firstPage = '/first_page';
  static final testBottomNav = '/test_bottom_nav';
}

late String title;
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  EntryScreen.routeName: (context) => EntryScreen(),
  LoginScreen.routeName: (context) => LoginScreen(),
  LoginSplashScreen.routeName: (context) => LoginSplashScreen(),
  UserCreateScreen.routeName: (context) => UserCreateScreen(),
  LocationOpenScreen.routeName: (context) => LocationOpenScreen(),
  NotificationOpenScreen.routeName: (context) => NotificationOpenScreen(),
  ImageUploadScreen.routeName: (context) => ImageUploadScreen(),
  ImagePickerScreen.routeName: (context) => ImagePickerScreen(),
  UserCreateInfoScreen.routeName: (context) => UserCreateInfoScreen(),
  CaptchaScreen.routeName: (context) => CaptchaScreen(),
  MainScreen.routeName: (context) => MainScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  NotificationScreen.routeName: (context) => NotificationScreen(),
  MessageScreen.routeName: (context) => MessageScreen(),
  DatingAddScreen.routeName: (context) => DatingAddScreen(),
  MoreScreen.routeName: (context) => MoreScreen(),
  DevImagePicker.routeName: (context) => DevImagePicker(),
  DevImagePickers.routeName: (context) => DevImagePickers(),
  DevImageIGPicker.routeName: (context) => DevImageIGPicker(),
  DevImageCropper.routeName: (context) => DevImageCropper(),
  DevCarouselSlider.routeName: (context) => DevCarouselSlider(),
  DevRoutes.defaultPage: (BuildContext context) {
    dynamic obj = ModalRoute.of(context)!.settings.arguments;
    print('obj: $obj');
    print('value: $context');
    title = obj["title"]; // 把接收到的參數存到變數
    return new DefaultPage(title: title);
  },
  DevRoutes.testBottomNav: (_) => new TestBottomNavigationController(),
  DevRoutes.home: (_) => new DevEntryPage(), //route 為onBoarding，就開啟onBoarding 頁
  LoginScreen.routeName: (context) => new LoginScreen(),
  ForgotPasswordScreen.routeName: (context) => new ForgotPasswordScreen(),
};

void routePushNamed(BuildContext context, String route, {Object? arguments}) {
  Navigator.of(context).pushNamed(
    route,
    arguments: arguments,
  );
}

void routePushNamedAndRemoveUntil(BuildContext context, String route,
    {Object? arguments}) {
  Navigator.of(context).pushNamedAndRemoveUntil(
    route,
    (route) => false,
    arguments: arguments,
  );
}
