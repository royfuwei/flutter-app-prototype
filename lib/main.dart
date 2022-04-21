import 'package:flutter/material.dart';
import 'package:seeks_app_prototype/infrastructures/develop/getx_develop_app.dart';
import 'package:seeks_app_prototype/infrastructures/fcm/push-notification.dart';
import 'package:seeks_app_prototype/infrastructures/production/getx_production_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PushNotificationManager.getToken();
  // runApp(GetxDevelopApp());
  runApp(GetxProductionApp());
}

RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();
