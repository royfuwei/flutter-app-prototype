import 'package:flutter/material.dart';
import 'package:seeks_app_prototype/configs/theme.dart';
import 'package:seeks_app_prototype/infrastructures/develop/develop_app.dart';
import 'package:seeks_app_prototype/infrastructures/production/production_app.dart';
import 'package:seeks_app_prototype/routes.dart';

void main() {
  runApp(DevelopApp());
  // runApp(ProductionApp());
}

RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();
