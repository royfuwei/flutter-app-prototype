import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seeks_app_prototype/core/media/providers/media_image_selector_provider.dart';
import 'package:seeks_app_prototype/infrastructures/develop/getx_develop_app.dart';
import 'package:seeks_app_prototype/infrastructures/fcm/push-notification.dart';
import 'package:seeks_app_prototype/infrastructures/production/getx_production_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PushNotificationManager.getToken();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => MediaImageSelectorProvider(),
      ),
    ],
    child: GetxDevelopApp(),
  ));
  // runApp(GetxProductionApp());
}

RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();
