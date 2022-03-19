import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seeks_app_prototype/core/media/providers/media_image_selector_provider.dart';
import 'package:seeks_app_prototype/infrastructures/develop/develop_app.dart';
import 'package:seeks_app_prototype/infrastructures/fcm/push-notification.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PushNotificationManager.getToken();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => MediaImageSelectorProvider(),
      ),
    ],
    child: DevelopApp(),
  ));
  // runApp(DevelopApp());
  // runApp(ProductionApp());
}

RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();
