import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seeks_app_prototype/configs/theme.dart';
import 'package:seeks_app_prototype/core/media/providers/media_image_selector_provider.dart';
import 'package:seeks_app_prototype/infrastructures/develop/develop_app.dart';
import 'package:seeks_app_prototype/infrastructures/production/production_app.dart';
import 'package:seeks_app_prototype/routes.dart';

void main() {
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
