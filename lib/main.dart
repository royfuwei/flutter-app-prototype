import 'package:flutter/material.dart';
import 'package:seeks_flutter/configs/theme.dart';
import 'package:seeks_flutter/infrastructures/develop/develop_app.dart';
import 'package:seeks_flutter/infrastructures/production/production_app.dart';
import 'package:seeks_flutter/routes.dart';

void main() {
  runApp(DevelopApp());
  // runApp(ProductionApp());
}

RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();
