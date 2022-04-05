import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seeks_app_prototype/configs/theme.dart';
import 'package:seeks_app_prototype/core/init/controllers/init.controller.dart';
import 'package:seeks_app_prototype/routes/dev_pages.dart';

class GetxDevelopApp extends StatelessWidget {
  InitController initController = Get.put(InitController());
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
  }
}
